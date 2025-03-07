#!/bin/bash

# Clone the n8n repository at the root if it doesn't exist
if [ ! -d "n8n" ]; then
    git clone https://github.com/n8n-io/n8n.git /workspace/n8n
fi

# Create the custom-nodes directory if it doesn't exist
mkdir -p /workspace/custom-nodes

# Clone the n8n-nodes-starter repository in the custom-nodes folder if it doesn't exist
if [ ! -d "/workspace/custom-nodes/n8n-nodes-starter" ]; then
    git clone https://github.com/n8n-io/n8n-nodes-starter.git /workspace/custom-nodes/n8n-nodes-starter
    sed -i 's/<...>/starter/g' /workspace/custom-nodes/n8n-nodes-starter/package.json
fi