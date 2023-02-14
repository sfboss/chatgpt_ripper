# chatGPT chats ripper to get the details from your sessions in a workable format
#       
#  scripts folder has the scripts to handle getting conversation details as the first step
#  conversation details would then give us the UUIDs we need to pull each chat down individually
#  once we get the convo Ids and pull each down into a folder "chats", we consolidate them into 
#  the file consolidated.json and there is a jq file that has some output commands to properly format the output


# the steps to get the conversations and CURL string are required before this should be run
# after successfully getting the CURL string and you are in the chatgpt UI and you have updated
# the config to match your setup, these will process from the consolidated.json file that is all of the chats put together
# the consolidation.json is dropped in place when the script for consolidate_json is ran

# Usage
- Launch the script from the root folder with "sh chatgpt_rip.sh"
- To view the JSON that is returned in consolidated.json can be filtered with the filters in the scripts/working_output.jq file.  This has commands to filter by user, assistant, and neither of those
[https://sfdcboss.com/how-to-save-chatgpt-conversation-history-from-chat-openai-com](https://sfdcboss.com/how-to-save-chatgpt-conversation-history-from-chat-openai-com)