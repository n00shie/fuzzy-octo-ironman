from flask import Flask
from subprocess import Popen
from subprocess import PIPE


app = Flask(__name__)

def up():
    print('start gnunet-arm service')
    process = Popen(['gnunet-arm', '-s'], stdout=PIPE, stderr=PIPE)
    
def down():    
    print('end gnunet-arm service')
    process = Popen(['gnunet-arm', '-e'], stdout=PIPE, stderr=PIPE)

@app.route('/id')
def test():
    process = Popen(['gnunet-identity', '-d'], stdout=PIPE, stderr=PIPE)
    out, err = process.communicate()    
    errcode = process.returncode
    return out

if __name__ == '__main__':
    try:
        up()
        app.run(host="0.0.0.0")
    finally:
        # your "destruction" code
        down()
        
