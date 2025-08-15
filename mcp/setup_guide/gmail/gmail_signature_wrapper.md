# Gmail Signature Wrapper Options

## Option 1: Automatic Signature Addition (Simple)
Instead of modifying the MCP server, always append the signature when calling the send_email function:

```python
# When sending emails, always append:
body = original_body + "\n\n---\nSent from Claude Code"
```

## Option 2: Local Fork (Most Control)
1. Fork the MCP server code
2. Modify the `createEmailMessage` function to auto-append signature
3. Point Claude to use your local version

## Option 3: Proxy MCP Server (Advanced)
Create a new MCP server that:
1. Accepts the same commands as gmail server
2. Intercepts send_email calls
3. Adds signature before forwarding to actual gmail server

## Option 4: Claude Configuration (Easiest)
Add to your CLAUDE.md:

```markdown
## Email Signature Rule
IMPORTANT: When using mcp__gmail__send_email, ALWAYS append this signature to the body:

---
Sent from Claude Code
```

This ensures Claude always adds the signature without modifying any code.