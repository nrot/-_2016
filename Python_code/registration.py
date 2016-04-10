__author__ = 'nrot'

# -*- coding: utf-8 -*-

import tornado.web
from tornado import gen
import pickle


class Registration(tornado.web.RequestHandler):
    @gen.coroutine
    def get(self):
        self.render("../templates/registration.html", styles=["", "", "", ""])

    @gen.coroutine
    def post(self):

        import mysql.connector
        import re

        with open("Pickle/Options.pickle", "rb") as f:
            options = pickle.load(f)

        try:
            self.connect_mysql = mysql.connector.connect(host="localhost",
                                                         database=options["data_base_name"],
                                                         user=options["user_db"],
                                                         password=options["password_db"],
                                                         charset='utf8')
            self.cursor = self.connect_mysql.cursor()

        except:
            # print("Can`t connect to MySQL server")
            self.write("Can`t connect to MySQL server")
            return "Can`t connect to MySQL server"

        style_error = 'style=color:red;'

        nick = self.get_argument("nick")
        password = self.get_argument("password")
        re_password = self.get_argument("re_password")
        email = self.get_argument("email")
        error = False
        errors = ["", "", "", ""]
        if password != re_password or len(password) < 6:
            errors[1] = style_error
            errors[2] = style_error
            error = True

        sql = "select nick from chat_user where nick='{nick}'".format(nick=nick)
        self.cursor.execute(sql)
        # print(self.cursor.fetchone())
        if self.cursor.fetchone() or len(nick) < 4:
            errors[0] = style_error
            error = True

        sql = "select email from chat_user where email='{email}'".format(email=email)
        self.cursor.execute(sql)
        # print(self.cursor.fetchone())

        if self.cursor.fetchone() or re.findall(r'\w+@\w+\.\w+', email) is None:
            errors[3] = style_error
            error = True

        if error:
            self.render("../templates/registration.html", styles=errors)
        else:
            sql = "insert into chat_user (nick, user_password, email, time_registration)" \
                  " values ('{nick}', sha2('{password}', 256), '{email}', now());".format(
                nick=nick, password=password, email=email)
            self.cursor.execute(sql)
            self.cursor.execute("commit;")
            self.set_cookie("nick_name", nick)
            self.set_cookie("last_message", "0")
            self.render("../templates/registration_done.html")
