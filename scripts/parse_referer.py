import re

header_regex = re.compile(r'-H\s+\'referer:\s+(.*)\'')
with open("./config/CURL.txt", "r") as file:
    contents = file.read()
    match = header_regex.search(contents)
    if match:
        referer = match.group(1)
        print(referer)
    else:
        print("referer not found")
