#!/bin/bash

# Agentic Project Template - Setup Script
# This script initializes a new project from the template

set -e

echo "🚀 Setting up your agentic project..."

# Get project name
read -p "Enter project name: " PROJECT_NAME
read -p "Enter your name/organization: " AUTHOR

# Update README.md
echo "📝 Updating README.md..."
sed -i.bak "s/\[YOUR PROJECT NAME\]/$PROJECT_NAME/g" README.md
sed -i.bak "s/\[Your Name\/Organization\]/$AUTHOR/g" README.md
rm README.md.bak

# Update CLAUDE.md
echo "📝 Updating CLAUDE.md..."
sed -i.bak "s/\[YOUR-PROJECT\]/$PROJECT_NAME/g" CLAUDE.md
sed -i.bak "s/\[DATE\]/$(date +%Y-%m-%d)/g" CLAUDE.md
sed -i.bak "s/\[NAME\/TEAM\]/$AUTHOR/g" CLAUDE.md
rm CLAUDE.md.bak

# Initialize git if not already initialized
if [ ! -d .git ]; then
    echo "🔧 Initializing git repository..."
    git init
    git add .
    git commit -m "Initial commit: Agentic project template setup for $PROJECT_NAME"
fi

# Create example config
echo "⚙️ Creating example configuration..."
cat > config/agent-config.json << EOF
{
  "project_name": "$PROJECT_NAME",
  "agents": {
    "document_processor": {
      "model": "claude-sonnet-4-5",
      "enabled": true
    },
    "content_generator": {
      "model": "claude-opus-4-6",
      "enabled": true
    },
    "knowledge_curator": {
      "model": "claude-sonnet-4-5",
      "enabled": false
    },
    "website_manager": {
      "model": "claude-sonnet-4-5",
      "enabled": false
    }
  }
}
EOF

echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Add your source documents to work/"
echo "2. Customize CLAUDE.md with project-specific context"
echo "3. Configure agents in config/agent-config.json"
echo "4. Run ./scripts/generate-deliverables.sh to start"
echo ""
echo "📚 See README.md for full documentation"
