# Echo Hierarchical Coding System

## Vision
To create a highly structured, AI-driven software development system that leverages a persistent "Memory Bank" and detailed "Task Files" to enable an AI "Planner" (Echo) to generate high-quality, context-aware implementation plans, which are then executed by specialized "Executor" AIs. The goals are to enhance code quality, maintain consistency, improve development efficiency, and manage costs effectively.

## Core Philosophy
This system is built on the principles of:
- **Context Persistence:** Overcoming LLM context limitations through a structured, external Memory Bank.
- **Detailed Planning:** Breaking down complex tasks into granular, actionable steps before execution.
- **Intelligent Delegation:** Using capable LLMs for planning and reasoning, and potentially more cost-effective LLMs for precise execution.
- **Documentation-First:** The system's reliance on the Memory Bank enforces good documentation practices.
- **Test-Driven Development:** Incorporating TDD principles into the task and execution flow.
- **Continuous Improvement:** Iteratively refining prompts, task templates, and Memory Bank structures based on operational experience.

## Core Components
1.  **Echo (Planner/Architect AI Persona):** The central intelligence, responsible for understanding tasks, consulting the Memory Bank, and generating detailed implementation plans. (Powered by a high-capability LLM like Gemini 1.5 Pro).
2.  **Memory Bank (`memory-bank/`):** A structured directory of markdown files holding all project-specific knowledge. This is Echo's persistent memory. Key contents include:
        *   **`index.md`**: The main index for all Memory Bank documents.
        *   **Core Context Files**: `productContext.md`, `techContext.md`, `systemPatterns.md`, `testingContext.md`, `activeContext.md` (tracking current focus), and `progress.md` (logging milestones).
        *   **`reference/`**: Subdirectory for detailed, granular reference materials (e.g., full database schemas, detailed API specifications) to be consulted on demand by Echo as per task instructions or links in higher-level documents.
        *   **`components/`**: Documentation for individual, reusable software components.
        *   **`system/`**: Documentation for broader system-level concerns or modules.
        *   **`cross-cutting/`**: Documentation for concerns that span multiple modules (e.g., logging, security).
        *   *(Other specialized directories may be added as needed).*
3.  **Task System (`tasks/`):** A directory of markdown files where each file defines a specific development task using a standardized template (`tasks/TEMPLATE.md`). These files provide granular instructions and context for Echo.
4.  **Executor Agent(s):** AI agent(s) responsible for taking a single, specific instruction from Echo's plan and generating the required code or performing the action. (Can be powered by models like Gemini 1.5 Flash, Claude Haiku, or potentially interface with tools like GitHub Copilot).
5.  **Orchestration Layer:** The mechanism that manages the workflow between the Planner and Executor(s). This can be:
    *   A "Custom Instructions" setup for manual interaction with an LLM acting as Echo.
    *   A scripted workflow (e.g., Python).
    *   A multi-agent framework like CrewAI (see `tasks/CREW-001-...md`).
    *   (Future) A VS Code plugin.

## High-Level Workflow
1.  **Task Initiation:** A user defines or selects a high-level development task, ensuring a corresponding detailed task file exists in `tasks/`.
2.  **Contextualization & Planning (Echo):**
    *   Echo is activated with the specific task file.
    *   Echo consults `memory-bank/activeContext.md` and all relevant files from the `memory-bank/` and the task file itself.
    *   Echo generates a detailed, step-by-step implementation plan.
3.  **Execution (Orchestrator + Executor):**
    *   The Orchestration Layer takes Echo's plan.
    *   Each step of the plan is sequentially (or potentially in parallel, in advanced versions) passed as a precise instruction to an Executor Agent.
    *   The Executor Agent generates the code or performs the file modification.
4.  **Testing & Verification (Iterative):**
    *   Code is tested according to `testingContext.md` and the specific task's testing requirements (often TDD: tests first).
    *   Feedback can be provided to Echo or the Executor for refinement.
5.  **Documentation Update (Echo/User):**
    *   `activeContext.md`, `progress.md`, and other relevant Memory Bank files are updated to reflect the changes and task completion.
    *   The task file itself might be updated with new learnings or pitfalls.

## Getting Started (Developing this System)
-   Familiarize yourself with the "Echo" persona by reviewing [`prompts/echo_system_prompt.md`](../prompts/echo_system_prompt.md).
-   Understand the `memory-bank/` structure (see Core Components section and [`memory-bank/index.md`](../memory-bank/index.md)) and the `tasks/TEMPLATE.md`.
-   For automated orchestration, review the CrewAI POC plan in `tasks/CREW-001-...md`.
-   Set up required LLM API keys and Python environment if working on the CrewAI or scripted versions.

## Future Directions & Research
-   Advanced Retrieval Augmented Generation (RAG) for querying the Memory Bank.
-   VS Code plugin for seamless IDE integration.
-   More sophisticated Executor agents with specialized tools (e.g., direct Git operations, test execution frameworks).
-   Self-correction and learning capabilities for the agents.
-   Integration with project management tools.

---
This system represents an ongoing research effort into building robust, context-aware, and efficient AI-assisted software development workflows.