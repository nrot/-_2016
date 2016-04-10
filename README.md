# Чат.

### Требования к системе
 - Python 3.4
 - Tornado 4.3+ for Python 3.4
 - MySQL Server 5.7 (community)
 - MySQL Connector for Python 3.4
 - Linux (core 3.0+)
 
### Установка (Только для Linux)

 - Копирование репозитария
    ```sh
    $ git clone https://github.com/nrot/Simple_chat 
    ```

 - Установка pip для python 3.4 (иногда не установлен по умолчанию)
     ```sh
     $ sudo apt-get install python3-pip
     ```
 
 -  Установка tornado
     ```sh 
     $ sudo python3 -m pip install tornado
     ```
 
 - Установка MySQL и компонентов
 
    Вам надо скачать и установить [APT Mysql] репозиторий для вашей системы.
    Процесс установки описывать не буду так как он зависит от вашего дистрибутива.
    ### Во время установки вам надо выбрать MySQL 5.7 и коннекторы (connectors) 
    ```sh 
    $ sudo apt-get update
    $ sudo apt-get install mysql-server-community
    $ sudo apt-get install mysql-workbench
    ```
    ### Так же вам нужны коннекторы [MySQL connectors Python]
     Скачайте и установите [MySQL connectors Python] для вашей системы, аккуратней вам нужно выбрать для вашей системы и для python3.4 
     
 
### Запуск и настройка
  - Настройка 
    - Настройка MySQL Server
    ```sh
    $ cd Simple_chat
    /Simple_chat/$ mysql -u root -p
    mysql> create database 'name_db';
    mysql> use 'name_db';
    mysql> source Create_tables.sql;
    mysql> create user 'user_db'@'localhost' identified by 'password_db';
    mysql> grant create,insert,select,drop,show on 'name_db'.* to 'user_db'@'localhost';
    mysql> flush privileges;
    mysql> commit;
    mysql> exit;
    ```
    Скопируйте и переименуйте файл шаблон настроек
    ```sh
    /Simple_chat/$ cp Tample_option.json options.json 
    ```
    Откройте файл настроек и измените настройки (все настройки прокоментированны)
  - Запуск 
    ```sh
    /Simple_chat/$ python3 main.py
    ```
 
 [//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)
 [APT Mysql]: <http://dev.mysql.com/downloads/repo/apt/>
 [MySQL connectors Python]: <http://dev.mysql.com/downloads/connector/python/>