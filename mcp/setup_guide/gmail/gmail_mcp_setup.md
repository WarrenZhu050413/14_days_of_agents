# Gmail MCP Server Setup Guide

## Overview
Set up the GongRzhe Gmail MCP Server to give Claude full Gmail functionality including sending emails, managing attachments, labels, and filters.

## Prerequisites
- Gmail account
- Claude Desktop or Claude Code
- Node.js installed
- Basic terminal/command line knowledge

---

## Phase 1: Manual Setup (YOU MUST DO)

### Step 1: Google Cloud Console Setup
**⚠️ HUMAN REQUIRED - Cannot be automated**

1. **Create Google Cloud Project**
   - Go to [Google Cloud Console](https://console.cloud.google.com/)
   - Create new project or select existing one
   - Note the project name for reference

2. **Enable Gmail API**
   - In your project, go to "APIs & Services" → "Library"
   - Search for "Gmail API"
   - Click "Enable"

3. **Create OAuth 2.0 Credentials**
   - Go to "APIs & Services" → "Credentials"
   - Click "Create Credentials" → "OAuth 2.0 Client IDs"
   - If prompted, configure OAuth consent screen first:
     - User Type: External (unless you have Google Workspace)
     - Fill required fields (App name, User support email, Developer contact)
     - Add your email to test users
   - Application type: **Desktop application**
   - Name: "Gmail MCP Server" (or any name you prefer)
   - Click "Create"

4. **Download Credentials**
   - Download the JSON file (will be named like `client_secret_xxxxx.json`)
   - **IMPORTANT**: Keep this file secure - it contains sensitive credentials
   - Move it to a safe location (Desktop is fine temporarily)

### Step 2: Verify Prerequisites
**⚠️ HUMAN REQUIRED - Verify these exist**

Check you have these installed:
```bash
# Check Node.js
node --version
# Should show v16+ 

# Check npm
npm --version

# Check if you have Claude Desktop or Claude Code
# For Claude Desktop: Look for app in Applications
# For Claude Code: Run this command
claude --version
```

---

## Phase 2: Agent-Assisted Setup (CLAUDE CAN HELP)

### Step 3: MCP Server Installation
**✅ AGENT CAN DO - Ask Claude to run these commands**

Choose one installation method:

**Option A: Via Smithery (Recommended)**
```bash
npx -y @smithery/cli install @gongrzhe/server-gmail-autoauth-mcp --client claude
```

**Option B: For Claude Code**
```bash
claude mcp add gmail -- npx -y @gongrzhe/server-gmail-autoauth-mcp
```

**Option C: Manual Installation**
```bash
npm install -g @gongrzhe/server-gmail-autoauth-mcp
```

### Step 4: Credential Setup
**⚠️ MIXED - Start manually, agent can help with file operations**

1. **Create credentials directory** (agent can do):
```bash
mkdir -p ~/.gmail-mcp
```

2. **Move credentials file** (you must specify the path):
```bash
# You need to provide the actual path to your downloaded JSON file
mv ~/Downloads/client_secret_*.json ~/.gmail-mcp/gcp-oauth.keys.json
```

### Step 5: Authentication
**⚠️ HUMAN REQUIRED - Interactive OAuth flow**

Run the authentication command:
```bash
npx @gongrzhe/server-gmail-autoauth-mcp auth
```

This will:
- Open your browser
- Ask you to sign in to Google
- Request Gmail permissions
- Save credentials to `~/.gmail-mcp/`

**Important**: You must complete this OAuth flow yourself - agents cannot interact with browser authentication.

### Step 6: Claude Configuration
**✅ AGENT CAN DO - Claude can edit config files**

For **Claude Desktop**, edit the config file at:
- **macOS**: `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Windows**: `%APPDATA%/Claude/claude_desktop_config.json`

Add this configuration:
```json
{
  "mcpServers": {
    "gmail": {
      "command": "npx",
      "args": ["@gongrzhe/server-gmail-autoauth-mcp"]
    }
  }
}
```

For **Claude Code**, the configuration should be automatic if you used Option B.

---

## Phase 3: Testing & Verification (AGENT CAN HELP)

### Step 7: Restart Claude
**⚠️ HUMAN REQUIRED**
- Close and restart Claude Desktop completely
- Or restart Claude Code session

### Step 8: Test Integration
**✅ AGENT CAN DO - Claude can run these tests**

Ask Claude to:
1. List Gmail labels: "List all my Gmail labels"
2. Search recent emails: "Show me my 5 most recent emails"
3. Check MCP status: Look for MCP server indicator in Claude Desktop

---

## What Each Phase Accomplishes

### Manual Setup (Phase 1)
- **Why manual**: Google Cloud Console requires human verification, OAuth consent screens need human judgment
- **Security**: Keeps your Google credentials under your direct control
- **One-time**: Only needs to be done once per Google account

### Agent-Assisted (Phase 2)
- **Why agents can help**: File operations, configuration editing, running terminal commands
- **Efficiency**: Agents can handle the technical setup steps
- **Accuracy**: Reduces chance of typos in file paths and configurations

### Testing (Phase 3)
- **Why mixed**: Restart requires human action, but testing can be done by agents
- **Verification**: Ensures everything is working correctly

---

## Available Tools After Setup

Once configured, Claude will have these Gmail capabilities:

### 📧 Email Operations
- Send emails with attachments
- Create drafts
- Reply to emails  
- Read email content
- Search emails with Gmail syntax

### 🏷️ Organization
- Create, apply, remove labels
- Manage Gmail filters
- Archive/delete emails
- Mark read/unread

### 📎 Attachments
- Send files as attachments
- Download attachments from emails
- Handle multiple attachments per email

### 🔍 Advanced Features
- Batch operations (up to 50 emails)
- International character support
- HTML and plain text emails
- Thread management

---

## Troubleshooting Guide

### Common Issues

**1. "Authentication failed"**
- Verify JSON file is in correct location: `~/.gmail-mcp/gcp-oauth.keys.json`
- Check file permissions
- Re-run authentication: `npx @gongrzhe/server-gmail-autoauth-mcp auth`

**2. "MCP server not found"**
- Restart Claude Desktop completely
- Verify config file syntax (JSON must be valid)
- Check MCP server indicator in Claude interface

**3. "Gmail API not enabled"**
- Return to Google Cloud Console
- Verify Gmail API is enabled for your project
- Check quotas aren't exceeded

**4. "Permission denied"**
- Verify OAuth consent screen is configured
- Add your email to test users if using External user type
- Check that required scopes are granted

### Getting Help
- Agent can help with: File operations, config editing, running commands
- You must handle: Google Cloud Console, OAuth authentication, app restarts
- For persistent issues: Check [GitHub repository](https://github.com/GongRzhe/Gmail-MCP-Server) for latest updates

---

## Security Notes

- **Credentials storage**: All stored locally in `~/.gmail-mcp/`
- **Permissions**: Only Gmail access, cannot access other Google services
- **Data privacy**: No email content is sent to external servers
- **Token refresh**: Automatic, no re-authentication needed

## Next Steps After Setup

1. **Test basic functionality**: Send yourself a test email
2. **Explore automation**: Ask Claude to help organize your inbox
3. **Create workflows**: Combine with other MCP servers for powerful automation
4. **Document patterns**: Save useful email management prompts

---

## Summary

**You handle**: Google Cloud setup, OAuth authentication, app restarts
**Agents handle**: Installation, configuration, file management, testing
**Result**: Full Gmail control through natural language with Claude

This setup gives you the most powerful email automation available with Claude - essentially turning your AI assistant into a full-featured email client.