# Task [TASK-ID]: Brief Descriptive Title

## 🎯 Task Description
*A clear, concise overview of what this task aims to achieve. What is the primary goal? What feature will be built, or what bug will be fixed?*

## ⚙️ Prerequisites
*List all conditions that must be met before starting this task.*
-   *Example: Specific Memory Bank documents read (e.g., `productContext.md`, relevant component docs).*
-   *Example: Previous tasks completed (e.g., `TASK-001`).*
-   *Example: Specific tools or libraries installed and configured.*
-   *Example: API keys available in `.env`.*
-   *Example: Local development environment running and accessible.*

## 📋 Detailed Requirements
*Break down the task into specific, measurable, achievable, relevant, and time-bound (SMART) requirements if applicable. Use a numbered or bulleted list.*
1.  *Requirement 1: Detailed description.*
2.  *Requirement 2: Detailed description, including specific inputs/outputs if relevant.*
    *   *Sub-requirement 2a.*
3.  *Requirement 3: Link to UI mockups or design specifications if applicable.*

## 🧠 Context from Memory Bank
*List specific sections or key points from Memory Bank files that are CRITICAL for understanding and completing this task. This helps Echo focus.*
-   **`productContext.md`**: *e.g., "Section 2. Problems Solved" to understand user needs.*
-   **`techContext.md`**: *e.g., "Section 1. Primary Technology Stack" for approved libraries.*
-   **`systemPatterns.md`**: *e.g., "Pattern: Planner-Executor Delegation" if relevant to how this task should be approached.*
-   **`components/my_component.md`**: *e.g., "API definition for MyComponent."*

## 🛠️ Step-by-Step Implementation Guide / Plan
*This section can be initially drafted by a human or by Echo itself. It should be a granular, sequential plan.*
*If Echo is to generate this, the instruction might be: "Based on the requirements and Memory Bank context, generate a detailed, step-by-step implementation plan below."*

### A. Environment Verification & Setup (Perform these first!)
*Specific checks to ensure the environment is ready for THIS task.*
1.  *Verify API key `XYZ_API_KEY` is present in `.env`.*
2.  *Ensure `some_tool` is installed and accessible in `PATH`.*
3.  *Confirm mock data server is running at `http://localhost:3001`.*

### B. Core Implementation / Debugging Steps
*The actual coding/debugging steps. These should be actionable instructions for an Executor AI or a developer.*
1.  **File:** `src/module/file.py`
    *   **Action:** Create new function `my_function(param1, param2)`.
    *   **Logic:** *Describe the function's logic, inputs, outputs, and any side effects.*
    *   **Context:** *Reference relevant Memory Bank sections or previous steps.*
2.  **File:** `src/module/another_file.py`
    *   **Action:** Modify existing class `MyClass`.
    *   **Change:** *Add new method `new_method()` or update `existing_method()`.*
    *   **Details:** *Describe changes precisely.*
3.  **Tool Usage:**
    *   **Tool:** `CodeWriterTool`
    *   **Input:** `file_path='output/generated_code.py'`, `code='...your generated code...'`
    *   **Purpose:** *To save the generated Python script.*

### C. Final Verification & Cleanup
1.  *Run linter (`flake8` or `pylint`) on modified files.*
2.  *Run formatter (`black` or `autopep8`) on modified files.*
3.  *Remove any temporary files created.*
4.  *Manually verify the output/behavior against Requirement X.*

## 🧪 Testing Requirements
*Specific instructions on what and how to test for this task.*
1.  **Unit Tests:**
    *   For `my_function(param1, param2)`:
        *   Test case 1: `param1` is X, `param2` is Y, expected output Z.
        *   Test case 2: Edge case for `param1` (e.g., None, empty).
    *   Ensure tests are added to `tests/unit/test_file.py`.
2.  **Integration Tests:**
    *   Test the interaction between `my_function` and `MyClass.new_method()`.
    *   Scenario: *Describe the integration test scenario.*
3.  **Manual Verification:**
    *   *Steps for manual verification if automated tests are insufficient or not applicable.*

## ⚠️ Common Pitfalls / Troubleshooting
*Known issues, common mistakes to avoid, or troubleshooting steps relevant to this task.*
-   *Pitfall: Forgetting to update the `activeContext.md` after significant steps.*
-   *Troubleshooting: If API returns `401 Unauthorized`, double-check the API key in `.env`.*

## ✅ Completion Criteria
*How will we know this task is truly done? Define clear, objective criteria.*
-   All requirements listed in "Detailed Requirements" are met.
-   All steps in "Step-by-Step Implementation Guide" are completed.
-   All tests specified in "Testing Requirements" pass.
-   Code has been linted and formatted.
-   `activeContext.md` and `progress.md` have been updated to reflect task completion.
-   (If applicable) Pull Request created, reviewed, and merged.
-   (If applicable) Relevant Memory Bank documents (e.g., component docs, system patterns) updated with learnings from this task.

## 边界 (Boundaries)
### In Scope
*Clearly define what IS part of this task.*
-   *Implementing feature X as described.*
-   *Writing unit tests for new code.*

### Out of Scope
*Clearly define what IS NOT part of this task to prevent scope creep.*
-   *Refactoring module Y (this should be a separate task).*
-   *Updating the UI design (covered in TASK-ABC).*
-   *Deploying to production.*

## 🕰️ Estimated Effort
*(Optional: A rough estimate of time or complexity. E.g., Small, Medium, Large, or X hours/days)*
-   Complexity: Medium

## 🔗 Related Tasks/Documents
-   Parent Task: `[TASK-PARENT-ID]`
-   Child Tasks: `[TASK-CHILD-1]`, `[TASK-CHILD-2]`
-   Related Document: [`memory-bank/some_relevant_doc.md`](../memory-bank/some_relevant_doc.md)
-   External Link: [Jira Ticket XYZ](http://jira.example.com/browse/XYZ)

---
*This template is a living document. Improve it as the system evolves.*
*Remember to update `activeContext.md` and `progress.md` upon significant progress or completion.*