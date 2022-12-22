#! /usr/bin/python3
from turtle import width
import numpy as np
str = "hello world!"
len_str = len(str)
str_list = []
for i in str:
    str_list.append(ord(i))
file = open("str.txt",'w')
for i in range(len_str):
         file.write(np.binary_repr(str_list[i],width=8)+"\n")
file.close()
