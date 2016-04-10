#!C:\Python35

# -*- coding: utf-8 -*-

import tornado.web


class Chat_Main(tornado.web.RequestHandler):
    def get(self):
        self.render("../templates/Chat_main.html")
        # import os
        # self.write("<p>" + str(os.getcwd()) + "</p>")
        # self.write("<p>" + str(os.listdir()) + "</p>")
        # tample = open("templates/Chat_main.html")
        # for line in tample:
        #  self.write(str(line),end="")
