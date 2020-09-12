from flask import Flask, render_template, url_for, flash, redirect
from forms import RegistrationForm, LoginForm
from datetime import date
app = Flask(__name__)

app.config['SECRET_KEY']= '3a22684e1daddc472ed4211d667d0fb6'


@app.route("/")
@app.route("/home")
def home():
    return render_template('home.html')

@app.route("/sleep")
def sleep():
    return render_template('sleepdata.html', title = 'Sleep Data')

@app.route("/register", methods=['GET', 'POST'])
def register():
    form = RegistrationForm()
    if form.validate_on_submit():
        flash(f'Account created for {form.username.data}!', 'success')
        return redirect(url_for('home'))
    return render_template('register.html', title='Register', form=form)


@app.route("/login", methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        if form.email.data == 'admin@blog.com' and form.password.data == 'password':
            flash('You have been logged in!', 'success')
            return redirect(url_for('home'))
        else:
            flash('Login Unsuccessful. Please check username and password', 'danger')
    return render_template('login.html', title='Login', form=form)


if __name__ == '__main__':
    app.run(debug=True)
    
