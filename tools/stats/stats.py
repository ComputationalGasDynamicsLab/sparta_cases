import re
#import matplotlib.pyplot as plt
import json

import pandas as pd
import sys

#This script requires a .out file from sparta. The format must require that "Step" be the first header.
#Loop must be the last word of the last line between the data

"""
    Step CPU Np Natt Ncoll Nscoll Nscheck 
       0            0        0        0        0        0        0 
       5  0.017086506     1296        0        0        0        0
        ..... 
    Loop time of 827.552 on 1 procs for 20000 steps with 70225 particles
        
"""
f = sys.argv[1]
doc = open(f, "r") # open a document
lines = doc.readlines()
data = []
data_ranges = []
headers = []
i = 0
# Going over each line of the file
#find the upper bounds and lower bounds for the data
for index, line in enumerate(lines, 1):

    if re.search("Step ", line): #lower bound
        headers = line.split()
        data_ranges.append([index, 0])
    elif re.search("Loop", line): #upper bound
        data_ranges[i][1] = index
        i += 1
#append everything between the upper and lower bounds
for index, line in enumerate(lines, 1):
    for bound in data_ranges:
        if index > bound[0] and index < bound[1]:
            data.append(line.split())

doc.close()     
#create a dictionary
d = {}
#create keys
for i in headers:
    d[i] = []
#assign each key to the corresponding data
#i.e Step Np Nscoll .... 
for line in data:
    for index, header in enumerate(headers): #probably should refactor
        d[header].append(line[index])

with open("stats.txt", "w") as txt_file:
    
    txt_file.write(" ".join(headers) +"\n")
    for line in data:
        txt_file.write(" ".join(line) + "\n")

with open('stats.json', 'w') as f:
    json.dump(d, f)


frame = pd.read_csv("stats.txt")
frame.to_csv("stats.csv", index = None) 
#plt.plot(d["Step"], d["CPU"])
#plt.show()
