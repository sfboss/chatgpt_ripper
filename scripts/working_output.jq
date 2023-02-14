# the steps to get the conversations and CURL string are required before this should be run
# after successfully getting the CURL string and you are in the chatgpt UI and you have updated
# the config to match your setup, these will process from the consolidated.json file that is all of the chats put together
# the consolidation.json is dropped in place when the script for consolidate_json is ran

# this will output the role and message from an array of full json objects
cat ./logs/consolidated.json | jq -c '.[]|{title: .title, mapping: (.mapping | to_entries | map({message: .value.message|{content:.content}, role:.value.message.role}))}'|jq -r '[.mapping[] | {role: .role, message: .message.content.parts[0]}]' | jq .

# this will show only the user questions in the full array of objects:
cat ./logs/consolidated.json | jq -c '.[]|{title: .title, mapping: (.mapping | to_entries | map({message: .value.message|{content:.content}, role:.value.message.role}))}'|jq -r '[.mapping[] | {role: .role, message: .message.content.parts[0]}]' | jq '[.[]|select(.role == "user")]'

# this will show only the assistant questions in the full array of objects:
cat ./logs/consolidated.json | jq -c '.[]|{title: .title, mapping: (.mapping | to_entries | map({message: .value.message|{content:.content}, role:.value.message.role}))}'|jq -r '[.mapping[] | {role: .role, message: .message.content.parts[0]}]' | jq '[.[]|select(.role == "user")]'