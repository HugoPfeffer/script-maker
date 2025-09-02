#!/usr/bin/env bash
# Description: Start SSH agent, add GitHub key, and test connection
# Usage: ./github-ssh-connect.sh [options]
# Example: ./github-ssh-connect.sh

while getopts "h" opt; do
  case $opt in
    h) 
      echo "Usage: ./github-ssh-connect.sh"
      echo ""
      echo "Starts SSH agent, adds GitHub SSH key, and tests connection"
      echo ""
      echo "Options:"
      echo "  -h    Show this help message"
      exit 0 
      ;;
  esac
done

# Start SSH agent
echo "Starting SSH agent..."
eval $(ssh-agent -s)

# Add SSH key
echo "Adding SSH key..."
ssh-add ~/.ssh/wsl-ubuntu-github

# Test GitHub connection
echo ""
echo "Testing GitHub SSH connection..."
ssh -T git@github.com