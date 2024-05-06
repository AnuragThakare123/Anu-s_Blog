import os.path

from flask import Flask, render_template,request,session,redirect,flash
from flask_sqlalchemy import SQLAlchemy
# from werkzeug import secure
from werkzeug.utils import secure_filename
from sqlalchemy.orm import Mapped
from flask_mail import Mail
import json
import math
from datetime import datetime
from flask import flash


with open('config.json','r') as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
      MAIL_SERVER = 'smtp.gmail.com',
      MAIL_PORT='465',
      MAIL_USE_SSL = True,
      MAIL_USERNAME =params['gmail-user'],
      MAIL_PASSWORD =params['gmail-password']
)
mail = Mail(app)
if(local_server):
    app.config["SQLALCHEMY_DATABASE_URI"] = params['local_uri']
else:
    app.config["SQLALCHEMY_DATABASE_URI"] = params['prod_uri']

db = SQLAlchemy(app)


class Contacts(db.Model):
    __tablename__ = 'contacts'

    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80),nullable=False)
    email = db.Column(db.String(120),nullable=False)
    phone_num = db.Column(db.String(12),nullable=False)
    mess = db.Column(db.String(120),nullable=False)
    date = db.Column(db.String(20),nullable=True)


class Posts(db.Model):
    __tablename__ = 'posts'

    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80),nullable=False)
    tagline = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(21),nullable=False)
    content = db.Column(db.String(120),nullable=False)
    img_file = db.Column(db.String(80), nullable=True)
    date = db.Column(db.String(20),nullable=True)


import math
from flask import request, render_template

@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts) / int(params['no_of_posts']))

    page = int(request.args.get('page', 1))
    if page < 1:
        page = 1
    elif page > last:
        page = last

    start_index = (page - 1) * int(params['no_of_posts'])
    end_index = start_index + int(params['no_of_posts'])
    posts = posts[start_index:end_index]

    if page == 1:
        prev_page = "#"
        next_page = "/?page=" + str(page + 1)
    elif page == last:
        prev_page = "/?page=" + str(page - 1)
        next_page = "#"
    else:
        prev_page = "/?page=" + str(page - 1)
        next_page = "/?page=" + str(page + 1)

    return render_template('index.html', params=params, posts=posts, prev=prev_page, next=next_page)


@app.route("/about")
def about():
    return render_template('about.html',params=params)

@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():
    if 'user' in session and session['user'] == params['admin_user']:
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params,posts=posts)

    if request.method == 'POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if username == params['admin_user'] and userpass == params['admin_password']:
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params=params,posts=posts)

    return render_template('login.html', params=params)


@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        date = datetime.now()  # Define date variable outside the conditional block

        if request.method == 'POST':
            box_title = request.form.get('title')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')

            if sno == '0':
                post = Posts(title=box_title, tagline=tline, slug=slug, content=content, img_file=img_file, date=date)
                db.session.add(post)
                db.session.commit()
                flash("Your Post has been successfully submitted. Thank you!", "success")


            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.tagline = tline
                post.slug = slug
                post.content = content
                post.img_file=img_file
                post.date = date
                db.session.commit()
                flash("Your Post has been successfully submitted. Thank you!", "success")
                return redirect('/edit/'+sno)
    post = Posts.query.filter_by(sno=sno).first()
    return render_template('edit.html', params=params, post=post, date=date,sno=sno)


@app.route("/uploader",methods = ['GET', 'POST'])
def uploader():
    if ('user' in session and session['user'] == params['admin_user']):
         if (request.method == 'POST'):
             f = request.files['file1']
             f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))
             return "Uploaded successfully "

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route("/delete/<string:sno>", methods=['GET', 'POST'])
def delete(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')



@app.route("/contact",methods = ['GET', 'POST'])
def bootstrap():
    if(request.method=='POST'):
        ''' Add entry to the database'''
        name =request.form.get('name')
        email =request.form.get('email')
        phone =request.form.get('phone')
        message =request.form.get('message')
        entry = Contacts(name=name,phone_num=phone,email=email,date=datetime.now(),mess=message)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from' + name,
                               sender=email,
                               recipients=[params['gmail-user']],
                               body= message + "\n" + phone
                          )
        flash("Your details have been successfully submitted. Thank you!","success")
    return render_template('contact.html',params=params)


@app.route("/post/<string:post_slug>",methods=['GET'])
def post(post_slug):
    post = Posts.query.filter_by(slug = post_slug).first()
    return render_template('post.html',params=params,post=post)



if __name__ == "__main__":
    app.run(debug=True)