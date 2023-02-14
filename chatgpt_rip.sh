echo "Processing cURL.txt values into their proper files..."
sh ./scripts/get_curl_values.sh
echo "Processed cURL.txt and moving onto limits / offset / data retrieval..."

read -r auth_string << EOF
$(cat ./config/sessionid)
EOF
 
read -r cookie_string << EOF
$(cat ./config/cookie)
EOF

read -r referrer_url << EOF
$(cat ./config/referer)
EOF
# ask the user for the limit
read -p "What is limit of conversations to get?: " limit 

# ask the user for the offset
read -p "What is the offset of the limit (at what number to start convo list if not 0): " offset  


source ./scripts/getconversations.sh $limit $offset "$auth_string" "$cookie_string" "$referrer_url"
source ./scripts/getchatdetails_all.sh $limit $offset "$auth_string" "$cookie_string" "$referrer_url"
sh ./scripts/consolidate_json.sh

echo "Done!  Check the ./chats/ folder with the json files for the chat specific files separated by UUID."