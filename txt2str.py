#! /usr/bin/python3
file = open("./output.txt")
line = file.readline()
alist = []
for index,line in enumerate(file):
    n = line.strip()
    print(chr(int(n,2)))
    alist.append(chr(int(n,2)))
print(''.join(alist))
file.close()
