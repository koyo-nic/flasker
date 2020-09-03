#!/usr/bin/env python
#-*-coding:utf-8 -*-

from datetime import datetime

from flask import Flask, render_template

from . import app

@app.route('/')
def home() -> None:
    return render_template('home.html')

@app.route('/about/')
def about() ->None:
    return render_template('about.html')

@app.route('/contact/')
def contact() ->None:
    return render_template('contact.html')

@app.route('/hello/')
@app.route('/hello/<name>')
def hello_there() -> None:
    return render_template(
        'hello_there.html',
        name=name,
        date=datetime.now()
        )

@app.route("/api/data")
def get_data():
    return app.send_static_file("data.json")