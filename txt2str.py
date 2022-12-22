#! /usr/bin/python3
file = open("/home/jpyuan/A5-1/output.txt")
line = file.readline()
str1 = ""
str2 = ""
for index,line in enumerate(file):
    n = line.strip()
    print(chr(int(n,2)))
    str1 += chr(int(n,2))
    str2 += str(int(n,2))
print(str1)
file.close()
print(str2)
