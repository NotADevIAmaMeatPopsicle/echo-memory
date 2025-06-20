# Echo Task Management System

## Quick Start: What is This?

At its heart, the Echo Task Management System is a powerful **AI-driven development framework** that you use with your favorite Large Language Model (LLM) directly within your development environment—like VS Code (using extensions such as Cline or Roo), Cursor, or through chat interfaces like Claude, ChatGPT, etc.

Think of "Echo" as an AI assistant that's exceptionally good at understanding, organizing, and helping you build software projects. It's designed to help you create higher-quality software more consistently by:

*   **Remembering everything important** about your project in a structured "Memory Bank."
*   **Breaking down complex tasks** into manageable, documented steps with validation gates.
*   **Guiding you to follow documentation and best practices** as you code.
*   **Ensuring production-ready quality** through comprehensive acceptance criteria and testing standards.

**How it Works:**

*   **For an Existing Project:**
    *   When you first run Echo in a folder with an existing project and tell it to "Initialize Memory Bank," it will:
        *   Scan your current codebase, READMEs, and any existing documentation.
        *   Automatically create and populate a `memory-bank/` directory. This builds a structured understanding of your project's goals, technologies, architecture, and components.
        *   Essentially, it "onboards" itself to your project, ready to assist with a deep contextual understanding.

*   **For a New Project:**
    *   If you're starting from scratch, Echo will:
        *   Guide you through creating the necessary project structure (like `memory-bank/`, `tasks/`, etc.) if it doesn't exist.
        *   Ask you questions to define the core aspects of your new application.
        *   **Minimum Seed Information to Provide Echo:**
            *   The main idea or goal of the project (e.g., "A web app for tracking personal fitness goals").
            *   Key technologies you plan to use, if known (e.g., "Python with Flask for the backend, React for the frontend").
        *   Help you create initial task files and plan out the first steps.

Once set up, Echo acts as an expert architect and lead developer, using its Memory Bank and detailed task plans to help you write, refactor, and document code efficiently with production-ready quality standards.

---

## Overview

The Echo Task Management System provides:

- **5-State Task Workflow**: BLOCKED | READY | IN_PROGRESS | TESTING | DONE
- **Research-First Approach**: Comprehensive technical analysis before implementation
- **Validation Gates**: Pre-work, mid-work, and completion quality checks
- **Cross-System Coordination**: Seamless handoffs between Claude Code and Echo (.roo)
- **Memory Bank**: Persistent documentation and project context
- **Production Standards**: Code with 90%+ test coverage requirements

## 🚀 Getting Started

### Initial Setup in Your Project:
1. In your chosen IDE or LLM interaction environment, load the Echo system prompt as the system prompt for your primary LLM instance.
2. You don't need to manually create any files or folders beforehand.
3. Start your first session with Echo by issuing a command like: **"Initialize Memory Bank."**
4. Echo will then begin its Memory Bank Bootstrap Protocol:
    - Automatically create all necessary directories and files (`memory-bank/`, `tasks/`, etc.) if they don't exist.
    - For new projects: Guide you in creating content for core Memory Bank files by asking targeted questions.
    - For existing projects: Analyze resources and populate the Memory Bank files with project understanding.
    - Ensure task templates are correctly structured.

### For New Projects
1. Run `/init-echo-system` command
2. Provide project name and vision when prompted
3. Echo initializes complete structure
4. Begin creating and executing tasks

### For Existing Projects
1. Deploy templates to project root
2. Run initialization to analyze existing codebase
3. Import existing tasks into Echo registry
4. Begin development workflow

## Core Components

### Task Management
- **ECHO-TASK-REGISTRY.md**: Single source of truth for all tasks
- **Echo Task Templates**: Standardized task structure with mandatory acceptance criteria
- **Status Tracking**: Rigorous progress monitoring with validation gates
- **Dependency Management**: Automated dependency validation and fixing

### Memory Bank
- **Persistent Context**: Project knowledge that survives AI memory resets
- **Living Documentation**: Actively maintained project documentation
- **Component Structure**: Organized by system components and concerns
- **Progress Tracking**: Historical context and milestone documentation

### Cross-System Integration
- **Claude Code Integration**: Shared CLAUDE.md guidance file
- **Echo Prompt**: Comprehensive .roo system prompt
- **Unified Commands**: Consistent task management across both systems
- **Git Automation**: Automated commits, staging, and pushes

### Validation Gates
- **Gate 1**: Pre-work validation (dependencies, prerequisites)
- **Gate 2**: Mid-work validation (implementation progress)
- **Gate 3**: Completion validation (Definition of Done)

## System Architecture

```
project-root/
├── CLAUDE.md (Cross-system coordination)
├── memory-bank/
│   ├── activeContext.md
│   ├── productContext.md
│   ├── techContext.md
│   ├── systemPatterns.md
│   ├── testingContext.md
│   ├── progress.md
│   ├── components/
│   ├── cross-cutting/
│   └── task-completion-reports/
├── tasks/
│   ├── ECHO-TASK-REGISTRY.md
│   ├── ECHO-TASK-TEMPLATE.md
│   ├── ECHO-STATUS-TRACKING.md
│   └── ECHO-VALIDATION-GATES.md
├── .claude/
│   └── commands/
└── .roo/
    └── echo-prompt.md
```

## Task Management Workflow

### 5-State System
1. **BLOCKED**: Cannot proceed due to dependencies or external factors
2. **READY**: All dependencies met, comprehensive research completed
3. **IN_PROGRESS**: Work has begun, person assigned and actively working
4. **TESTING**: Implementation complete, validation and testing in progress
5. **DONE**: All acceptance criteria met, Definition of Done 100% complete

### Echo Task Workflow

1. **Research Phase**: Comprehensive technical analysis with specific file paths
2. **Pre-Work Validation**: Gate 1 - Prerequisites and dependency check
3. **Implementation**: Detailed phases with specific file modifications
4. **Testing**: 90%+ coverage with comprehensive test strategy
5. **Completion Validation**: Gate 3 - Definition of Done verification

## How to Use Echo

### 1. Define a High-Level Goal/Task
Provide a development goal (e.g., "Echo, we need to implement a user authentication feature with email/password and OAuth.")

### 2. Echo Creates/Populates the Task File
- Echo uses `tasks/ECHO-TASK-TEMPLATE.md` to create a new task file
- Populates it by asking clarifying questions for requirements
- Identifies relevant Memory Bank context files
- Generates detailed step-by-step implementation guide

### 3. Set Active Context
`memory-bank/activeContext.md` is updated to point to the new task file

### 4. Echo Executes the Task
- Proceeds with the detailed plan within the active task file
- For each step, might generate code snippets or prepare instructions
- Follows validation gates throughout execution

### 5. Test & Iterate
Follow testing requirements. Feedback is incorporated for refinements.

### 6. Update Documentation
Echo guides updates to `activeContext.md`, `progress.md`, and relevant Memory Bank files based on task completion.

## Key Features

### Research-First Development
- All tasks begin with comprehensive research phase
- Specific file paths and technical details verified before implementation
- Realistic effort estimates based on actual code analysis
- Eliminates guesswork and reduces implementation errors

### Quality Standards
- 90%+ test coverage requirement
- Comprehensive error handling patterns
- Production-ready documentation standards
- Cross-system coordination capabilities

### Memory Bank Integration
- Persistent project context across AI sessions
- Component-specific documentation maintained
- Progress tracking and milestone management
- Task completion reports for knowledge retention

### Definition of Done Framework
- Code implemented and tested
- All tests passing with required coverage
- Documentation updated
- Code reviewed and approved
- Validation gates passed

## Commands

### Core Commands
- `/init-echo-system` - Initialize Echo Task Management System
- `/update-memory-bank` - Update documentation with git automation
- `/create-task` - Create new task using Echo template
- `/update-task-status` - Update task status with validation

### Cross-System Commands
- Works seamlessly with Claude Code and Echo (.roo)
- Shared memory bank and task registry
- Coordinated status updates and progress tracking

## Benefits

- **Zero Ambiguity**: Research-backed tasks eliminate guesswork
- **Maximum Quality**: Validation gates prevent incomplete work
- **Production Ready**: Definition of Done ensures deployment readiness
- **Systematic Progress**: Registry provides single source of truth
- **Cross-System Compatibility**: Works with Claude Code and Echo (.roo)

---

**The Echo Task Management System: Precision development framework for maximum velocity and quality.**