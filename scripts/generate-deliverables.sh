#!/bin/bash

# Generate Deliverables Script
# Runs the full agent workflow to generate all deliverables

set -e

echo "🤖 Generating deliverables with AI agents..."

# Check if Claude Agent SDK is available
if ! command -v claude-agent &> /dev/null; then
    echo "⚠️  Claude Agent SDK not found"
    echo "This is a placeholder script. Install claude-agent or customize for your setup."
    exit 1
fi

# Step 1: Process documents
echo "📄 Step 1: Processing source documents..."
claude-agent run document-processor --source work/ --output artifacts/data/

# Step 2: Generate deliverables
echo "✍️  Step 2: Generating deliverables..."
claude-agent run content-generator --mode deliverables --output artifacts/deliverables/

# Step 3: Build knowledge graph (if enabled)
if grep -q '"knowledge_curator".*"enabled": true' config/agent-config.json; then
    echo "🧠 Step 3: Building knowledge graph..."
    claude-agent run knowledge-curator --build-graph --output artifacts/knowledge-graph/
fi

# Step 4: Generate website (if enabled)
if grep -q '"website_manager".*"enabled": true' config/agent-config.json; then
    echo "🌐 Step 4: Generating website..."
    claude-agent run website-manager --generate-site --output website/
fi

echo "✅ All deliverables generated!"
echo "📁 Check artifacts/deliverables/ for outputs"
