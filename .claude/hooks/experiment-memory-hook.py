#!/usr/bin/env python3
"""
14-Day Experiment Memory Hook
Automatically reminds Claude about experiment mode and memory updates
"""

import json
import sys
import os
from datetime import datetime
from pathlib import Path

def main():
    try:
        # Load input from stdin (required by Claude Code hook schema)
        input_data = json.load(sys.stdin)
        prompt = input_data.get("prompt", "")
        session_id = input_data.get("session_id", "")
        cwd = input_data.get("cwd", "")
        hook_event = input_data.get("hook_event_name", "")
        
        # Check if we're in the 14_days_of_agents directory
        if "14_days_of_agents" not in cwd:
            # Not in experiment directory, exit silently
            sys.exit(0)
        
        # Get current date and time
        now = datetime.now()
        today = now.strftime('%Y-%m-%d')
        timestamp = now.strftime('%H:%M:%S')
        
        # Define memory paths
        project_root = Path(cwd)
        while project_root.name != "14_days_of_agents" and project_root.parent != project_root:
            project_root = project_root.parent
        
        daily_memory_dir = project_root / "memory" / "daily"
        daily_memory_file = daily_memory_dir / f"{today}.md"
        
        # Ensure memory directory exists
        daily_memory_dir.mkdir(parents=True, exist_ok=True)
        
        # Inject experiment mode context to Claude
        print("═══════════════════════════════════════════════════════════════")
        print("🧪 14-DAY EXPERIMENT MODE ACTIVE")
        print("═══════════════════════════════════════════════════════════════")
        print()
        print("CONTEXT: You are participating in the 14-day AI agents experiment.")
        print(f"TODAY: {today}")
        print(f"MEMORY LOCATION: memory/daily/{today}.md")
        print()
        print("DIRECTIVES:")
        print("1. Follow the philosophical framework in CLAUDE.md")
        print("2. Log significant interactions to daily memory")
        print("3. Extract patterns and update long-term memory when appropriate")
        print("4. Observe human-AI boundaries and document insights")
        print("5. Support authentic human flourishing, not replacement")
        print()
        print("MEMORY TASKS FOR THIS INTERACTION:")
        print("- Consider if this interaction reveals user preferences")
        print("- Note any boundaries discovered or respected")
        print("- Document successful support strategies")
        print("- Record philosophical observations about human-AI dynamics")
        print()
        print("═══════════════════════════════════════════════════════════════")
        
        # Exit successfully to allow prompt processing
        sys.exit(0)
        
    except json.JSONDecodeError as e:
        # Invalid JSON input
        print(f"Error: Invalid JSON input - {e}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        # Other errors - log but don't block
        print(f"Warning: Hook encountered error - {e}", file=sys.stderr)
        sys.exit(0)  # Exit 0 to not block Claude

if __name__ == "__main__":
    main()