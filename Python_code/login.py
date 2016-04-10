__author__ = 'nrot'

import tornado.web
import pickle
from tornado import gen


class Login(tornado.web.RequestHandler):
    @gen.coroutine
    def get(self):
        self.render("../templates/login.html", styles=["", ""])

    @gen.coroutine
    def post(self):

        import mysql.connector

        with open("Pickle/Options.pickle", "rb") as f:
            options = pickle.load(f)
        try:
            self.connect_mysql = mysql.connector.connect(host="localhost", database=options["data_base_name"],
                                                         user=options["user_db"],
                                                         password=str(options["password_db"]))
            self.cursor = self.connect_mysql.cursor()

        except:
            # print("Can`t connect to MySQL server")
            self.write("Can`t connect to MySQL server")
            return "Can`t connect to MySQL server"
        style_error = 'style=color:red;'

        nick = self.get_argument("nick")
        password = self.get_argument("password")
        error = False

        errors = ["", ""]

        sql = "select nick from chat_user where nick='{nick}' and user_password=sha2('{password}', 256)".format(nick=nick,
                                                                                                         password=password)
        self.cursor.execute(sql)
        fetchone = self.cursor.fetchone()
        if fetchone is None:
            error = True
            errors[0] = style_error
            errors[1] = style_error

        if error:
            self.render("../templates/login.html", stules=errors)
        else:
            self.set_cookie("nick_name", nick)
            self.set_cookie("last_message", "0")
            self.redirect("/chat_main")
