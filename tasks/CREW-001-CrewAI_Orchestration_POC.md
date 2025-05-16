# Task [CREW-001]: Develop CrewAI Orchestration for Hierarchical AI Coding System (Echo Architecture)

## 🎯 Task Description
The goal of this task is to implement a proof-of-concept (POC) system using the CrewAI framework to orchestrate the "Echo Hierarchical Coding System." This involves creating a "Planner Agent" (emulating Echo) that consults a simplified Memory Bank and a Task File to generate a detailed implementation plan, and an "Executor Agent" that takes steps from this plan to generate or modify code.

## ⚙️ Prerequisites
-   Python 3.9+ installed.
-   CrewAI and CrewAI_Tools libraries installed (`pip install crewai crewai-tools`).
-   Access to LLM APIs (e.g., Google Gemini via API key, OpenAI API key) and relevant Python client libraries.
-   Understanding of the "Echo Hierarchical Coding System" architecture (Echo persona, Memory Bank structure, Task File structure, Planner-Executor model) by reviewing:
    -   [`memory-bank/productContext.md`](../memory-bank/productContext.md)
    -   [`memory-bank/techContext.md`](../memory-bank/techContext.md)
    -   [`memory-bank/systemPatterns.md`](../memory-bank/systemPatterns.md)
-   Familiarity with basic file system operations in Python.
-   A sample `memory-bank/` directory and a sample `tasks/sample_feature.md` file for testing (these will be created as part of this task's setup or a sub-task).
-   Core Memory Bank files created (e.g., `productContext.md`, `techContext.md`).
-   This task file (`CREW-001-...md`) and `tasks/TEMPLATE.md` exist.

## 📋 Detailed Requirements
1.  **Planner Agent (Echo Persona):**
    *   Define a CrewAI Agent with a role, goal, and backstory emulating the "Echo" persona (details in `prompts/echo_system_prompt.md` - to be created).
    *   This agent must use a high-capability LLM (e.g., Gemini 1.5 Pro, GPT-4).
    *   Its primary goal is to generate a step-by-step coding plan based on a given task file and relevant Memory Bank context.
2.  **Executor Agent:**
    *   Define a CrewAI Agent with a role, goal, and backstory of a diligent code implementer.
    *   This agent should use a cost-effective, capable LLM (e.g., Gemini 1.5 Flash, GPT-3.5-turbo).
    *   Its goal is to execute a single, specific coding instruction from the Planner's plan, outputting only raw code or file content.
3.  **Custom Tools (`echo_crew_ai_poc/tools.py`):**
    *   `MemoryBankReaderTool`: A CrewAI tool that can read content from specified files within the `memory-bank/` directory (e.g., `read_file(file_path)` relative to `memory-bank/`).
    *   `TaskFileReaderTool`: A CrewAI tool to read the content of a specific task markdown file from the `tasks/` directory (e.g., `read_file(file_path)` relative to `tasks/`).
    *   `CodeWriterTool`: A CrewAI tool that can write/overwrite content to a specified file path within an `output/` directory. Input should be flexible (e.g., dict `{'file_path': 'path', 'code': 'content'}`).
    *   `FileReadTool` (from `crewai_tools` or custom if needed): To read existing code files from `output/` for context if needed by the Executor.
4.  **CrewAI Tasks (`echo_crew_ai_poc/crew_tasks.py` - or defined in `main.py`):**
    *   **Planning Task:** Assigned to the Planner Agent.
        *   Input: Path to a high-level task markdown file (e.g., `tasks/sample_task.md`) and a list of relevant Memory Bank files.
        *   Output: A structured, step-by-step implementation plan (e.g., a list of strings, each string a micro-task for the Executor).
    *   **Execution Tasks:** Dynamically created based on the Planner's output plan.
        *   Input: A single micro-task instruction string from the Planner's plan, and optionally, context from existing files in `output/`.
        *   Agent: Executor Agent.
        *   Output: Path to the modified/created file or the code snippet itself. The `CodeWriterTool` handles actual file writing.
5.  **Crew Definition & Orchestration Script (`echo_crew_ai_poc/main.py`):**
    *   Define a Crew comprising the Planner and Executor agents (or manage them sequentially).
    *   The script should:
        *   Take a path to a high-level task file (e.g., `tasks/sample_task.md`) as a command-line argument.
        *   Load necessary API keys from `.env`.
        *   Instantiate LLMs, tools, and agents.
        *   Run the Planning Task to get the implementation plan.
        *   Parse the plan into micro-tasks.
        *   For each micro-task:
            *   Create and run an Execution Task.
            *   Collect and display/save the results (e.g., path to file written by `CodeWriterTool`).
6.  **Configuration:**
    *   Manage API keys securely via a `.env` file and `python-dotenv`.
    *   LLM configurations (model names, temperature) should be easily adjustable.
7.  **Sample Files for Testing:**
    *   Create `tasks/sample_task.md`: A very simple task, e.g., "Create a Python script in `output/` named `hello.py` that prints 'Hello, Echo!'".
    *   Create minimal sample Memory Bank files if not already sufficient (e.g., `memory-bank/sample_product.md`, `memory-bank/sample_tech.md`) to be consulted by the `sample_task.md`.

## 🧠 Context from Memory Bank
-   **[`productContext.md`](../memory-bank/productContext.md):** Understand the overall vision and goals.
-   **[`techContext.md`](../memory-bank/techContext.md):** Adhere to Python, CrewAI, and specified LLM usage. Note file structure.
-   **[`systemPatterns.md`](../memory-bank/systemPatterns.md):** Implement the "Planner-Executor Delegation" and "Memory-Augmented Context" patterns.
-   **[`testingContext.md`](../memory-bank/testingContext.md):** Be mindful of testing requirements for tools and agent interactions.
-   **[`prompts/echo_system_prompt.md`](../prompts/echo_system_prompt.md):** (To be created) This will define the Planner Agent's core persona.

## 🛠️ Step-by-Step Implementation Guide / Plan

### A. Environment Verification & Setup (Perform these first!)
1.  Create project directory: `echo_crew_ai_poc` (if not using root for Python files).
2.  Set up Python virtual environment: `python -m venv venv` and activate it.
3.  Install dependencies: `pip install crewai crewai-tools python-dotenv langchain-google-genai` (or `langchain-openai` / other as per LLM choice). Add these to a `requirements.txt` file.
4.  Create `.env` file (e.g., from `.env.example` if one is created) and add `GOOGLE_API_KEY="YOUR_KEY"` (or other LLM keys).
5.  Create `output/` directory.
6.  Create `prompts/` directory.
7.  Create `memory-bank/sample_product.md` with content: "This is a sample product context for testing."
8.  Create `memory-bank/sample_tech.md` with content: "Use Python 3 for all scripts."
9.  Create `tasks/sample_task.md` with content:
    ```markdown
    # Task [SAMPLE-001]: Create Hello Echo Script
    ## 🎯 Task Description
    Create a Python script that prints "Hello, Echo!" to the console.
    ## 🧠 Context from Memory Bank
    - [`memory-bank/sample_product.md`](../memory-bank/sample_product.md)
    - [`memory-bank/sample_tech.md`](../memory-bank/sample_tech.md)
    ## 🛠️ Step-by-Step Implementation Guide / Plan
    1. Create a file named `hello.py` in the `output/` directory.
    2. The file should contain Python code to print the string "Hello, Echo!".
    ## ✅ Completion Criteria
    - `output/hello.py` exists and prints "Hello, Echo!" when run.
    ```

### B. Core Implementation / Debugging Steps

1.  **Define Prompts (`prompts/echo_system_prompt.md` and `prompts/executor_prompt.md` - or inline in `agents.py`):**
    *   **`prompts/echo_system_prompt.md` (Planner - Echo):**
        ```markdown
        You are Echo, an expert AI Software Architect. Your memory is volatile, so you RELY COMPLETELY on the provided Memory Bank context and the specific Task File content.
        Your goal is to take a high-level task description (and its associated Memory Bank context) and generate a detailed, numbered, step-by-step implementation plan.
        Each step in your plan must be a single, granular, actionable instruction for an Executor AI to implement.
        Instructions might include creating a file with specific content, or writing a specific function.
        Ensure your plan explicitly states when and how to use the CodeWriterTool (e.g., "Use CodeWriterTool to write the following Python code to 'output/filename.py':\n```python\n# code\n```").
        Consult the Memory Bank context ({memory_bank_files_context}) and the Task File content ({task_file_context}) thoroughly.

        High-level task from Task File: {task_description}

        Generate the implementation plan as a numbered list:
        ```
    *   **`prompts/executor_prompt.md` (Executor):**
        ```markdown
        You are a diligent and precise code generation AI.
        Your ONLY task is to implement the following single instruction EXACTLY as described.
        Do NOT add any explanations, apologies, or conversational fluff.
        Output ONLY the raw code or file content if the instruction is to generate content for a file.
        If the instruction involves using a tool like CodeWriterTool, your output should be the arguments for that tool, typically the code content.
        If the instruction is "Use CodeWriterTool to write the following Python code to 'output/filename.py':\n```python\n# code\n```", you should output:\n```python\n# code\n```

        Instruction: {micro_task_instruction}
        Relevant existing code context (if any): {existing_code_context}

        Implement the instruction:
        ```

2.  **Implement Custom Tools (`echo_crew_ai_poc/tools.py`):**
    *   `MemoryBankReaderTool(BaseTool)`:
        ```python
        from crewai_tools import BaseTool
        import os
        class MemoryBankReaderTool(BaseTool):
            name: str = "MemoryBankReaderTool"
            description: str = "Reads a specific file from the project's Memory Bank. Input must be the relative path within the memory-bank directory (e.g., 'productContext.md')."
            def _run(self, file_path: str) -> str:
                base_path = "memory-bank/" 
                full_path = os.path.join(base_path, file_path)
                try:
                    with open(full_path, 'r', encoding='utf-8') as f:
                        return f.read()
                except FileNotFoundError:
                    return f"Error: File not found at {full_path}"
                except Exception as e:
                    return f"Error reading file {full_path}: {str(e)}"
        ```
    *   `TaskFileReaderTool(BaseTool)` (similar, reads from `tasks/`).
    *   `CodeWriterTool(BaseTool)`:
        ```python
        import os
        from crewai_tools import BaseTool
        class CodeWriterTool(BaseTool):
            name: str = "CodeWriterTool"
            description: str = "Writes or overwrites content to a specified file path within the 'output/' directory. Input is a dictionary {'file_path': 'relative/path/to/file.py', 'code': 'your python code'}. The 'file_path' is relative to the 'output/' directory."
            def _run(self, file_path: str, code: str) -> str: # Allow direct args for easier agent use
                if not file_path or code is None:
                    return "Error: 'file_path' and 'code' are required."
                
                output_base_path = "output/"
                full_path = os.path.join(output_base_path, file_path)
                try:
                    os.makedirs(os.path.dirname(full_path), exist_ok=True) # Ensure directory exists
                    with open(full_path, 'w', encoding='utf-8') as f:
                        f.write(code)
                    return f"Successfully wrote code to {full_path}"
                except Exception as e:
                    return f"Error writing file {full_path}: {str(e)}"
        ```
    *   Instantiate `FileReadTool` from `crewai_tools` if needed for Executor context.

3.  **Define Agents (`echo_crew_ai_poc/agents.py`):**
    *   Import LLM clients (e.g., `ChatGoogleGenerativeAI`).
    *   Load prompts.
    *   Instantiate tools.
    *   Create `planner_agent`:
        ```python
        # In agents.py
        from crewai import Agent
        # from langchain_google_genai import ChatGoogleGenerativeAI # or your preferred LLM
        # from .tools import MemoryBankReaderTool, TaskFileReaderTool # Assuming tools.py is in the same dir
        # llm_planner = ChatGoogleGenerativeAI(model="gemini-1.5-pro-latest", temperature=0.3) 
        # planner_agent = Agent(
        #     role="AI Software Architect and Planner (Echo)",
        #     goal="Create a detailed, step-by-step implementation plan based on Memory Bank and Task File context, formatted as a numbered list.",
        #     backstory="An expert AI architect that meticulously plans software development by breaking features into granular steps, heavily relying on documented context due to its volatile memory. Adheres strictly to the provided system prompt.",
        #     llm=llm_planner,
        #     tools=[memory_bank_reader_tool, task_file_reader_tool], # Tools for reading context
        #     verbose=True,
        #     allow_delegation=False
        # )
        ```
    *   Create `executor_agent`:
        ```python
        # llm_executor = ChatGoogleGenerativeAI(model="gemini-1.5-flash-latest", temperature=0.0) # Low temp for precision
        # executor_agent = Agent(
        #     role="Diligent Code Implementer",
        #     goal="Execute a single, specific coding instruction precisely as described, outputting only raw code or content.",
        #     backstory="A precise AI coder that takes a single, well-defined instruction and implements it without deviation or added commentary. Adheres strictly to its system prompt.",
        #     llm=llm_executor,
        #     tools=[code_writer_tool, file_read_tool], # Tool for writing code, tool for reading existing code
        #     verbose=True,
        #     allow_delegation=False
        # )
        ```

4.  **Orchestration Script (`echo_crew_ai_poc/main.py`):**
    *   Import necessary modules (`os`, `argparse`, `dotenv`, `crewai`, agents, tools, LLMs).
    *   `load_dotenv()`.
    *   Define LLM instances, tool instances, agent instances.
    *   Implement `get_plan(task_file_path_input, memory_files_to_consult_input)` function:
        *   Uses `TaskFileReaderTool` to read `task_file_path_input`.
        *   Uses `MemoryBankReaderTool` to read each file in `memory_files_to_consult_input`, concatenating content.
        *   Loads planner prompt.
        *   Creates `PlanningTask` for `planner_agent` with formatted description including task content and memory context.
            ```python
            # planning_task = Task(
            #     description=planner_prompt_template.format(
            #         memory_bank_files_context=memory_context_string,
            #         task_file_context=task_content_string,
            #         task_description=task_content_string # Or a specific part of it
            #     ),
            #     expected_output="A numbered list of granular, actionable coding steps. Each step should be on a new line.",
            #     agent=planner_agent
            # )
            ```
        *   Runs a temporary `Crew` with `[planner_agent]` and `[planning_task]` to get the plan string.
        *   Returns the plan string.
    *   Implement `execute_step(instruction_step, existing_code_context_str)` function:
        *   Loads executor prompt.
        *   Creates `ExecutionTask` for `executor_agent`.
            ```python
            # execution_task = Task(
            #     description=executor_prompt_template.format(
            #         micro_task_instruction=instruction_step,
            #         existing_code_context=existing_code_context_str
            #     ),
            #     expected_output="The raw code or content to be written to a file, or confirmation of action.",
            #     agent=executor_agent,
            #     # IMPORTANT: Pass the CodeWriterTool to the task if the agent is expected to use it directly
            #     # tools=[code_writer_tool] # Or ensure the agent has it and the prompt guides its use
            # )
            ```
        *   Runs a temporary `Crew` with `[executor_agent]` and `[execution_task]`.
        *   The `executor_agent`'s prompt should guide it to use `CodeWriterTool`. The tool itself performs the write. The task output might be the code content, and a separate step in `main.py` calls `code_writer_tool._run()`. Or, the agent is trusted to call it. For simplicity, having the agent output the code and `main.py` call `CodeWriterTool` might be more robust initially.
        *   If the plan step explicitly says "Use CodeWriterTool to write ... to 'path/file.py'", `main.py` needs to parse `path/file.py` and the code block from the executor's output, then call `code_writer_tool._run(file_path=parsed_path, code=parsed_code)`.
    *   Main script logic:
        *   Argument parser for `task_file_path`.
        *   Call `get_plan()`.
        *   Parse plan string into a list of instructions.
        *   Loop through instructions:
            *   (Optional) Use `FileReadTool` if an instruction implies needing existing code context from `output/`.
            *   Call `execute_step()`. If the step was a `CodeWriterTool` instruction, parse the output from the executor (which should be the code block) and the target file path from the plan step. Then call `code_writer_tool._run(file_path=target_file, code=executor_output)`.
            *   Print/log results.

### C. Final Verification & Cleanup
1.  Test with `tasks/sample_task.md`.
2.  Verify `output/hello.py` is created and correct.
3.  Review logs for agent interactions.

## 🧪 Testing Requirements
1.  **Unit Tests (in `echo_crew_ai_poc/tests/test_tools.py`):**
    *   For `MemoryBankReaderTool`: Test reading existing file, non-existing file.
    *   For `TaskFileReaderTool`: Test reading existing file, non-existing file.
    *   For `CodeWriterTool`: Test writing new file, overwriting file, invalid path.
2.  **Integration Test (in `echo_crew_ai_poc/tests/test_main_flow.py`):**
    *   Run `main.py` with `tasks/sample_task.md`.
    *   Assert that `output/hello.py` is created and its content is "print('Hello, Echo!')".
    *   Clean up `output/hello.py` after test.
3.  **Prompt Review:**
    *   Review Planner prompt for clarity in generating parsable, actionable plans.
    *   Review Executor prompt for precision in outputting only code/content.

## ⚠️ Common Pitfalls / Troubleshooting
-   **API Key Issues:** Ensure `.env` is correctly set up and `load_dotenv()` is called.
-   **Tool Errors:** Test tools independently. Ensure tool descriptions are clear for agents if they are to choose tools (less relevant here as we guide tool use).
-   **LLM Output Parsing:** Planner's plan needs to be reliably parsable (numbered list). Executor's output (code) needs to be cleanly extracted if `main.py` is calling `CodeWriterTool`.
-   **Context Length:** For the POC with small sample files, direct injection is fine.
-   **Executor Precision:** The Executor LLM might add fluff. Iteratively refine its prompt.
-   **File Path Management:** Consistent use of relative paths (e.g., `output/`, `memory-bank/`, `tasks/` as base for tools).
-   **Agent Tool Usage:** Decide if the agent's *task* uses the tool (tool passed to `Task(tools=[...])`) or if the agent *itself* is equipped with the tool and its prompt guides it. For `CodeWriterTool`, if the Executor's job is "produce code for this instruction", its output is the code. `main.py` then uses `CodeWriterTool`. If the Executor's job is "write this code to a file", it needs `CodeWriterTool` and its prompt must make it use it correctly. The provided prompts lean towards the Executor outputting code content, and `main.py` handling the write via `CodeWriterTool` after parsing the plan.

## ✅ Completion Criteria
-   The `echo_crew_ai_poc/main.py` script can be executed with `python echo_crew_ai_poc/main.py tasks/sample_task.md`.
-   The Planner Agent generates a plan for `sample_task.md`.
-   The Executor Agent processes the plan steps.
-   `output/hello.py` is created with `print('Hello, Echo!')`.
-   Unit tests for tools pass.
-   Integration test for the main flow with `sample_task.md` passes.
-   Basic logging shows the flow.

## 边界 (Boundaries)
### In Scope
-   Basic Planner and Executor agent definitions and sequential interaction via `main.py`.
-   Implementation of the three core custom tools.
-   Execution of the `sample_task.md`.
-   Unit tests for tools and one integration test for the flow.

### Out of Scope
-   Advanced RAG for Memory Bank.
-   Direct test execution by agents.
-   Complex error handling, retry logic in `main.py`.
-   GUI / VS Code plugin integration.
-   Parallel execution of plan steps.
-   Self-correction loops for agents.
-   Agents choosing tools autonomously (tool use is guided by plan/script).

## 🕰️ Estimated Effort
-   Complexity: High (due to multiple interacting parts and AI agent behavior)

## 🔗 Related Tasks/Documents
-   Parent Task: Project Initialization
-   Depends on: Core Memory Bank files, `tasks/TEMPLATE.md`, `prompts/` directory structure.
-   Relevant Docs: All Memory Bank files, especially `techContext.md`.