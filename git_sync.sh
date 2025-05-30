#!/bin/bash
# You can optionally add: cd "$(dirname "$0")" to make it dynamic

# Ensure SSH remote is set correctly
remote_url=$(git remote get-url origin)
if [[ "$remote_url" != git@github.com:* ]]; then
  echo "Ì¥Å Updating Git remote to SSH..."
  git remote set-url origin git@github.com:Random-Developer-8/crawl_ai.git
fi

# Handle push or pull argument
if [[ "$1" == "pull" ]]; then
  echo "Ì≥• Pulling latest changes..."
  git pull origin main
  echo "‚úÖ Pull done!"

elif [[ "$1" == "push" ]]; then
  echo "Ì≥¶ Staging changes..."
  git add .

  msg="Auto-commit: $(date '+%Y-%m-%d %H:%M:%S')"
  echo "Ì≥ù Committing: $msg"
  git commit -m "$msg"

  echo "Ì≥§ Pushing to GitHub..."
  git push origin main
  echo "‚úÖ Push done!"

else
  echo "‚ùì Invalid or missing command!"
  echo "Ì±â Usage: ./git_sync.sh [push | pull]"
  exit 1
fi

