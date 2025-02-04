#!/data/data/com.termux/files/usr/bin/python3
import time
import json



class entry:
 def __init__( self, medicine_names ):
  self.timestamp         = time.time()
  self.time              = time.ctime()
  self.medicines_taken   = medicine_names
 
 def get_dict( self ):
  return {
   "medicines_taken": self.medicines_taken,
   "time":            self.time,
   "timestamp":       self.timestamp
  }
 
 def __repr__( self ):
  return str( self.get_dict() )



def get_typed_var( func, var_type ): #will repeatedly run func untill it outputs a var with a type of var_type
 if type( var_type ) != type( int ):
  raise ValueError( "Error, var_type must be a type" )
 out = None
 while type( out ) != var_type:
  out = func()
 return out



def main_menu():
 print( '''What would you like to do?
 1) save to log with current medicine list preset
 2) choose a preset of medicines to take
 3) manage presets
 4) manage medicine history''' )
 return get_typed_var( lambda: cast_no_error( input( ">" ), int ), int )



def save( fp, data ):
 with open( fp, "w" ) as f: return f.write( data )

save_entries_to_file = save



def load_entries_from_file( filepath ):
 try:
  with open( filepath, "r" ) as f:
   return "\n".join( f.readlines() )
 except:
  print( "load from", filepath, "failed." )
  return ""



def print_list_of_entries( entries ):
 # prints entries
 for entry in entries:
  for key, value in entry.items():
   print(key, ":", value)
  print("-"*40)



def cast_no_error( x, var_type ):
 try:
  return var_type( x )
 except:
  return x
