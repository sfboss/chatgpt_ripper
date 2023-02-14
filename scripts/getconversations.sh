# get the conversations
source ./scripts/parse_args.sh
#resulting curl stored in the file uuids.json and the uuids list is stored in the file uuids.txt 
curl 'https://chat.openai.com/backend-api/conversations?offset='$offset'&limit='$limit \
  -H 'authority: chat.openai.com' \
  -H 'accept: */*' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H 'authorization: '"$auth_string" \
  -H 'content-type: application/json' \
  -H 'cookie: '"$cookie_string" \
  -H 'referer: '"$referrer_url" \
  -H 'sec-ch-ua: "Chromium";v="110", "Not A(Brand";v="24", "Google Chrome";v="110"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36' \
  --compressed > ./logs/uuids.json 2>/dev/null
  cat ./logs/uuids.json | jq -r '.items[].id' > ./logs/uuids.txt
  echo "Conversations logged to ./logs/uuids.txt and ./logs/uuids.json, moving on to get the messages..."