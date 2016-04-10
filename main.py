import os
import json
import pickle

import tornado.ioloop
import tornado.web
import tornado.httpserver

import Python_code.index
import Python_code.chat_main
import Python_code.new_m
import Python_code.update
import Python_code.login
import Python_code.registration
# import Python_code.chat

# -*- coding: utf-8 -*-

if __name__ == "__main__":
    try:
        file_option = open("options.json")
    except:
        print("ERROR: Create options.json file using template_option.json")
        exit()
    options = json.loads(''.join(file_option.readlines()))

    try:
        with open("Pickle/Options.pickle", "wb") as f:
            pickle.dump(options, f)
    except:
        os.mkdir("Pickle")
        with open("Pickle/Options.pickle", "wb") as f:
            pickle.dump(options, f)
    # print("dict: ", end="")
    # print(options)
    application = tornado.web.Application(handlers=[
        (r"/", Python_code.index.index),
        (r"/chat_main", Python_code.chat_main.Chat_Main),
        # (r"/chat/", Python_code.chat.Chat)
        (r"/new_m/", Python_code.new_m.NewMessage),
        (r"/update/", Python_code.update.UpdateMessage),
        (r"/login", Python_code.login.Login),
        (r"/registration", Python_code.registration.Registration),
    ],
        # debug=True,
        static_path=os.path.join(os.path.dirname(__file__), "client_base"),
        # autoreload=True,
        # "xsrf_cookies": True,
    )
    # application.listen(1488)
    server = tornado.httpserver.HTTPServer(application)
    server.bind(options["server_port"])
    server.start(options["amount_multi_process"])
    tornado.ioloop.IOLoop.current().start()
