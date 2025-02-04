#!/usr/bin/python3

import argparse

quit_strings = ["done", "stop", "quit", "exit", "q"]

usr_input = "None"

ratio_array = []

print("when finished, please enter one of the following strings:\n", ', '.join(quit_strings))
print("use the same unit of measurment for every input\n\n")
while(usr_input.lower() not in quit_strings):
	usr_input = input("enter the amount of units as a float/integer: ")
	try: ratio_array.append( float(usr_input) )
	except: print("could not add",usr_input)

print(ratio_array)

i=0
while(i < 99999):
	i = i + 0.01
	new_array = [x*i for x in ratio_array]
	if all([float(int(x)) == x  for x in new_array]):
		break
print(new_array)
