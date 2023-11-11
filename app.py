import os
from flask import Flask
app = Flask(__name__)

@app.route("/")
def main():
    return "How are you!"

@app.route('/how are you')
def hello():
    return 'I am good, how about you?'

@app.route('/check')
def check():
    return 'Verification in progress ...'

@app.route('/training')
def check():
    return 'Training in progress ...'

if __name__ == "__main__":
    app.run()
