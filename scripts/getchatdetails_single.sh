# get the conversations
url="https://chat.openai.com/backend-api/conversation/"$line
curl "$url" \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36' --compressed > "./chats/"$line".json" 2>/dev/null

echo "Successfully got the chat details for "$line" and saved to ./chats/"$line".json  .... sleep from 5 to 15 seconds before next loop..."