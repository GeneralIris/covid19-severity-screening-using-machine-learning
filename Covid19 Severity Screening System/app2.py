from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'covid19_db'

mysql = MySQL(app)


@app.route("/", methods=['POST', 'GET'])
def record():

    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cur.execute("SELECT * FROM patients")
    patients = cur.fetchall()

    return render_template('basic_table.html', patients=patients)


if __name__ == '__main__':
    app.run(debug=True)