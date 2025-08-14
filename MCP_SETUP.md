# MCP Services Setup Guide

## Quick Start for Day 1

### 1. Essential MCP Servers to Install

#### Filesystem Server (Already available in Claude)
```bash
# Add to ~/.claude/settings.json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["@modelcontextprotocol/server-filesystem", "/Users/wz/Desktop/zPersonalProjects/14_days_of_agents"]
    }
  }
}
```

#### Gmail Integration
```bash
# Install Gmail MCP server
npm install -g mcp-gsuite

# Configure OAuth credentials:
# 1. Go to https://console.cloud.google.com/
# 2. Create a new project or select existing
# 3. Enable Gmail API
# 4. Create OAuth 2.0 credentials
# 5. Add credentials to settings
```

#### Google Calendar
```bash
# Install Google Calendar MCP
npm install -g mcp-google-calendar

# Uses same OAuth as Gmail
```

#### Notion (if you use it)
```bash
# Get Notion API key from: https://www.notion.so/my-integrations
# Install official Notion MCP server
npm install -g notion-mcp-server
```

### 2. Configure Claude Settings

Add to `~/.claude/settings.json`:

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["@modelcontextprotocol/server-filesystem", "/Users/wz/Desktop/zPersonalProjects/14_days_of_agents"],
      "env": {
        "ALLOWED_PATHS": "/Users/wz/Desktop/zPersonalProjects/14_days_of_agents"
      }
    },
    "gmail": {
      "command": "mcp-gsuite",
      "args": ["--service", "gmail"],
      "env": {
        "OAUTH_CLIENT_ID": "your-client-id",
        "OAUTH_CLIENT_SECRET": "your-client-secret"
      }
    },
    "calendar": {
      "command": "mcp-google-calendar",
      "env": {
        "OAUTH_CLIENT_ID": "your-client-id",
        "OAUTH_CLIENT_SECRET": "your-client-secret"
      }
    }
  }
}
```

### 3. Test Your Setup

After configuration, restart Claude Code and test:

1. **Filesystem**: Ask Claude to read files in your project
2. **Gmail**: Ask Claude to check your recent emails
3. **Calendar**: Ask Claude about your schedule

### 4. Privacy & Security Notes

- All MCP servers run locally on your machine
- Credentials are stored locally in your settings
- Claude only accesses what you explicitly configure
- You can revoke access at any time by removing from settings

### 5. Gradual Integration Schedule

#### Day 1-3: Start Simple
- Filesystem only
- Get comfortable with basic file operations

#### Day 4-6: Add Communication
- Gmail integration
- Calendar awareness

#### Day 7-9: Knowledge Management
- Notion or Obsidian
- Browser automation (if needed)

#### Day 10-12: Advanced
- Slack integration
- Custom workflows
- Cross-service orchestration

### 6. Troubleshooting

If MCP servers don't work:

1. Check Claude desktop app is up to date
2. Verify Node.js is installed: `node --version`
3. Check settings.json syntax (valid JSON)
4. Restart Claude after configuration changes
5. Check server logs in Claude's output

### 7. Creating Your First Daily Log

Once filesystem is working, ask Claude:

"Create today's daily memory log in memory/daily/ with the current date"

This will initialize your memory system for Day 1.

## Ready to Begin

With these services configured, you're ready to start your 14-day journey. Remember:

- Start slowly with just filesystem
- Add services as you feel comfortable
- Document any setup challenges in your daily logs
- The goal is exploration, not perfect integration

Your experiment begins when you're ready. The technology is just the medium - the real exploration is of the human experience within it.