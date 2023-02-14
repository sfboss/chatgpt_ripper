import re

header_regex = re.compile(r'-H\s+\'authorization:\s+(.*)\'')
with open("./config/CURL.txt", "r") as file:
    contents = file.read()
    match = header_regex.search(contents)
    if match:
        authorization = match.group(1)
        print(authorization)
    else:
        print("Authorization not found")
