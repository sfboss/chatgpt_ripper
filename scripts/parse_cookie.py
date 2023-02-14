import re

header_regex = re.compile(r'-H\s+\'cookie:\s+(.*)\'')
with open("./config/CURL.txt", "r") as file:
    contents = file.read()
    match = header_regex.search(contents)
    if match:
        cookie = match.group(1)
        print(cookie)
    else:
        print("cookie not found")
