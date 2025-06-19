# Command: /update-memory-bank
# Usage: /update-memory-bank <task_id_or_feature_summary> "<detailed_summary_of_changes_made>" [@relevant_file_path_1.js] [@relevant_test_file.js] [...]
# Example: /update-memory-bank TASK-2.5-FixErrorHandlerLogging "Resolved logger context issues in error-handler.test.js and updated handleServiceError logging" @src/src/utils/error-handler.js @src/tests/unit/utils/error-handler.test.js

Based on the work completed for **"${1}"** with the summary **"${2}"**, and considering the affected code files: ${@slice 3} (if provided, otherwise infer from summary).

Your task is to update the project's Memory Bank comprehensively.

**Key Memory Bank Files to ALWAYS Check & Potentially Update:**
*   `@memory-bank/activeContext.md`: Update "Recently Completed", "Current Status", "Next Immediate Action". Reflect the completion of "${1}" and summarize "${2}".
*   `@memory-bank/progress.md`: Update overall project status, task completion statuses (link to new/updated completion report).
*   `@memory-bank/testingContext.md`: If test strategies, tools, or common issues changed, or if new significant test patterns were established or resolved.
*   `@memory-bank/CLAUDE.md`: If the "Current Project Status & Focus" or "Known Issues" sections need updating based on "${1}" and "${2}".

**Actions to Perform:**

1.  **Analyze Changes:** Review the summary "${2}" and the provided files ${@slice 3}. If necessary, read the content of these code files to fully understand the scope of changes.

2.  **Generate Task Completion Report (if applicable):**
    *   If "${1}" indicates a specific task ID (e.g., "TASK-X.Y"), generate a new task completion report named `task-X.Y-completion-report.md` in `@memory-bank/task-completion-reports/`.
    *   This report should be detailed, based on "${2}" and the affected files, following the style of existing reports.
    *   If no specific task ID, skip this step.

3.  **Identify ALL Relevant Memory Bank Files to Update:**
    *   Beyond the "ALWAYS Check" list, consider component-specific documentation in `@memory-bank/components/`, relevant issue files in `@memory-bank/issues/` (if this work resolves an issue), and potentially `systemPatterns.md` or `techContext.md` if core patterns/tech changed.
    *   Use `@memory-bank/index.md` as a guide to the MB structure.

4.  **Propose Updates for Each Identified Memory Bank File:**
    *   For each MB file you determine needs an update:
        *   Read its current content using `@filePath`.
        *   Propose specific, concise changes (e.g., "In `@memory-bank/activeContext.md`, under 'Recently Completed', add: ..."). Use diff format if helpful.
        *   Ensure `Last Updated` dates and version numbers are incremented where appropriate.
        *   Maintain existing markdown formatting.

5.  **Execute Git Actions for Memory Bank Updates:**
    *   Stage all changes: Execute `git add .` to stage all Memory Bank file modifications
    *   Commit with comprehensive message: Execute `git commit` with a detailed commit message including:
        *   Conventional commit format: "docs(memory-bank): Update MB for completion of ${1}"
        *   Summary of changes made: Brief description of "${2}"
        *   Files affected: List of Memory Bank files updated
        *   Elite task status updates: Any task registry or status changes
        *   Generated with Claude Code signature
    *   Push changes: Execute `git push` to sync with remote repository
    *   
    **Commit Message Template:**
    ```
    docs(memory-bank): Update MB for completion of ${1}
    
    Summary: ${2}
    
    Memory Bank Updates:
    - activeContext.md: [specific changes]
    - progress.md: [specific changes] 
    - ECHO-TASK-REGISTRY.md: [status updates]
    - [other files]: [changes made]
    
    🤖 Generated with [Claude Code](https://claude.ai/code)
    
    Co-Authored-By: Claude <noreply@anthropic.com>
    ```

**Output Format:**
Clearly separate the proposed changes for each Memory Bank file. For new files (like completion reports), provide the full content. For modifications, provide clear instructions or diffs. Finally, list the Git actions.