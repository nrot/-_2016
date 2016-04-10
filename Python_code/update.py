__author__ = 'nrot'

# -*- coding: utf-8 -*-

# !C:\Python34
from tornado import gen
import pickle

import tornado.web


class UpdateMessage(tornado.web.RequestHandler):
    @gen.coroutine
    def post(self):
        import time
        import mysql.connector
        # import os
        # self.write("<p>" + str(os.getcwd()) + "</p>")
        # self.write("<p>" + str(os.listdir()) + "</p>")

        with open("Pickle/Options.pickle", "rb") as f:
            options = pickle.load(f)

        now_time = time.strftime("%d_%m_%Y")
        if self.request.body:
            data = tornado.escape.json_decode(self.request.body)
        else:
            self.write("Empty date")
            return "Empty date"
        # self.write(data)
        try:
            self.connect_mysql = mysql.connector.connect(host="localhost", database=options["data_base_name"],
                                                         user=options["user_db"],
                                                         password=options["password_db"])
            self.cursor = self.connect_mysql.cursor()

        except:
            # print("Can`t connect to MySQL server")
            self.write("Can`t connect to MySQL server")
            return "Can`t connect to MySQL server"

        if data["type"] != "update":
            self.write('{"error":true}')
            return

        import time
        sql = """show table status where name='{chat}'""".format(chat=data["chat"])
        self.cursor.execute(sql)
        amount_db = int(self.cursor.fetchone()[4])
        if int(data["number"]) == 0:
            amount_client = amount_db - 20
        else:
            amount_client = int(data["number"])
        sleep = 0.1
        n = 25 / sleep
        i = 0
        while amount_db <= amount_client and i < n:
            time.sleep(sleep)
            self.cursor.execute(sql)
            amount_db = int(self.cursor.fetchone()[4])
            i += 1
        if i >= n:
            self.write('{"nothing":true}')
            return
        self.cursor.execute(sql)
        amount_db = int(self.cursor.fetchone()[4])
        if amount_db > amount_client:
            sql = "select user_unique_id, user_text from {chat} order by -message_time limit {amount};".format(
                amount=(amount_db - amount_client), chat=data["chat"])
            self.cursor.execute(sql)
            messages = self.cursor.fetchall()
            messages.reverse()
            # print(messages)
            nicks = '"nicks": ['
            messages_part = '"messages": ['
            answer = '{"nothing":false, '
            answer += '"chat": "{id}",'.format(id=data["chat"])
            answer += '"amount": {n},'.format(n=amount_db)
            for i in range(len(messages)):
                sql = "select nick from chat_user where user_unique_id={uui}".format(uui=messages[i][0])
                self.cursor.execute(sql)
                fetchone = self.cursor.fetchone()
                if fetchone is None:
                    nick = "Deleted User"
                else:
                    nick = str(fetchone[0])
                nicks += '"{nick}",'.format(nick=nick)
                print(messages[i][1])
                try:
                    messages_part += '"{me}",'.format(me=messages[i][1].decode("utf-8"))
                except:
                    messages_part += '"{me}",'.format(me=messages[i][1])
            if nicks[len(nicks) - 1] == ",":
                nicks = nicks[:len(nicks) - 1]
            if messages_part[len(messages_part) - 1] == ",":
                messages_part = messages_part[:len(messages_part) - 1]
            answer += nicks + "],"
            answer += messages_part + "]"
            answer += "}"
            self.write(answer)
            self.connect_mysql.close()
            return
        else:
            self.write('{"nothing":true}')
