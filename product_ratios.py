#!/usr/bin/python3
class Database:
 def __init__(self):
  self.data = []
  
 def __repr__(self):
  output = "[name, price per weight]\n\n"
  output = output + "\n".join([str(x) for x in self.data])
  return "\n" + output + "\n"
 
 def add(self, name, weight, price):
  self.data.append([name, round(price/weight, 3)])
  self.data.sort(key=lambda x:x[1])




def typed_input(inp_str, typ):
 if type(typ) != type(type):
  raise ValueError("type of second parameter on typed_input() must be a type type")
 
 while True:
  try:
   usrdata = typ(input(inp_str))
   return usrdata
  except:
   print( "please enter type of", typ )


my_database = Database()

while True:
 name = input("enter product name: ")
 weight = typed_input("enter product weight: ", float)
 price = typed_input("enter price: ", float)
 
 my_database.add( name, weight, price )
 
 print(my_database)
