import pymongo
from pymongo import *
from bson.objectid import ObjectId
import datetime
from random import randint

client = MongoClient()
db = client.csci2963
#generate a random number
n = db.definitions.count();
r = randint(0,n)

# find the i_th word such that i = r
i = 0
w = "Snail Mail"
for word in db.definitions.find():
    if i == r:
        w = word["word"]
        t = str(datetime.datetime.now())        
        print(w)
        db.definitions.update({"word":w}, {"$push": {"dates": t}})
        break
    i+=1
print(w)
print(db.definitions.find_one({"word":w}))
