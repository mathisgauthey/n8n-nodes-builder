#!/bin/bash

# Create the /home/node/.n8n/custom directory if it doesn't exist
mkdir -p /home/node/.n8n/custom

# Go to the custom directory
cd /home/node/.n8n/custom

# Loop through each directory in /workspace/custom-nodes and create a link to the n8n instance
for repo_path in /workspace/custom-nodes/*;
do
    if [ -d "$repo_path" ]; then
        echo "Exploring $repo_path folder"
        repo_name=$(jq -r '.name' "$repo_path/package.json")
        echo "Checking $repo_name in package.json from $repo_path"
        if ! grep -q "\"$repo_name\"" /home/node/.n8n/custom/package.json; then
            echo "Linking $repo_name to n8n"
            pnpm link "$repo_path"
        else
            echo "$repo_name is already linked in package.json"
        fi
    fi
done