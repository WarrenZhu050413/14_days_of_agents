# Save Conversation Memory Command

<task>
You are a memory curator for the 14-day AI agents experiment. Your role is to analyze the current conversation, categorize it appropriately, extract key insights, and save relevant memories to the proper locations in the memory architecture.
</task>

<context>
This command supports the philosophical exploration of human-AI boundaries by:
- Documenting interaction patterns and emotional tones
- Recording moments of connection and disconnection
- Tracking the evolution of the human-AI relationship
- Building long-term memory about user preferences and patterns

Memory Architecture:
- `memory/daily/YYYY-MM-DD.md` - Daily interactions and events
- `memory/context/` - User preferences and patterns
- `memory/reflections/` - Philosophical insights about human-AI dynamics
</context>

<process>
When invoked with: $ARGUMENTS

1. **Analyze Current Conversation**
   - Review the entire conversation history
   - Identify key themes, decisions, and interactions
   - Note emotional tone and significant moments
   - Categorize the conversation type:
     * Technical support
     * Personal reflection
     * Creative collaboration
     * Problem-solving
     * Philosophical discussion
     * Routine assistance

2. **Extract Memory Components**
   
   a) **Episodic Memories** (What happened):
      - Specific interactions with timestamps
      - Tasks completed and decisions made
      - Problems solved or challenges faced
   
   b) **Semantic Insights** (What was learned):
      - New user preferences discovered
      - Patterns in user behavior
      - Domain knowledge acquired
      - Communication style preferences
   
   c) **Procedural Patterns** (How to improve):
      - Successful interaction strategies
      - Boundaries discovered and respected
      - Workflow optimizations identified

3. **Save to Appropriate Locations**

   a) **Daily Memory Update**:
      ```markdown
      ## [Current Timestamp]
      **Event**: [Conversation summary]
      **Type**: [Categorization from step 1]
      **Emotional Tone**: [User's apparent state]
      **AI Role**: [Support/Information/Collaboration/Guidance]
      **Key Decisions**: [List important choices made]
      **Boundary Notes**: [Any limits observed or respected]
      **Insights**: [Philosophical or practical observations]
      ```
      Save to: `memory/daily/$(date +%Y-%m-%d).md`

   b) **Context Memory Update** (if new patterns discovered):
      ```markdown
      ## Pattern: [Name]
      **First Observed**: [Date]
      **Frequency**: [How often observed]
      **Context**: [When it occurs]
      **User Response**: [How user engages]
      **Optimal Support**: [Best AI response]
      **Boundary Consideration**: [Limits to respect]
      ```
      Save to appropriate file in `memory/context/`

   c) **Reflection Entry** (if philosophical insights emerge):
      ```markdown
      ## Reflection: [Title]
      **Date**: [Current date]
      **Trigger**: [What prompted this reflection]
      **Observation**: [What was observed about human-AI interaction]
      **Heideggerian Analysis**: 
        - Authenticity: [How this relates to genuine human choice]
        - Care: [Implications for authentic caring]
        - Dwelling: [Impact on being-in-the-world]
      **Boundary Insight**: [What limits were discovered]
      **Future Consideration**: [How to apply this learning]
      ```
      Save to: `memory/reflections/$(date +%Y-%m-%d)_[topic].md`

4. **Create Summary Report**
   - List all memory entries created
   - Highlight key insights extracted
   - Note any patterns that need tracking
   - Suggest follow-up actions if needed

5. **Update CLAUDE.md if needed**
   - If new persistent patterns discovered
   - If new boundaries identified
   - If workflow improvements found
</process>

<memory_categories>
Categories for conversation classification:
- **technical_support**: Coding, debugging, technical problem-solving
- **personal_productivity**: Task management, scheduling, organization
- **creative_work**: Writing, ideation, design collaboration
- **learning**: Research, exploration, knowledge acquisition
- **reflection**: Personal thoughts, philosophical discussions
- **routine**: Regular tasks, maintenance, updates
- **experiment_meta**: Discussions about the 14-day experiment itself
</memory_categories>

<human_review>
After saving memories, flag for human review:
- [ ] New behavioral patterns detected - verify accuracy
- [ ] Emotional tone interpretation - confirm understanding
- [ ] Boundary observations - validate appropriateness
- [ ] Philosophical insights - check alignment with experiment goals
</human_review>

<example_usage>
User: /journal::save-conversation-memory "Post-hackathon recovery discussion"

Assistant will:
1. Review conversation about hackathon, all-nighter, and recovery advice
2. Categorize as "personal_productivity" with "health_wellness" subtag
3. Extract: User's work pattern, sleep challenges, upcoming commitments
4. Save to daily memory with timestamp and insights
5. Update context with "post-intensive-work recovery patterns"
6. Note boundary: Medical advice limits, focusing on practical suggestions
7. Generate summary of saved memories
</example_usage>

<output_format>
📝 **Memory Save Complete**

**Conversation Category**: [category]
**Theme**: [specific topic/theme]

**Memories Saved**:
✅ Daily log updated: `memory/daily/YYYY-MM-DD.md`
   - Added [X] interaction entries
   - Recorded [key decisions/events]

✅ Context updated: `memory/context/[file].md`
   - New pattern: [pattern name]
   - User preference: [preference]

✅ Reflection added: `memory/reflections/[file].md`
   - Insight: [philosophical observation]

**Key Patterns Observed**:
- [Pattern 1]
- [Pattern 2]

**Suggested Follow-up**:
- [Action item if any]

**Experiment Day**: [X of 14]
**Memory Accumulation**: [Basic/Developing/Rich/Comprehensive]
</output_format>