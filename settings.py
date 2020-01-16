#!/usr/bin/python3
import mysql.connector

def db():
	conn = mysql.connector.connect(
		host = '',
		user = '',
		password = '',
		database = ''
	)
	return conn
