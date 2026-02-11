# Agentic Project Template

**A comprehensive template for document-centric, agent-driven collaborative projects**

This template provides a complete project structure for managing knowledge-intensive projects using AI agents, collaborative tools, and automated workflows. Based on real-world implementation of the SIAS Elite 20 AI+X program.

---

## 🎯 What Is This Template For?

This template is designed for projects that:

- **Generate knowledge** from source documents (curriculum, research, training materials)
- **Use AI agents** to automate content generation and transformation
- **Collaborate** using Google Docs, NotebookLM, or similar tools
- **Produce deliverables** like operation guides, websites, or academic papers
- **Scale** from individual to team-based workflows

**Perfect for:**
- Educational programs and course development
- Research projects with publication goals
- Knowledge management and documentation projects
- Training material development
- Content-heavy product development

---

## 🏗️ Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                    DOCUMENT-CENTRIC WORKFLOW                 │
└─────────────────────────────────────────────────────────────┘

    work/ (Source Documents)
         │
         ├──► Document Processor Agent
         │         │
         │         ▼
         │    artifacts/data/
         │    (Structured Data)
         │         │
         ▼         │
    tex/          ├──► Content Generator Agent
    (Papers)      │         │
                  │         ▼
                  │    artifacts/deliverables/
                  │    (Generated Content)
                  │         │
                  ├──► Knowledge Curator Agent
                  │         │
                  │         ▼
                  │    artifacts/knowledge-graph/
                  │         │
                  ▼         │
            Website Manager Agent
                  │
                  ▼
            website/ (Deployed Site)
```

---

## 📁 Directory Structure

```
your-project/
│
├── README.md                        # Project overview (customize this!)
├── CLAUDE.md                        # Instructions for Claude agents
├── PROJECT_STRUCTURE.md             # Detailed structure documentation
├── .gitignore                       # Git ignore rules
├── LICENSE                          # Project license
│
├── work/                            # SOURCE: Your documents
│   ├── core-content/                # Main project documents
│   ├── reference/                   # Reference materials
│   ├── media/                       # Videos, images, diagrams
│   └── README.md                    # Document inventory
│
├── tex/                             # Academic papers & publications
│   ├── papers/
│   ├── presentations/
│   ├── templates/
│   └── common/
│
├── doc/                             # User documentation
│   ├── user-guides/
│   ├── developer/
│   ├── tutorials/
│   └── reference/
│
├── skills/                          # Custom Claude Code skills
│   ├── document-processing/
│   ├── content-generation/
│   ├── analysis/
│   └── utilities/
│
├── notebooklm/                      # NotebookLM integration (optional)
│   ├── notebooks/                   # → Symbolic link
│   └── README.md
│
├── gdocs/                           # Google Workspace integration (optional)
│   ├── drive/                       # → Symbolic link
│   ├── exports/
│   └── README.md
│
├── artifacts/                       # GENERATED: Agent outputs
│   ├── data/                        # Structured data from documents
│   ├── deliverables/                # Main outputs (guides, reports)
│   ├── knowledge-graph/             # Knowledge representation
│   └── reports/                     # Analytics and insights
│
├── website/                         # Web presence (optional)
│   ├── src/
│   ├── public/
│   └── content/
│
├── agents/                          # Claude Agent SDK implementations
│   ├── document-processor/
│   ├── content-generator/
│   ├── knowledge-curator/
│   └── website-manager/
│
├── config/                          # Configuration files
│   ├── agent-config.json
│   ├── project-schema.json
│   └── deployment.yaml
│
└── scripts/                         # Automation scripts
    ├── setup-project.sh
    ├── sync-external.sh
    └── generate-deliverables.sh
```

---

## 🚀 Quick Start

### 1. Use This Template

**On GitHub:**
```bash
# Click "Use this template" button on GitHub
# Or clone:
git clone https://github.com/YOUR-USERNAME/agentic-project-template.git my-project
cd my-project
```

**Locally:**
```bash
# Download and extract
cd ~/Documents/myWork
git clone <this-repo-url> my-project
cd my-project
```

### 2. Customize for Your Project

```bash
# Run setup script
./scripts/setup-project.sh

# Or manually:
# 1. Edit README.md with your project details
# 2. Update CLAUDE.md with project-specific context
# 3. Rename directories in work/ for your content types
# 4. Configure agents in config/agent-config.json
```

### 3. Add Your Documents

```bash
# Add source documents to work/
cp ~/Downloads/your-materials.pdf work/core-content/

# Update the document inventory
# Edit work/README.md to list all documents
```

### 4. Set Up External Integrations (Optional)

```bash
# Link NotebookLM
ln -s ~/path/to/notebooklm-repo/your-project notebooklm/notebooks

# Link Google Drive
ln -s ~/Google\ Drive/My\ Drive/YourProject gdocs/drive
```

### 5. Start Using Agents

```bash
# Process documents
claude-agent run document-processor --source work/

# Generate content
claude-agent run content-generator --mode deliverables

# Build knowledge graph
claude-agent run knowledge-curator --build-graph
```

---

## 📖 Core Concepts

### 1. Document-Centric Design

**Source of Truth:** All content originates from `work/` documents
- PDFs, markdown, videos, images
- Organized by content type
- Version controlled
- Never modified by agents (read-only)

**Generated Artifacts:** Agents transform sources into outputs
- Operation guides
- Reports and summaries
- Knowledge graphs
- Website content

### 2. Agent-Driven Workflow

**Four Core Agents:**

1. **Document Processor** - Extract and structure information
2. **Content Generator** - Create deliverables from structured data
3. **Knowledge Curator** - Build knowledge graphs and search indices
4. **Website Manager** - Generate and deploy web presence

### 3. External Tool Integration

**Symbolic Links Pattern:**
- `notebooklm/` → Your NotebookLM repository
- `gdocs/` → Your Google Drive folder
- No duplication, automatic sync
- Version control friendly

### 4. Clear Separation of Concerns

```
work/        → Source (never modified)
artifacts/   → Generated (can be deleted and regenerated)
tex/         → Academic output (manually edited)
doc/         → Documentation (manually edited)
website/     → Web presence (generated from artifacts)
```

---

## 🎯 Common Use Cases

### Use Case 1: Educational Program

```bash
# Structure
work/
├── curriculum/              # Course materials
├── assessments/             # Tests and rubrics
└── media/                   # Videos and diagrams

# Generate
artifacts/deliverables/
├── operation-guide/         # Teaching guide
├── student-handbook/        # Student resources
└── assessment-bank/         # Question database
```

### Use Case 2: Research Project

```bash
# Structure
work/
├── papers/                  # Related papers (PDFs)
├── data/                    # Research data
└── notes/                   # Research notes

# Generate
tex/papers/                  # Your publications
artifacts/deliverables/
├── literature-review/       # Synthesized review
└── methodology/             # Research methodology
```

### Use Case 3: Product Documentation

```bash
# Structure
work/
├── specifications/          # Product specs
├── designs/                 # Design files
└── reference/               # Reference docs

# Generate
doc/                         # User documentation
website/                     # Documentation site
artifacts/deliverables/
└── user-guides/             # Generated guides
```

### Use Case 4: Training Materials

```bash
# Structure
work/
├── modules/                 # Training modules
├── resources/               # Additional materials
└── media/                   # Training videos

# Generate
artifacts/deliverables/
├── trainer-guide/           # Trainer materials
├── participant-workbook/    # Student materials
└── slides/                  # Presentation decks
```

---

## 🛠️ Customization Guide

### Rename Directories

```bash
# Example: Adapt for software documentation project
mv work/core-content work/api-specs
mv work/reference work/design-docs
mv artifacts/deliverables artifacts/documentation

# Update README.md and CLAUDE.md accordingly
```

### Remove Optional Components

```bash
# Don't need academic papers?
rm -rf tex/

# Not using NotebookLM?
rm -rf notebooklm/

# No website needed?
rm -rf website/

# Update PROJECT_STRUCTURE.md to reflect changes
```

### Add Custom Directories

```bash
# Example: Add testing directory
mkdir -p testing/{unit,integration,e2e}
echo "# Testing" > testing/README.md

# Example: Add data analysis directory
mkdir -p analysis/{scripts,notebooks,results}
echo "# Analysis" > analysis/README.md
```

---

## 📚 Documentation Files

### README.md (This File)
- Project overview
- Quick start guide
- Customization instructions

### CLAUDE.md
- Instructions for Claude agents
- Project context and goals
- Agent workflows and prompts
- Integration patterns

### PROJECT_STRUCTURE.md
- Detailed directory explanations
- File organization rules
- Naming conventions
- Maintenance guidelines

### work/README.md
- Complete document inventory
- Document descriptions
- Reading order
- Usage guidelines

---

## 🔧 Setup Scripts

### scripts/setup-project.sh

Automated project initialization:
- Create all directories
- Copy templates
- Initialize git
- Set up .gitignore

```bash
./scripts/setup-project.sh
```

### scripts/sync-external.sh

Sync external integrations:
- Pull from NotebookLM repo
- Sync Google Drive
- Update symbolic links

```bash
./scripts/sync-external.sh
```

### scripts/generate-deliverables.sh

Run agent workflows:
- Process documents
- Generate content
- Build knowledge graph
- Deploy website

```bash
./scripts/generate-deliverables.sh
```

---

## 🎨 Best Practices

### 1. Document Organization

```
✅ Good:
work/
├── 01-introduction/
├── 02-core-concepts/
├── 03-implementation/
└── media/

❌ Bad:
work/
├── stuff/
├── docs/
├── misc/
└── untitled-folder/
```

### 2. Naming Conventions

```
✅ Good:
- clear-descriptive-names.md
- module-01-introduction.pdf
- 2026-02-11-meeting-notes.md

❌ Bad:
- doc1.md
- untitled.pdf
- Copy of Copy of notes.md
```

### 3. Git Workflow

```bash
# Commit source documents
git add work/
git commit -m "Add source: Module 1 materials"

# Don't commit generated artifacts
# (Already in .gitignore)

# Commit manually edited content
git add tex/ doc/
git commit -m "Draft: Research paper introduction"
```

### 4. Agent Instructions

In `CLAUDE.md`, provide:
- Project context and goals
- Source document descriptions
- Desired output formats
- Quality standards
- Example workflows

---

## 🔄 Typical Workflow

### Phase 1: Setup
1. Clone template
2. Customize README and CLAUDE.md
3. Set up external integrations
4. Add source documents to `work/`

### Phase 2: Processing
1. Run document processor agent
2. Review structured data in `artifacts/data/`
3. Refine and iterate

### Phase 3: Generation
1. Run content generator agent
2. Review deliverables in `artifacts/deliverables/`
3. Edit and refine as needed

### Phase 4: Knowledge Building
1. Run knowledge curator agent
2. Build searchable knowledge graph
3. Generate insights and reports

### Phase 5: Deployment (Optional)
1. Generate website content
2. Deploy to hosting platform
3. Update documentation

### Phase 6: Maintenance
1. Add new source documents
2. Regenerate affected artifacts
3. Update website and docs
4. Iterate continuously

---

## 🤝 Integration Patterns

### NotebookLM Integration

```bash
# 1. Create NotebookLM notebooks from work/ documents
# 2. Sync NotebookLM repo to local
cd ~/notebooklm-repo && git pull

# 3. Link to project
ln -s ~/notebooklm-repo/my-project notebooklm/notebooks

# 4. Use outputs in project
cp notebooklm/notebooks/briefing-doc.md artifacts/deliverables/
```

### Google Drive Integration

```bash
# 1. Create Google Drive folder for project
# 2. Link to project
ln -s ~/Google\ Drive/My\ Drive/MyProject gdocs/drive

# 3. Export and use
# Google Docs → Download → Markdown
cp gdocs/exports/lesson-plan.md work/core-content/
```

### Claude Agent SDK

```bash
# 1. Configure agents in config/agent-config.json
# 2. Implement agents in agents/
# 3. Run workflows
claude-agent run document-processor --source work/
```

---

## 📊 Project Templates

### Minimal Template (Core Only)

```
your-project/
├── README.md
├── CLAUDE.md
├── work/
├── artifacts/
└── config/
```

### Standard Template (Recommended)

```
your-project/
├── README.md
├── CLAUDE.md
├── PROJECT_STRUCTURE.md
├── work/
├── doc/
├── skills/
├── artifacts/
├── agents/
└── config/
```

### Full Template (All Features)

```
your-project/
├── README.md
├── CLAUDE.md
├── PROJECT_STRUCTURE.md
├── work/
├── tex/
├── doc/
├── skills/
├── notebooklm/
├── gdocs/
├── artifacts/
├── website/
├── agents/
├── config/
└── scripts/
```

---

## 🎓 Examples

See `examples/` directory for complete project templates:

- `examples/educational-program/` - Course development
- `examples/research-project/` - Academic research
- `examples/product-docs/` - Software documentation
- `examples/training-materials/` - Corporate training

---

## 🐛 Troubleshooting

### Symbolic Links Not Working

```bash
# Check if link exists
ls -la notebooklm/notebooks

# Recreate if broken
rm notebooklm/notebooks
ln -s ~/correct/path notebooklm/notebooks
```

### Agents Not Finding Documents

```bash
# Verify work/ directory structure
tree work/

# Check CLAUDE.md has correct paths
# Ensure config/agent-config.json is properly configured
```

### Git Issues with Large Files

```bash
# Use Git LFS for large files
git lfs install
git lfs track "*.pdf"
git lfs track "*.mp4"
```

---

## 📄 License

MIT License - Feel free to use for any purpose

---

## 🙏 Credits

This template was created based on the real-world implementation of the SIAS Elite 20 AI+X program, demonstrating effective document-centric, agent-driven project management.

---

## 🔗 Resources

- [Claude Code Documentation](https://docs.anthropic.com/claude-code)
- [Claude Agent SDK](https://github.com/anthropics/anthropic-sdk-python)
- [NotebookLM](https://notebooklm.google.com)
- [Google Drive Desktop](https://www.google.com/drive/download/)
- [Rclone](https://rclone.org/)

---

## 📮 Support

- **Issues:** [GitHub Issues](https://github.com/YOUR-USERNAME/agentic-project-template/issues)
- **Discussions:** [GitHub Discussions](https://github.com/YOUR-USERNAME/agentic-project-template/discussions)
- **Examples:** See `examples/` directory

---

**Version:** 1.0.0
**Last Updated:** 2026-02-11
**Maintained By:** [Your Name/Organization]
