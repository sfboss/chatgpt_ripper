#!/bin/bash 
echo "Done retrieving data!  Running final processing steps to consolidate the data into a single file..."
echo "[" > ./logs/consolidated.json 
folder="./chats/"
filecounter=0 
for file in $folder*.json; do
  filecounter=$((filecounter+1))
done
filecounter_guard=0
for file in $folder*.json; do
  filecounter_guard=$((filecounter_guard+1))
  jq -c . $file >> ./logs/consolidated.json
  # if i < file_counter_guard-1, then add a comma
  if test $filecounter_guard -lt $filecounter; then
    echo "," >> ./logs/consolidated.json
  fi
 
done   
echo "]" >> ./logs/consolidated.json
echo "$(cat ./logs/consolidated.json | jq .)" > ./logs/consolidated.json && code ./logs/consolidated.json
echo "Done retrieving data!  Running final processing steps to consolidate the data into a single file at ./logs/consolidated.json"


