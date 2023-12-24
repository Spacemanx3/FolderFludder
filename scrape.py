#!/bin/bash

# Check if ngrok is installed
if ! command -v ngrok &> /dev/null; then
    echo "ngrok is not installed. Please install it first."
    exit 1
fi

# Your local server address
LOCAL_SERVER_ADDRESS="http://localhost:8080"

# Ask for the remote user's information
read -p "Enter the remote user's IP address: " REMOTE_IP
read -p "Enter the remote user's MAC address: " REMOTE_MAC
read -p "Enter the remote user's network IP address: " REMOTE_NETWORK_IP

# Start ngrok to expose the local server
ngrok http 8080 &

# Wait for ngrok to generate a public URL
sleep 5

# Get the public URL from ngrok
PUBLIC_URL=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')

# Craft the hello message
HELLO_MESSAGE="Hello from $LOCAL_SERVER_ADDRESS through ngrok! Public URL: $PUBLIC_URL"

# Send the hello message to the remote user
echo "$HELLO_MESSAGE" | nc -w 1 $REMOTE_IP 12345
echo "$HELLO_MESSAGE" | nc -w 1 $REMOTE_MAC 12345
echo "$HELLO_MESSAGE" | nc -w 1 $REMOTE_NETWORK_IP 12345

# Stop ngrok
pkill ngrok
