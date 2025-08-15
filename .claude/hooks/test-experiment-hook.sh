#!/bin/bash
# Test script for the experiment memory hook

echo "Testing 14-Day Experiment Memory Hook"
echo "======================================"
echo

# Test 1: Basic functionality test
echo "Test 1: Basic functionality with experiment directory"
echo '------------------------------------------------------'
TEST_INPUT='{
  "session_id": "test-session-123",
  "transcript_path": "/tmp/test-transcript.json",
  "cwd": "/Users/wz/Desktop/zPersonalProjects/14_days_of_agents",
  "hook_event_name": "UserPromptSubmit",
  "prompt": "Help me understand the codebase"
}'

echo "$TEST_INPUT" | python3 .claude/hooks/experiment-memory-hook.py
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    echo "✅ Test 1 PASSED: Hook executed successfully"
else
    echo "❌ Test 1 FAILED: Hook returned exit code $EXIT_CODE"
fi

echo
echo

# Test 2: Test with non-experiment directory (should exit silently)
echo "Test 2: Non-experiment directory (should exit silently)"
echo '-------------------------------------------------------'
TEST_INPUT_2='{
  "session_id": "test-session-456",
  "transcript_path": "/tmp/test-transcript.json",
  "cwd": "/Users/wz/Desktop/other-project",
  "hook_event_name": "UserPromptSubmit",
  "prompt": "Test prompt"
}'

OUTPUT=$(echo "$TEST_INPUT_2" | python3 .claude/hooks/experiment-memory-hook.py 2>&1)
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ] && [ -z "$OUTPUT" ]; then
    echo "✅ Test 2 PASSED: Hook exited silently for non-experiment directory"
else
    echo "❌ Test 2 FAILED: Hook should exit silently for non-experiment directory"
    echo "Output was: $OUTPUT"
fi

echo
echo

# Test 3: Invalid JSON handling
echo "Test 3: Invalid JSON input handling"
echo '------------------------------------'
echo "invalid json" | python3 .claude/hooks/experiment-memory-hook.py 2>/dev/null
EXIT_CODE=$?

if [ $EXIT_CODE -eq 1 ]; then
    echo "✅ Test 3 PASSED: Hook properly handled invalid JSON"
else
    echo "❌ Test 3 FAILED: Hook should return exit code 1 for invalid JSON"
fi

echo
echo

# Test 4: Check if memory directory gets created
echo "Test 4: Memory directory creation"
echo '---------------------------------'
TODAY=$(date +%Y-%m-%d)
MEMORY_FILE="memory/daily/${TODAY}.md"

# Run the hook to ensure directory creation
echo "$TEST_INPUT" | python3 .claude/hooks/experiment-memory-hook.py > /dev/null 2>&1

if [ -d "memory/daily" ]; then
    echo "✅ Test 4 PASSED: Memory directory structure created"
    if [ -f "$MEMORY_FILE" ]; then
        echo "✅ Daily memory file exists: $MEMORY_FILE"
    else
        echo "⚠️  Daily memory file not found: $MEMORY_FILE"
    fi
else
    echo "❌ Test 4 FAILED: Memory directory not created"
fi

echo
echo "======================================"
echo "Test suite completed"