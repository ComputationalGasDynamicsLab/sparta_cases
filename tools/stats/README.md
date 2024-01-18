This program creates .json, .csv, and .txt file of the stats created in sparta from the sparta script.


This script requires a .out log file from sparta. The format must require that "Step" be the first header.
"Loop" must be the last word of the last line between the data.

To use this program type "python stats.py dsmc.12321.out" 


The format must follow the lines below without qoutations:

"""
    Step CPU Np Natt Ncoll Nscoll Nscheck 
       0            0        0        0        0        0        0 
       5  0.017086506     1296        0        0        0        0
        ..... 
    Loop time of 827.552 on 1 procs for 20000 steps with 70225 particles
"""
