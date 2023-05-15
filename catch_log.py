import re
import sys
import requests
import os

IP_REG = r'\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?):\d{1,5}\b'


newfile = open("logs.log", "a+")

# text = sys.stdin
text = sys.argv
# print(text)
# print("!")

for line in text:
    print(line.strip())
    matches = re.findall(IP_REG, line)
    if matches:
        for m in matches:
            newfile.write(m + '\n')
        response = requests.post("https://ntfy.teawide.xyz/ncs",
                                 auth=("tmp", "tmp"),
                                 headers = {
                                     'Priority': 'urgent',
                                     'Tags': 'warning'
                                 },
                                 data=line.strip())

