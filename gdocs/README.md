# Google Workspace Integration

**Purpose:** Synced Google Docs, Sheets, and Slides for collaborative editing.

## Setup

### Option 1: Google Drive Desktop
```bash
ln -s ~/Google\ Drive/My\ Drive/YourProject ./drive
```

### Option 2: Rclone
```bash
rclone sync gdrive:YourProject ./sync
```

## Exports

Export Google Workspace files to:
- `exports/pdfs/` - PDF versions
- `exports/docx/` - Word documents
- `exports/xlsx/` - Excel spreadsheets

See main project README for full documentation.
