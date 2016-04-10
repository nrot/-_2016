#!C:\Python35

# -*- coding: utf-8 -*-

import tornado.web


class index(tornado.web.RequestHandler):
    def get(self):
        self.render("../templates/index.html", )

        # import os
        # self.write("<p>" + str(os.getcwd()) + "</p>")
        # self.write("<p>" + str(os.listdir()) + "</p>")
