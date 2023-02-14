# Information / How it Works
- scripts folder has the scripts to handle getting conversation details as the first step
- conversation details would then give us the UUIDs we need to pull each chat down individually
- once we get the convo Ids and pull each down into a folder "chats", we consolidate them into 
- the file consolidated.json and there is a jq file that has some output commands to properly format the output
- the steps to get the conversations and CURL string are required before this should be run
- after successfully getting the CURL string and you are in the chatgpt UI and you have updated
- the config to match your setup, these will process from the consolidated.json file that is all of the chats put together
- the consolidation.json is dropped in place when the script for consolidate_json is ran

# Usage
- Go to Developer Tools, Network tab in Chrome and refresh chat.openai.com/chat.  Right click the conversations api call and click copy > Copy as cURL and paste the value in ./config/cURL.txt
- Launch the script from the root folder with "sh chatgpt_rip.sh" (logs/,config/,chats/,scripts/ should all be folders in root with chatgpt_rip.sh with them in root.  It will handle writing to the folders separately but making sure you are local to the chatgpt_ripper folder will prevent errors that were not worth handling in this mini project/experiment.
- To view the JSON that is returned in consolidated.json can be filtered with the filters in the scripts/working_output.jq file.  This has commands to filter by user, assistant, and neither of those

## Resources
https://sfdcboss.com/how-to-save-chatgpt-conversation-history-from-chat-openai-com 

## Disclaimer (please read)
- This is not intended to be used for anything unethical except to store your conversations if you were like me and went crazy chatting with the bot, and wanted to keep all of its nuggets of knowledge tucked away safely.
- The shell scripting and python combo of different random files is not intended to display how to architect shell scripts or python or anything, it was a mad scientist experiment with making chatGPT spit out code snippets and then tying it all together.  I will be making another post soon on the ability to take the shell scripts in here though and have chatGPT turn it into a fully refactored python app... stay tuned.
