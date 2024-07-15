# IntroMovies by Cipo Team

## Install

```bash
python3 -m venv venv
source venv/bin/activate
pip install flask
```

## Run back part

First, change to the directory where the path 'cipo' is

```bash
cd ./back
python3 main.py
```

## Run front part

By using the app Visual Studio Code, you can install the extension 'Live Server' so you can click a button on the bottom part of the window app that says 'Go Live'. That would take you to an Internet app (for example Mozilla Firefox) and show you our website.

If you want to see our website just using shell commands without installing anything, you should open another bash terminal and write the following lines:

```bash
cd ./frontend
http-server -p 3000
```

## Database use

We have the database information inside 'mi_base_de_datos_backup.sql' so you can create both tables and also download the information of the movies. There are no reviews in that file so no movie would have a review initially. Don't worry, people would submit them for you!

## Click here to go to IntroMovies: http://127.0.0.1:5500/frontend/