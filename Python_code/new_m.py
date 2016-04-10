__author__ = 'nrot'

# -*- coding: utf-8 -*-

# !C:\Python34

import pickle
import tornado.web
import tornado.escape
from tornado import gen


class NewMessage(tornado.web.RequestHandler):
    @gen.coroutine
    def post(self):
        import time
        import mysql.connector
        # import os
        # self.write("<p>" + str(os.getcwd()) + "</p>")
        # self.write("<p>" + str(os.listdir()) + "</p>")

        now_time = time.strftime("%d_%m_%Y")
        if self.request.body:
            data = tornado.escape.json_decode(self.request.body)
        else:
            self.write("Empty date")
            return "Empty date"
        # self.write(data)
        with open("Pickle/Options.pickle", "rb") as f:
            options = pickle.load(f)
        try:
            self.connect_mysql = mysql.connector.connect(host="localhost", database=options["data_base_name"],
                                                         user=options["user_db"],
                                                         password=options["password_db"])
            self.cursor = self.connect_mysql.cursor()

        except:
            # print("Can`t connect to MySQL server")
            self.write("Can`t connect to MySQL server")
            return "Can`t connect to MySQL server"

        if data["type"] != "new_massage":
            self.write('"error":true')
            self.connect_mysql.close()
            return
        sql = "select user_unique_id from chat_user where nick='{nick}'".format(nick=data["nick"])
        # print(sql)
        self.cursor.execute(sql)
        user_id = self.cursor.fetchone()
        # print(user_id)
        if user_id is None:
            error_out = "{"
            error_out += '"error":true, "type":"Bad_nick", "argm":"{nick}"'.format(nick=data["nick"])
            error_out += "}"
            self.write(error_out)
            return
        user_id = user_id[0]
        sql = "insert into {chat} (user_unique_id, user_text, message_time) values({user_id},'{text}' , now());".format(
            text=data["message"], user_id=user_id, chat=data["chat"])
        print(sql)
        self.cursor.execute(sql)
        self.write('{"error":"0"}')
        self.cursor.execute("commit;")
        self.connect_mysql.close()
        return
