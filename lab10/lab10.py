from pymongo import *
from bson.objectid import ObjectId

client = MongoClient()
db = client.csci2963
#Fetch all records
'''
for record in db.definitions.find():
    print(record)
'''
#Fetch one record
print(db.definitions.find_one())
#Fetch a specific record
print(db.definitions.find_one({"word": "Objective"}))
#Fetch a record by object id
print(db.definitions.find_one({ '_id': ObjectId('582b4d5aa4f7bec2b77b8250')}))
#Insert a new record

record_id = db.definitions.insert_one({"word": "Inactive", "definition":" not doing anything; not active"}).inserted_id
print(db.definitions.find_one({"word": "Inactive"}))
