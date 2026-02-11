# CLAUDE.md - Agentic Project Guide

**Project Type:** Document-Centric Knowledge Management & Automated Workflow System
**Built On:** Claude Agent SDK (Project Agent Template)
**Last Updated:** [DATE]

---

## 🎯 Project Overview

**[Customize this section with your project details]**

This project manages [YOUR PROJECT NAME] through a document-centric approach, transforming source materials into deliverables using AI agents.

**Project Goals:**
1. [Goal 1: e.g., Create comprehensive operation guide]
2. [Goal 2: e.g., Generate knowledge base]
3. [Goal 3: e.g., Build project website]

---

## 📁 Project Structure

```
[YOUR-PROJECT]/
├── CLAUDE.md                    # This file - instructions for Claude
├── work/                        # Source documents
│   ├── core-content/            # Main project documents
│   ├── reference/               # Reference materials
│   └── media/                   # Videos, images, diagrams
├── tex/                         # Academic papers (optional)
├── doc/                         # User documentation
├── skills/                      # Custom Claude Code skills
├── notebooklm/                  # NotebookLM integration (optional)
├── gdocs/                       # Google Workspace (optional)
├── artifacts/                   # Generated outputs
│   ├── data/                    # Structured data
│   ├── deliverables/            # Main outputs
│   ├── knowledge-graph/         # Knowledge representation
│   └── reports/                 # Analytics
├── website/                     # Web presence (optional)
├── agents/                      # Agent implementations
├── config/                      # Configuration
└── scripts/                     # Automation scripts
```

---

## 🤖 Agent-Driven Workflow

### Agent 1: Document Processor
**Purpose:** Extract and structure information from source documents

**Capabilities:**
- Parse PDFs, markdown, videos, images in `work/`
- Extract key concepts, entities, relationships
- Generate structured knowledge representations
- Create document metadata

**Input:** `work/` directory documents
**Output:** Structured data in `artifacts/data/`

**Usage:**
```bash
claude-agent run document-processor --source work/ --output artifacts/data/
```

**Prompts:**
```
"Analyze all documents in work/core-content/ and extract:
1. Main topics and themes
2. Key entities and their relationships
3. Important quotes and citations
4. Document metadata

Output as structured JSON in artifacts/data/"
```

### Agent 2: Content Generator
**Purpose:** Generate deliverables from structured data

**Capabilities:**
- Synthesize content from multiple sources
- Create guides, reports, summaries
- Generate templates and frameworks
- Maintain consistent style and tone

**Input:** `artifacts/data/` + `work/`
**Output:** `artifacts/deliverables/`

**Usage:**
```bash
claude-agent run content-generator --mode deliverables
```

**Prompts:**
```
"Generate [DELIVERABLE NAME] using:
- Source: artifacts/data/ + work/core-content/
- Target audience: [AUDIENCE]
- Format: [FORMAT]
- Length: [LENGTH]
- Style: [STYLE]

Output to artifacts/deliverables/"
```

### Agent 3: Knowledge Curator
**Purpose:** Build knowledge graph and search indices

**Capabilities:**
- Create concept taxonomy
- Build relationship maps
- Generate learning pathways
- Maintain searchable knowledge base

**Input:** `artifacts/data/` + `work/`
**Output:** `artifacts/knowledge-graph/`

**Usage:**
```bash
claude-agent run knowledge-curator --build-graph
```

### Agent 4: Website Manager (Optional)
**Purpose:** Generate and deploy web presence

**Capabilities:**
- Transform artifacts into web content
- Generate navigation and search
- Deploy to hosting platform
- Update automatically from sources

**Input:** `artifacts/` + `doc/`
**Output:** `website/`

**Usage:**
```bash
claude-agent run website-manager --generate-site
```

---

## 📋 Key Workflows

### Workflow 1: Initial Document Processing

```bash
# 1. Add source documents to work/
# 2. Process documents
claude-agent run document-processor --source work/

# 3. Review structured data
cat artifacts/data/document-inventory.json

# 4. Generate initial deliverables
claude-agent run content-generator --mode deliverables
```

### Workflow 2: Incremental Updates

```bash
# When new documents added to work/
claude-agent run document-processor --incremental
claude-agent run knowledge-curator --update-graph
claude-agent run content-generator --incremental
```

### Workflow 3: Deliverable Generation

```bash
# Generate specific deliverable
claude-agent run content-generator \
  --mode [operation-guide|report|summary] \
  --template templates/[template-name]
```

---

## 🎓 Working with Claude

### For Document Analysis

```
Prompt: "Analyze documents in work/core-content/ and:
1. Extract all key concepts
2. Identify relationships between concepts
3. Create a concept hierarchy
4. Generate summary for each document
5. Identify gaps in coverage

Output structured data to artifacts/data/"
```

### For Content Generation

```
Prompt: "Generate [DELIVERABLE] using:
- Sources: work/core-content/ + artifacts/data/
- Audience: [TARGET AUDIENCE]
- Purpose: [PURPOSE]
- Format: Markdown with clear sections
- Length: [APPROXIMATE LENGTH]
- Output: artifacts/deliverables/[NAME]

Follow [STYLE GUIDE] for tone and formatting."
```

### For Knowledge Graph Building

```
Prompt: "Build knowledge graph from:
- Source documents: work/
- Structured data: artifacts/data/

Create:
1. Entity nodes (concepts, people, places)
2. Relationship edges (dependencies, references)
3. Taxonomy hierarchy
4. Search index

Output: artifacts/knowledge-graph/"
```

---

## 📖 Project Context

### Source Documents

**[Customize with your document descriptions]**

**Location:** `work/core-content/`

Documents include:
1. [Document 1 name] - [Brief description]
2. [Document 2 name] - [Brief description]
3. [Document 3 name] - [Brief description]

See `work/README.md` for complete inventory.

### Expected Deliverables

**[Customize with your desired outputs]**

Primary deliverables:
1. **[Deliverable 1]** - [Description]
   - Location: `artifacts/deliverables/[name]/`
   - Format: [Format]
   - Audience: [Audience]

2. **[Deliverable 2]** - [Description]
   - Location: `artifacts/deliverables/[name]/`
   - Format: [Format]
   - Audience: [Audience]

### Quality Standards

**[Customize with your quality criteria]**

All generated content must:
- Be grounded in source documents
- Cite sources appropriately
- Maintain consistent terminology
- Follow style guide
- Be factually accurate
- Be clear and concise

---

## 🔄 Continuous Workflow

### When Documents Updated

```bash
# 1. Process new/updated documents
./scripts/sync-external.sh  # If using external integrations
claude-agent run document-processor --incremental

# 2. Update knowledge graph
claude-agent run knowledge-curator --update-graph

# 3. Regenerate affected deliverables
claude-agent run content-generator --incremental

# 4. Deploy updates (if using website)
claude-agent run website-manager --sync-content
```

### Weekly Maintenance

```yaml
schedule: "0 2 * * 0"  # 2 AM every Sunday
tasks:
  - name: Sync external sources
    command: ./scripts/sync-external.sh

  - name: Rebuild knowledge graph
    agent: knowledge-curator
    command: --rebuild-graph

  - name: Regenerate deliverables
    agent: content-generator
    command: --mode all --force

  - name: Update website
    agent: website-manager
    command: --sync-all
```

---

## 🎨 Style Guide

**[Customize with your style preferences]**

### Tone
- Professional / Casual / Academic / Conversational
- [Describe preferred tone]

### Formatting
- Headings: Use H2 (##) for main sections, H3 (###) for subsections
- Lists: Use `-` for unordered, `1.` for ordered
- Code blocks: Use triple backticks with language identifier
- Emphasis: **Bold** for key terms, *italic* for emphasis

### Terminology
- [Term 1]: Use consistently instead of [alternative]
- [Term 2]: Preferred over [alternative]

---

## 📊 Agent Configuration

### Document Processor

```json
{
  "agent_name": "document-processor",
  "model": "claude-sonnet-4-5",
  "capabilities": [
    "pdf_parsing",
    "markdown_processing",
    "image_analysis",
    "schema_extraction"
  ],
  "output_format": "structured_json"
}
```

### Content Generator

```json
{
  "agent_name": "content-generator",
  "model": "claude-opus-4-6",
  "capabilities": [
    "long_form_writing",
    "template_generation",
    "content_synthesis"
  ],
  "quality_checks": [
    "coherence",
    "completeness",
    "source_alignment"
  ]
}
```

---

## 🔗 External Integrations

### NotebookLM (Optional)

Use NotebookLM for:
- AI-powered research assistant
- Automated summaries and briefings
- Audio overviews
- FAQ generation

Link: `ln -s ~/notebooklm-repo/your-project notebooklm/notebooks`

### Google Workspace (Optional)

Use Google Docs/Sheets for:
- Collaborative document editing
- Real-time data tracking
- Presentation creation

Link: `ln -s ~/Google\ Drive/My\ Drive/YourProject gdocs/drive`

---

## 📝 Customization Notes

**[Add project-specific notes here]**

Important context for agents:
- [Note 1]
- [Note 2]
- [Note 3]

Special instructions:
- [Instruction 1]
- [Instruction 2]

Edge cases to handle:
- [Edge case 1]
- [Edge case 2]

---

**Project Version:** 1.0
**Last Review:** [DATE]
**Maintained By:** Richard Tong
