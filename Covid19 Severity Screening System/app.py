from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
import pickle
import numpy as np

app = Flask(__name__)

# this secret key is to enable session
app.secret_key = 'covid19'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'covid19_db'

mysql = MySQL(app)


@app.route('/', methods=['GET', 'POST'])
def login():
    msg = ''
    # Check if "username" and "password" exist in the 
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form:

        username = request.form['username']
        password = request.form['password']

        # Check if account exists 
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM users WHERE username = %s AND password = %s', (username, password,))
        # Fetch one record and return result
        account = cursor.fetchone()

        # If account exists in users table in database
        if account:
            # Create session data
            session['loggedin'] = True
            session['id'] = account['id']
            session['name'] = account['name']
            session['username'] = account['username']
            session['position'] = account['position']

            return redirect(url_for('home'))

        else:
            # Account doesnt exist or username/password incorrect
            msg = 'Incorrect username/password!'

    return render_template('index.html', msg=msg)


@app.route('/logout')
def logout():
    # Remove session data, this will log the user out
    session.pop('loggedin', None)
    session.pop('id', None)
    session.pop('name', None)
    session.pop('username', None)
    session.pop('position', None)

    # Redirect to login page
    return redirect(url_for('login'))


@app.route('/register', methods=['GET', 'POST'])
def register():
    msg = ''

    if request.method == 'POST' and 'name' in request.form \
            and 'email' in request.form and 'phoneNo' in request.form \
            and 'username' in request.form and 'password' in request.form \
            and 'cpassword' in request.form and 'position' in request.form:

        # get data from form
        name = request.form['name']
        email = request.form['email']
        phoneNo = request.form['phoneNo']
        username = request.form['username']
        password = request.form['password']
        cpassword = request.form['cpassword']
        position = request.form['position']

        # Check if account exists
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM users WHERE username = %s', (username,))
        account = cursor.fetchone()

        # If account exists show error and validation checks
        if account:
            msg = 'Username already taken!'
        elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
            msg = 'Invalid email address!'
        elif cpassword != password:
            msg = 'Confirmation password does not match!'
        elif not username or not password or not email:
            msg = 'Please fill out the form!'
        else:
            # Satisfied requirements to register
            cursor.execute(
                'INSERT INTO users (name, email, phoneNo, username, password, position) '
                'VALUES (%s, %s, %s, %s, %s, %s)',
                (name, email, phoneNo, username, password, position,))
            mysql.connection.commit()
            msg = 'You have successfully registered!'

    elif request.method == 'POST':
        msg = 'Please fill out the form!'

    # Show registration form with message (if any)
    return render_template('register.html', msg=msg)


@app.route('/home')
def home():
    if 'loggedin' in session:
        if session['position'] == 'doctor':
            return redirect(url_for('doctor'))
        else:
            return redirect(url_for('frontliner'))

    return redirect(url_for('login'))


@app.route('/home/frontliner')
def frontliner():
    user = session['name']
    return render_template('frontliner.html', user=user)


@app.route('/home/doctor')
def doctor():
    user = session['name']
    type1 = 'asymptomatic'
    type2 = 'mild'
    type3 = 'severe'

    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    asymptomatic = cur.execute("SELECT * FROM patients WHERE type = %s", (type1,))
    mild = cur.execute("SELECT * FROM patients WHERE type = %s", (type2,))
    severe = cur.execute("SELECT * FROM patients WHERE type = %s", (type3,))
    waiting = cur.execute("SELECT * FROM patients WHERE status = %s", ('waiting',))
    examined = cur.execute("SELECT * FROM patients WHERE status = %s", ('examined',))

    return render_template('doctor.html', user=user, asymptomatic=asymptomatic, mild=mild,
                           severe=severe, waiting=waiting, examined=examined)


@app.route("/profile")
def profile():
    if session['loggedin']:
        username = session['username']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM users WHERE username = %s', (username,))
        account = cursor.fetchone()

        return render_template('profile.html', account=account)


@app.route("/editProfile", methods=['POST', 'GET'])
def editProfile():
    msg = ''

    username = session['username']
    email = request.form['email']
    phoneNo = request.form['phoneNo']
    oldPassword = request.form['oldPassword']
    newPassword = request.form['newPassword']
    cPassword = request.form['cPassword']

    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

    if oldPassword != '' or newPassword != '' or cPassword != '':
        if oldPassword == '' or newPassword == '' or cPassword == '':
            msg = 'Please fill in the reset password form!'
        else:
            cursor.execute(
                'UPDATE users SET email=%s, phoneNo=%s, password=%s WHERE username=%s',
                (email, phoneNo, newPassword, username))
            mysql.connection.commit()
            msg = 'Update Saved!'
    elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
        msg = 'Invalid email address!'
    else:
        cursor.execute(
            'UPDATE users SET email=%s, phoneNo=%s WHERE username=%s',
            (email, phoneNo, username))
        mysql.connection.commit()
        msg = 'Update Saved!'

    cursor.execute('SELECT * FROM users WHERE username = %s', (username,))
    account = cursor.fetchone()

    return render_template('profile.html', account=account, msg=msg)


@app.route("/record", methods=['POST', 'GET'])
def record():
    if session['position'] == 'doctor':
        if 'loggedin' in session:

            cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cur.execute("SELECT * FROM patients")
            patients = cur.fetchall()

            user = session['name']

            return render_template('record.html', user=user, patients=patients)

        # User is not loggedin redirect to login page
        return redirect(url_for('login'))


@app.route("/updateStatus", methods=['POST', 'GET'])
def updateStatus():
    id = request.form['id']
    status = request.form['status']

    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute(
            'UPDATE patients SET status=%s WHERE id=%s',
            (status, id,))
    mysql.connection.commit()

    return redirect(url_for('record'))


@app.route("/record/waiting", methods=['POST', 'GET'])
def waiting():
    if session['position'] == 'doctor':
        status = 'waiting'

        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM patients WHERE status = %s ORDER BY time DESC", (status,))
        patients = cur.fetchall()

        user = session['name']

        return render_template('record.html', user=user, patients=patients)


@app.route("/record/examined", methods=['POST', 'GET'])
def examined():
    if session['position'] == 'doctor':
        status = 'examined'

        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM patients WHERE status = %s ORDER BY time DESC", (status,))
        patients = cur.fetchall()

        user = session['name']

        return render_template('record.html', user=user, patients=patients)


@app.route("/record/asymptomatic", methods=['POST', 'GET'])
def asymptomatic():
    if session['position'] == 'doctor':
        type = 'asymptomatic'

        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM patients WHERE type = %s ORDER BY time DESC", (type,))
        patients = cur.fetchall()

        user = session['name']

        return render_template('record.html', user=user, patients=patients)


@app.route("/record/mild", methods=['POST', 'GET'])
def mild():
    if session['position'] == 'doctor':
        type = 'mild'
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM patients WHERE type = %s ORDER BY time DESC",(type,))
        patients = cur.fetchall()

        user = session['name']

        return render_template('record.html', user=user, patients=patients)


@app.route("/record/severe", methods=['POST', 'GET'])
def severe():
    if session['position'] == 'doctor':
        type = 'severe'
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM patients WHERE type = %s ORDER BY time DESC",(type,))
        patients = cur.fetchall()

        user = session['name']

        return render_template('record.html', user=user, patients=patients)


@app.route('/patient', methods=['POST', 'GET'])
def patient():
    patientId = request.args.get('patientId')

    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cur.execute('SELECT * FROM patients JOIN users WHERE patients.frontlinerId = users.id AND patients.id = %s',
                (patientId,))
    patient = cur.fetchone()

    return render_template("patient.html", patient=patient)


@app.route('/inputPatient')
def inputPatient():
    if session['position'] == 'frontliner':
        return render_template("inputPatient.html")


@app.route('/result', methods=['POST', 'GET'])
def result():
    frontlinerId = session['id']
    name = request.form['name']
    ic = request.form['ic']
    phoneNo = request.form['phoneNo']
    input_gender = int(request.form['gender'])
    input_age = int(request.form['age'])
    fever = int(request.form['fever'])
    cough = int(request.form['cough'])
    fatigue = int(request.form['fatigue'])
    dyspnea = int(request.form['dyspnea'])
    input_temperature = float(request.form['temperature'])
    status = 'waiting'

    gender = ''
    if input_gender == 1:
        gender = 'male'
    elif input_gender == 2:
        gender = 'female'

    age = ''
    if input_age <= 18:
        age = 1  # child
    elif input_age > 18 and input_age < 65:
        age = 2  # adult
    elif input_age >= 65:
        age = 3  # old

    temperature = ''
    if input_temperature < 37.3:
        temperature = 1
    elif input_temperature >= 37.3 and input_temperature <= 38:
        temperature = 2
    elif input_temperature >= 38.1 and input_temperature <= 39:
        temperature = 3
    else:
        temperature = 4

    X = np.array([input_gender, age, fever, cough, fatigue, dyspnea, temperature]).reshape(1, -1)

    # Restore tuple
    mdl, accuracy = pickle.load(open("model/predictive_model.sav", 'rb'))

    pred = mdl.predict(X)

    severity = ''

    if (pred == 1):
        severity = 'asymptomatic'
    elif (pred == 2):
        severity = 'mild'
    elif (pred == 3):
        severity = 'severe'

    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cur.execute('INSERT INTO patients (name, ic, phoneNo, gender, age, fever, cough, fatigue, dyspnea, temperature,'
                'type, frontlinerId, status) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)',
                (name, ic, phoneNo, gender, input_age, fever, cough, fatigue, dyspnea, input_temperature,
                 severity, frontlinerId, status,))
    mysql.connection.commit()

    return render_template('result.html', severity=severity, accuracy=accuracy)


if __name__ == '__main__':
    app.run(debug=True)
