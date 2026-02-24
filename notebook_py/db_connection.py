# db_connection.py
import mysql.connector

def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="901012",
        database="e_commerce"
    )