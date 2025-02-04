#!/data/data/com.termux/files/usr/bin/python3
import sys
sys.path.append( "/data/data/com.termux/files/home/scripts/python_scripts/medicine_logger" )
from lib import *
from presets import *
import json

medicine_log = "Medicine_log.json"
DEFAULT_MEDICINES = [ "Buspirone" ]
#DEFAULT_MEDICINES = [ "Olanzapine", "vitamin D3" ]
chosen_preset = DEFAULT_MEDICINES


#entries is a list of dictionaries.
try:
 entries = json.loads( load_entries_from_file( medicine_log ))
except:
 entries = []
print()


# prints entries
print_list_of_entries( entries )
print()


#print current preset
print( "current preset: ", ', '.join( chosen_preset ))
print()


#main menu
main_menu_choice = main_menu()
print( main_menu_choice )
'''match main_menu_choice:
 case 1:
  exit()
 case 2:
  exit()
 case 3:
  exit()
 case 4:
  exit()
 case _:
  raise ValueError( str(main_menu_choice) + " is not a valid choice" )
'''
#---------------------------------------------------------------------------------------
entries.append( entry( chosen_preset ).get_dict() ) # entry() will create a new medicine entry with the current time and default medicine, and .get() convert it to dictionary


#---------------------------save---------------------------
# convert all entries, previous and current to json
entries = json.dumps( entries )


# flush to disk
save( medicine_log, entries )
