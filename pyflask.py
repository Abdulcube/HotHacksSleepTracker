from flask import Flask, render_template, url_for, flash, redirect, send_file, Markup
from forms import RegistrationForm, LoginForm
import pandas as pd
import numpy as np
import matplotlib.pyplot as plot



app = Flask(__name__)


@app.route("/")
@app.route("/home")
def home():
    return render_template('home.html')

@app.route("/sleep")
def sleep():
    return render_template('sleepdata.html', title = 'Sleep Data')

@app.route("/register")
def register():
    form = RegistrationForm()
    if form.validate_on_submit():
        flash(f'Account created for {form.username.data}!', 'success')
        return redirect(url_for('home'))
    return render_template('register.html', title='Register', form=form)


@app.route("/login")
def login():
    form = LoginForm()
    if form.validate_on_submit():
        if form.email.data == 'admin@blog.com' and form.password.data == 'password':
            flash('You have been logged in!', 'success')
            return redirect(url_for('home'))
        else:
            flash('Login Unsuccessful. Please check username and password', 'danger')
    return render_template('login.html', title='Login', form=form)


#displays graphs, from xlsx files


if __name__ == '__main__':
    app.run(debug=True)
	
