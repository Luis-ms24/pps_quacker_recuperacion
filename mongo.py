from pymongo import MongoClient
from os import environ

# TODO: hay que ver cómo apañamos la conexión para que podamos usar variables de entorno
client = MongoClient('mongodb://localhost:27017')
db = client['quacker']
users = db['users']
quacks = db['quacks']