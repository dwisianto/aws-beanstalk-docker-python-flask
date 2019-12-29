#!/usr/bin/env python

from flask import *

# The WSGI configuration on Elastic Beanstalk requires 
# the callable be named 'application' by default.
application = Flask(__name__)


@application.route('/', methods=['GET'])
def index():
    return jsonify({'message': 'Welcome to PyCon KE 2017!'})


@application.route('/hello/<string:name>', methods=['GET'])
def hello(name):
    message = 'Hello, {}. Welcome to PyCon KE 2017!'.format(name)
    return jsonify({'message': message})

@application.route("/page1")
def page1():
	return render_template('index.html')

@application.route("/page2")
def page2():
	return render_template('page2.html')

if __name__ == '__main__':
    application.run(host='0.0.0.0', port=5000)
