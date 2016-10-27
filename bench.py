#!/usr/bin/env python

import os
import time
import subprocess

DIR = "./progs"

#test_file = ["dfs.rb", "factlong.rb",  "fact.rb"  "fib.rb"  "file.rb"  "fizzbuzz.rb"  "includes.rb"  "life.rb"  miller.rb  pi.rb  primetable.rb  qsort.rb]

file_samp = str()
time_samp = "time "

for file in os.listdir(DIR):
    if file.endswith(".rb"):
		if file != "life.rb":
			start_time = time.time()
			os.system("./rubi "+DIR+"/"+file+" >/dev/null")
			interval = time.time() - start_time
			file_samp += str(file) + " "
			time_samp += str(interval) + " "

print "#"+file_samp
print time_samp
