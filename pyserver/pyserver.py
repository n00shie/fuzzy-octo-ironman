from flask import Flask
from subprocess import Popen
from subprocess import PIPE
app = Flask(__name__)

@app.route('/id')
def test():
    process = Popen(['gnunet-identity', '-d'], stdout=PIPE, stderr=PIPE)
    out, err = process.communicate()    
    errcode = process.returncode
    return out

if __name__ == '__main__':    
    app.run(host='0.0.0.0')
