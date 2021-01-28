import sys
import re

in_ = sys.argv[1]
out = sys.argv[2]
try:
    mbps = sys.argv[3]=="convert"
except:
    mbps = False
try:
    header = sys.argv[4]=="header"
except:
    header = False

with open(in_, 'r') as in_file:
    if header:
        in_file.readline()
    with open(out, 'w+') as out_file:
        #assuming header of 
        #Server ID,Sponsor,Server Name,Timestamp,Distance,Ping,Download,Upload,Share,IP Address
        #want to strip to Server ID, Timestamp, Ping, Download, Upload
        out_file.write("Server ID, Timestamp, Ping, Download, Upload\n")
        for line in in_file:
            items = re.split(r',(?=[^ ])', line)
            if mbps:
                newline = [int(items[0]), items[3], float(items[5]), float(items[6])/1000000, float(items[7])/1000000]
            else:
                newline = [items[0], items[3], items[5], items[6], items[7]]
            print(str(newline)[1:-1])
            out_file.write(str(newline)[1:-1]+"\n")
            # print(items)
