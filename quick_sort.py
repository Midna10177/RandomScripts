#!/usr/bin/python3
import random

def quick_sort(data, debug=False):
	# steps go as follow:
	# 
	# 1. partition the array about a pivot
	# 2. pass the smaller array to the recursive calls
	# 3. join the sorted arrays from the recursive calls and the pivot
	#
	#
	
	num_items = len(data)
	if debug: print("num items",num_items, data)
	#base case
	if num_items < 2:
		return data
	
	current_position = 0 # position of the partitioning element
	
	for i in range(1,num_items): # partitioning loop
		if data[i] <= data[0]:
			if debug: print(data[i],"less than",data[0],", new pivot at",current_position+1)
			if debug: print("swapping",data[i],"and",data[current_position])
			current_position += 1
			temp = data[i]
			data[i] = data[current_position]
			data[current_position] = temp
	
	if debug: print("\ndata after partition:",data)
	
	temp = data[0]
	data[0] = data[current_position]
	data[current_position] = temp # brings pivot to its appropriate location
	
	if debug: print("\nnew pivot at",current_position,"\n")
	
	if debug: print("calling quicksort for left side", data[0:current_position])
	left = quick_sort(data[0:current_position], debug) # sort the elements to the left of the pivot
	if debug: print("calling quicksort for right side", data[current_position+1:num_items])
	right = quick_sort(data[current_position+1:num_items], debug) # sort the elements to the right of the position
	
	if debug: print("merging",left,"and",[data[current_position]] + right)
	data = left + [data[current_position]] + right # merge everything together
	
	if debug: print("returning",data)
	return data


max_value = 500000
num_elements = 100000
print("generating",num_elements,"numbers between 0 and",max_value)
mydata = [random.randint(1,max_value) for x in range(num_elements)]

print("sorting...")
new_data = quick_sort(mydata,False)
print("done sorting.")
