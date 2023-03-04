"""
Routes and views for the flask application.
"""

from datetime import datetime
from flask import Flask, request, render_template
from Prueba import app
from .database import conn



#articulos = []

@app.route('/')
@app.route('/home')
def home():
    """Renders the home page."""
    cursor = conn.cursor()
    cursor.execute('EXEC OrdenarArticulos')
    articulos = cursor.fetchall()
    cursor.close()
    return render_template(
        'index.html',
        title='Home Page',
        articulos=articulos
    )

@app.route('/contact')
def contact():
    """Renders the contact page."""
    return render_template(
        'contact.html',
        #title='Insertar Articulo',
        year=datetime.now().year,
        message='Your contact page.'
    )

@app.route('/about')
def about():
    """Renders the about page."""
    return render_template(
        'about.html',
        title='About',
        year=datetime.now().year,
        message='Your application description page.'
    )

@app.route('/user')
def user():
    return render_template(
        'user.html',
        title='User',
        year=datetime.now().year,
        message='Hi, Im in!'
        )

@app.route('/insert', methods=['GET', 'POST'])
def insert():
    if request.method == 'POST' and request.form['nombreArticulo'] != '' and request.form['precioArticulo'] != '':
        nombreArticulo = request.form['nombreArticulo']
        precioArticulo = request.form['precioArticulo']
        cursor = conn.cursor()
        cursor.execute('{CALL InsertarArticulo(?, ?, ?)}', (nombreArticulo, precioArticulo, 0))
        result = cursor.fetchone()
        conn.commit()
        cursor.close()
        print(result[0])
        return render_template(
            'insert.html', 
            title="Insertar Articulo", 
            nombreArticulo=nombreArticulo, 
            precioArticulo=precioArticulo
            )
    else:
        return render_template(
            'insert.html',
            title='Insertar Articulo',
            )