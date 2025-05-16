# Testing Context: Echo Hierarchical Coding System

## 1. Testing Philosophy

The Echo Hierarchical Coding System emphasizes a robust testing strategy to ensure code quality, reliability, and maintainability. We will adhere to principles of Test-Driven Development (TDD) where practical, especially for new features and critical components.

Testing is not just a phase but an integral part of the development workflow, involving both AI agents and human oversight.

## 2. Types of Tests

The following types of tests will be implemented:

1.  **Unit Tests:**
    *   **Focus:** Test individual functions, methods, or small, isolated units of code (e.g., custom tools for CrewAI, specific helper functions).
    *   **Framework:** `pytest` (preferred) or `unittest` for Python code.
    *   **Responsibility:** Primarily written by developers, potentially assisted by Executor AIs under guidance. Task Files should specify unit test requirements for new code.
    *   **Goal:** Ensure each unit performs its specific function correctly.

2.  **Integration Tests:**
    *   **Focus:** Test the interaction between different components or modules of the system (e.g., the interaction between Planner Agent, Executor Agent, and custom tools; the flow of data through the `main.py` orchestration script).
    *   **Framework:** `pytest`.
    *   **Responsibility:** Written by developers, focusing on key integration points.
    *   **Goal:** Verify that components work together as expected. The CrewAI POC (Task [`CREW-001`](../tasks/CREW-001-CrewAI_Orchestration_POC.md)) will require integration tests to verify the end-to-end flow with sample tasks.

3.  **Tool Tests (Specific to Custom AI Tools):**
    *   **Focus:** Each custom tool developed for AI agents (e.g., `MemoryBankReaderTool`, `CodeWriterTool`) must be thoroughly tested independently.
    *   **Framework:** `pytest`.
    *   **Responsibility:** Developers creating or modifying tools.
    *   **Goal:** Ensure tools are reliable, handle inputs correctly (including edge cases and error conditions), and produce the expected outputs.

4.  **Prompt Engineering & Agent Behavior Tests (Qualitative):**
    *   **Focus:** Evaluate the effectiveness of prompts for Planner and Executor agents. Assess whether agents adhere to their defined roles, goals, and constraints.
    *   **Methodology:** Iterative refinement based on observed outputs. Standardized test scenarios (simple Task Files) will be used to evaluate agent responses to different inputs and contexts.
    *   **Responsibility:** Developers and AI interaction designers.
    *   **Goal:** Ensure agents behave as intended and produce high-quality, relevant outputs (plans, code).

5.  **End-to-End (E2E) Scenario Tests (Future):**
    *   **Focus:** Test the entire system workflow from defining a high-level task to generating and verifying the final code output, using more complex and realistic Task Files.
    *   **Methodology:** To be defined; may involve simulated user interactions or automated scripts.
    *   **Responsibility:** Developers.
    *   **Goal:** Validate that the entire system meets its objectives and handles realistic development scenarios.

## 3. Testing Workflow & Automation

-   **Test Location:** Tests will typically reside in a `tests/` directory at the root of the project or within specific module directories (e.g., `echo_crew_ai_poc/tests/`).
-   **Test Execution:**
    -   Tests should be runnable via `pytest` from the command line.
    -   (Future) Integration with CI/CD pipelines for automated testing on commits/pull requests.
-   **Test-Driven Development (TDD):**
    -   For new features or significant refactoring, tests (especially unit and integration) should ideally be written *before* the implementation code.
    -   The Planner Agent (Echo) can be instructed to include test case generation as part of its implementation plan for a given task.
    -   Executor Agents can be tasked with generating code to pass these predefined tests.

## 4. Code Coverage

-   **Target:** Aim for a high level of code coverage (e.g., 80%+) for unit and integration tests, particularly for critical system components.
-   **Tool:** `coverage.py` (used with `pytest-cov`).
-   **Monitoring:** Coverage reports will be generated and reviewed periodically.

## 5. Task File Testing Requirements

Each Task File (`tasks/*.md`) should include a "🧪 Testing Requirements" section that specifies:
-   What needs to be tested for the feature/bugfix described in the task.
-   Specific unit tests, integration tests, or scenarios to consider.
-   Any data or setup required for testing.

Echo (Planner Agent) must consult this section when generating implementation plans and may add to it if further test considerations are identified.

## 6. Initial Focus for CrewAI POC (Task [`CREW-001`](../tasks/CREW-001-CrewAI_Orchestration_POC.md))

-   Unit tests for each custom tool (`MemoryBankReaderTool`, `TaskFileReaderTool`, `CodeWriterTool`).
-   An integration test for `main.py` using a simple `sample_task.md` that requires creating 1-2 files with simple content. This test should verify the output files.
-   Qualitative review of Planner and Executor prompts for clarity and effectiveness.