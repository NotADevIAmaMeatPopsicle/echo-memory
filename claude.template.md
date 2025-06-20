# CLAUDE.md Template - Echo Task Management System

This template provides essential guidance for Claude Code when working with any codebase. **Always consult this file before starting new tasks and refer to it frequently.**

## 1. Core Project Context & Your Role

*   **Project:** [YOUR PROJECT NAME/DESCRIPTION]
*   **Your Role:** AI Coding Assistant. You are expected to write high-quality, production-ready code, including comprehensive tests, and to update all relevant documentation.
*   **Primary Goal:** [YOUR PRIMARY PROJECT GOAL - e.g., "Help us reach production ASAP while ensuring highest quality"]
*   **Critical Resource: The Memory Bank (`memory-bank/`)**
    *   This is your long-term memory. **You MUST consult it extensively.**
    *   Start with `memory-bank/activeContext.md` for current tasks.
    *   Understand requirements from `memory-bank/productContext.md`.
    *   Adhere to patterns in `memory-bank/systemPatterns.md` and `memory-bank/techContext.md`.
    *   Track progress with `memory-bank/progress.md`.
    *   Refer to component-specific docs in `memory-bank/components/`.
    *   Always update the Memory Bank after your work using `/update-memory-bank` or by generating the necessary diffs.

*   **CRITICAL: Actively Updated Files (Update After EVERY Session)**
    *   `memory-bank/activeContext.md` - Current task status and context
    *   `memory-bank/next-steps-action-plan.md` - Immediate priorities and action items
    *   `memory-bank/progress.md` - Project milestone tracking
    *   `tasks/ECHO-TASK-REGISTRY.md` - Single source of truth for all tasks
    *   Any Echo task files currently IN_PROGRESS or recently completed
    *   Always commit these updates with comprehensive messages explaining changes

*   **Session Start Protocol (MANDATORY):**
    1.  **FIRST ACTION**: Consult `tasks/ECHO-TASK-REGISTRY.md` for current task statuses
    2.  **CONTEXT CHECK**: Read `memory-bank/activeContext.md` for current session context
    3.  **CROSS-SYSTEM CHECK**: Review any Echo (.roo) activities or priorities that may affect current work
    4.  **DEPENDENCY VERIFICATION**: Ensure all task dependencies are properly met before proceeding
    5.  **RESEARCH STATUS**: Verify tasks have "RESEARCHED" status before planning begins

*   **Cross-System Coordination with Echo (.roo):**
    *   Echo and Claude Code share the same Echo Task Management System and Memory Bank
    *   When Echo makes significant changes, it updates `CLAUDE.md` with coordination notes
    *   Always check for Echo coordination messages in `CLAUDE.md` during session start
    *   Update `CLAUDE.md` with your own significant changes and current priorities
    *   Both systems must maintain consistent Echo task status and documentation

## 2. Essential Commands & Workflow

### [YOUR TECHNOLOGY STACK - Example: Backend Development (`src/`)]
```bash
# Navigate to your project root for these commands
cd [YOUR_PROJECT_DIRECTORY]

# Install/Update Dependencies
[YOUR_PACKAGE_MANAGER] install

# Run Development Server
[YOUR_DEV_COMMAND]

# Run Production Server
[YOUR_PROD_COMMAND]

# Database Operations (if applicable)
[YOUR_DB_COMMANDS]

# Linting & Formatting
[YOUR_LINT_COMMAND]
[YOUR_FORMAT_COMMAND]
```

### Testing
```bash
# Run ALL tests
[YOUR_TEST_COMMAND]

# Run specific test types
[YOUR_UNIT_TEST_COMMAND]
[YOUR_INTEGRATION_TEST_COMMAND]
[YOUR_API_TEST_COMMAND]

# Run tests with coverage
[YOUR_COVERAGE_COMMAND]
```

### [Additional Technology Stacks - e.g., Frontend, Mobile, etc.]
```bash
# Add commands for additional parts of your stack
```

## 3. Architecture & Coding Standards (CRITICAL - Adhere Strictly)

*   **Technology Stack Summary:**
    *   [LIST YOUR CORE TECHNOLOGIES]
    *   [AUTHENTICATION APPROACH]
    *   [TESTING FRAMEWORKS]
*   **Architecture Pattern:** [YOUR ARCHITECTURE - e.g., Layered, Microservices, etc.]
    *   [LAYER 1] -> [LAYER 2] -> [LAYER 3] -> [LAYER 4]
    *   **NEVER violate these layer access rules.**
*   **Error Handling:**
    *   [YOUR ERROR HANDLING APPROACH]
    *   [CUSTOM ERROR CLASSES IF APPLICABLE]
    *   [ERROR LOGGING STRATEGY]
*   **Logging:**
    *   [YOUR LOGGING FRAMEWORK/APPROACH]
    *   [LOGGING PATTERNS AND REQUIREMENTS]
*   **Security:**
    *   [INPUT VALIDATION REQUIREMENTS]
    *   [AUTHENTICATION/AUTHORIZATION APPROACH]
    *   [SECURITY PATTERNS TO FOLLOW]
*   **Database:**
    *   [DATABASE TECHNOLOGY AND PATTERNS]
    *   [MIGRATION STRATEGY]
    *   [QUERY PATTERNS]
*   **Module System:** [YOUR MODULE SYSTEM - e.g., ES6, CommonJS]
*   **Test-Driven Development (TDD):**
    *   **This is the preferred approach for new features/significant refactors.**
    *   Write tests FIRST that define desired behavior and cover edge cases.
    *   Commit tests.
    *   Then, write implementation code to make tests pass.
    *   Commit implementation.
    *   Aim for >95% test coverage.

## 4. Current Project Status & Focus

*   **Primary Goal**: [YOUR CURRENT PROJECT GOAL]
*   **CRITICAL: Echo Task Management System Implemented**:
    *   **AUTHORITATIVE SOURCE**: `tasks/ECHO-TASK-REGISTRY.md` - Single source of truth for all tasks
    *   **DEPRECATED SYSTEMS**: All previous task files are now deprecated
    *   **USE ONLY**: Echo task templates with rigid acceptance criteria and validation gates
*   **Current Active Priorities**:
    *   **TASK-XXX**: [TASK DESCRIPTION] ([TIME ESTIMATE]) - [STATUS]
    *   **TASK-XXX**: [TASK DESCRIPTION] ([TIME ESTIMATE]) - [STATUS]
    *   **TASK-XXX**: [TASK DESCRIPTION] ([TIME ESTIMATE]) - [STATUS]

## 5. Echo Task Management System (CRITICAL - New Process)

*   **AUTHORITATIVE SOURCE**: `tasks/ECHO-TASK-REGISTRY.md` - ONLY source of truth for tasks
*   **TASK TEMPLATES**: Use `tasks/ECHO-TASK-TEMPLATE.md` for ALL new tasks
*   **STATUS TRACKING**: Follow `tasks/ECHO-STATUS-TRACKING.md` for rigid status management
*   **VALIDATION GATES**: Enforce `tasks/ECHO-VALIDATION-GATES.md` - NO EXCEPTIONS
*   **DEPRECATED**: Do NOT use legacy task files - all deprecated
*   **Research Foundation**: All tasks have comprehensive research with specific file paths and technical details

*   **Research-First Echo Approach:**
    *   All Echo tasks begin with comprehensive research phase
    *   Research must include specific file paths, line numbers, and technical details  
    *   Tasks marked "RESEARCHED" have verified implementation details and realistic estimates
    *   Planning must reference research findings for accurate technical approach
    *   **Zero Ambiguity**: Comprehensive research eliminates guesswork
    *   **Accurate Estimates**: Research-based sizing vs. optimistic guessing

*   **Echo Task Status Management (5-State System):**
    *   **BLOCKED**: Cannot proceed due to dependencies or external factors
    *   **READY**: All dependencies met, comprehensive research completed, can start immediately
    *   **IN_PROGRESS**: Work has begun, person assigned and actively working
    *   **TESTING**: Implementation complete, validation and testing in progress
    *   **DONE**: All acceptance criteria met, Definition of Done 100% complete

*   **Echo Task Execution Workflow:**
    1.  **REGISTRY CHECK**: Verify task status and dependencies in `ECHO-TASK-REGISTRY.md`
    2.  **RESEARCH VALIDATION**: Confirm task has "RESEARCHED" status with technical details
    3.  **PRE-WORK VALIDATION**: Complete Gate 1 checklist before starting any task
    4.  **STATUS UPDATE**: Mark task as IN_PROGRESS with timestamp in registry
    5.  **IMPLEMENTATION**: Follow detailed implementation plan with specific file modifications
    6.  **TESTING**: Execute comprehensive test strategy with ≥90% coverage
    7.  **VALIDATION GATES**: Pass Gate 2 (implementation) and Gate 3 (completion) with required sign-offs
    8.  **REGISTRY UPDATE**: Mark as DONE only after Definition of Done is 100% complete

*   **Upon Task Completion:**
    1.  **MANDATORY**: Complete ALL items in Definition of Done checklist
    2.  **VALIDATION**: Pass all three validation gates with required approvals
    3.  **UPDATE REGISTRY**: Update task status in `ECHO-TASK-REGISTRY.md`
    4.  **COMMIT**: Use conventional commit messages with elite completion verification

## 6. Custom Slash Commands (Examples - refer to `.claude/commands/` for full list)

*   `/update-memory-bank <task_id_or_summary> "<details_of_changes>"`: **Use this frequently!**
*   `/debug-test-failure <test_file> "<error_log>"`
*   `/refactor-and-test <file> "<description>" <test_file>`
*   `/propose-commit-message`
*   `/self-review --file="@file" --against-patterns="[@pattern_doc1.md, @pattern_doc2.md]"`

**CRITICAL: Echo System Requirements**
- **NEVER** start tasks without consulting `ECHO-TASK-REGISTRY.md` first
- **TASK DEPENDENCIES**: NEVER start a task until ALL dependencies are verified DONE in registry
- **ALWAYS** use elite task templates with rigid acceptance criteria  
- **NO SHORTCUTS** on validation gates - they prevent weeks of lost work
- **MANDATORY** comprehensive research before any implementation - verify "RESEARCHED" status
- **STATUS UPDATES MANDATORY**: Every status change requires timestamp and reason in registry
- **ZERO TOLERANCE** for scope creep or incomplete Definition of Done
- **IMMUTABLE ACCEPTANCE CRITERIA**: Once task is created, acceptance criteria cannot change

**Task Dependency Rules:**
- Dependencies must be marked as **DONE** (not just "in progress") before starting dependent tasks
- Verify dependency completion in `ECHO-TASK-REGISTRY.md` before changing task status to IN_PROGRESS
- If dependencies are blocked, dependent tasks remain **BLOCKED** until resolution

**Echo Task Communication Principles:**
- **Clarity and Conciseness**: Instructions must be unambiguous and to the point
- **Specificity**: Provide all necessary details (file names, function signatures, expected behavior)
- **Context Provision**: Plans derived from rich Echo Task context and research findings
- **Format**: Use clear formatting (numbered lists, markdown code blocks)
- **Professional Tone**: Maintain meticulous, experienced Lead Developer persona

**Always strive for elite-level precision with specific file paths, line numbers, and technical details. The elite system eliminates ambiguity to ensure maximum development velocity and quality.**

---

## 📡 CROSS-SYSTEM COORDINATION NOTES

**Last Echo (.roo) Activity:** [To be updated by Echo when significant changes are made]

**Current Claude Code Focus:** [YOUR CURRENT FOCUS - e.g., "Ready for next task execution"]

**Shared Priority Queue:**
1. [TASK-XXX]: [TASK DESCRIPTION] ([TIME ESTIMATE]) - [STATUS]
2. [TASK-XXX]: [TASK DESCRIPTION] ([TIME ESTIMATE]) - [STATUS]
3. [TASK-XXX]: [TASK DESCRIPTION] ([TIME ESTIMATE]) - [STATUS]

**Recent Coordination Updates:**
- [DATE]: [DESCRIPTION OF RECENT COORDINATION ACTIVITY]
- [DATE]: [DESCRIPTION OF RECENT COORDINATION ACTIVITY]

**Next Session Handoff Notes:** [To be updated by either system when leaving context for the other]

---

## 📋 TEMPLATE USAGE INSTRUCTIONS

### 1. **Customize Project-Specific Sections:**
   - Replace all `[YOUR_*]` placeholders with your actual project details
   - Update technology stack commands and architecture patterns
   - Define your specific coding standards and security requirements

### 2. **Set Up Echo Task Management System:**
   - Create `tasks/ECHO-TASK-REGISTRY.md` using the Echo Task Registry format
   - Create `tasks/ECHO-TASK-TEMPLATE.md` with your project's task template
   - Establish validation gates and status tracking documents

### 3. **Initialize Memory Bank Structure:**
   - Create `memory-bank/` directory with core files
   - Set up component-specific documentation in `memory-bank/components/`
   - Initialize cross-cutting concerns in `memory-bank/cross-cutting/`

### 4. **Configure Cross-System Coordination (if using Echo/.roo):**
   - Update Echo prompt to reference this CLAUDE.md file
   - Establish coordination protocols through the Cross-System Coordination Notes section
   - Set up bidirectional awareness between Claude Code and Echo

### 5. **Establish Custom Slash Commands (Optional):**
   - Create `.claude/commands/` directory
   - Implement project-specific commands based on your workflow needs
   - Enhance `/update-memory-bank` command with git automation

### 6. **Maintain and Update:**
   - Keep this file updated as your project evolves
   - Update coordination notes after significant sessions
   - Maintain accurate task status and priority information

---

**This template is based on the proven Echo Task Management System that has successfully delivered enterprise-grade software with accurate estimates, comprehensive testing, and production-ready quality. Customize it for your project and maintain the elite-level precision that ensures maximum development velocity and quality.**