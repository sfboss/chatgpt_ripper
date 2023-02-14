# get the conversations
source ./scripts/parse_args.sh
#!/bin/bash
filename="./logs/uuids.txt"

while read -r line; do
random_number=$(($RANDOM % 11))

# Add 5 to the random number to get a number between 5 and 15
# This is so that the script doesn't run too fast and get rate limited
# by the server and the sh getchats.sh script runs 1 uuid at a time per loop/line
random_number=$(($random_number + 5))
  source ./scripts/getchatdetails_single.sh $file
  sleep $random_number
done < "$filename"
