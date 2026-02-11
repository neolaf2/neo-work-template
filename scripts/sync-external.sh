#!/bin/bash

# Sync External Integrations Script
# Pulls latest from NotebookLM and Google Drive

set -e

echo "🔄 Syncing external integrations..."

# Sync NotebookLM
if [ -L "notebooklm/notebooks" ]; then
    echo "📓 Syncing NotebookLM..."
    NOTEBOOKLM_PATH=$(readlink notebooklm/notebooks)
    NOTEBOOKLM_REPO=$(dirname "$NOTEBOOKLM_PATH")

    if [ -d "$NOTEBOOKLM_REPO/.git" ]; then
        cd "$NOTEBOOKLM_REPO"
        git pull origin main
        cd - > /dev/null
        echo "✅ NotebookLM synced"
    else
        echo "⚠️  NotebookLM path is not a git repo"
    fi
else
    echo "ℹ️  NotebookLM not linked (skip with: ln -s ~/path/to/notebooklm notebooklm/notebooks)"
fi

# Sync Google Drive (if using rclone)
if command -v rclone &> /dev/null; then
    if [ -d "gdocs/sync" ]; then
        echo "📊 Syncing Google Drive with rclone..."
        rclone sync gdrive:$(basename $(pwd)) gdocs/sync
        echo "✅ Google Drive synced"
    fi
else
    echo "ℹ️  rclone not installed (Google Drive will sync via Desktop app if configured)"
fi

echo "✅ Sync complete!"
