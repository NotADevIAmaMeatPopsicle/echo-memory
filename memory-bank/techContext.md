# Technical Context: Echo Hierarchical Coding System

## 1. Primary Technology Stack

-   **Programming Language:** Python (Version 3.9+)
-   **AI Orchestration Framework:** CrewAI
    -   `crewai`
    -   `crewai_tools`
-   **LLM Interaction Libraries:**
    -   `langchain-google-genai` (for Google Gemini models)
    -   `langchain-openai` (or other relevant langchain integrations for different LLMs)
-   **Environment Management:**
    -   Python Virtual Environments (`venv`)
    -   `python-dotenv` for managing API keys and environment variables.
-   **Version Control:** Git

## 2. LLM Choices (Initial & Potential)

-   **Planner Agent (Echo Persona):** High-capability models.
    -   Initial: Google Gemini 1.5 Pro (or similar, e.g., GPT-4)
-   **Executor Agent(s):** Cost-effective, capable models for code generation.
    -   Initial: Google Gemini 1.5 Flash (or similar, e.g., GPT-3.5-Turbo, Claude Haiku)
-   **Flexibility:** The system is designed to be model-agnostic where possible, allowing for swapping LLMs based on task requirements, cost, and performance.

## 3. Core System Implementation (Proof of Concept - CrewAI)

The initial implementation focuses on a Proof of Concept (POC) using CrewAI as the orchestration layer. See Task File [`CREW-001`](../tasks/CREW-001-CrewAI_Orchestration_POC.md) (Note: This file will be created later) for detailed implementation.

Key aspects:
-   **Planner Agent:** Defined in CrewAI, leveraging a high-capability LLM. Its role is to interpret Task Files and Memory Bank context to produce detailed, step-by-step coding plans.
-   **Executor Agent:** Defined in CrewAI, leveraging a cost-effective LLM. Its role is to take a single instruction from the Planner's plan and generate the corresponding code or file modification.
-   **Custom Tools:**
    -   `MemoryBankReaderTool`: To read specific files from the `memory-bank/` directory.
    -   `TaskFileReaderTool`: To read specific task markdown files from the `tasks/` directory.
    -   `CodeWriterTool`: To write or overwrite code to specified file paths (typically in an `output/` directory).
    -   `FileReadTool` (from `crewai_tools` or custom): To read existing code files for context.
-   **Orchestration Script (`main.py`):** A Python script that:
    1.  Initializes agents and tools.
    2.  Takes a Task File path as input.
    3.  Invokes the Planner Agent to generate an implementation plan.
    4.  Parses the plan into micro-tasks.
    5.  Iteratively invokes the Executor Agent for each micro-task.
    6.  Manages outputs and results.

## 4. File System Structure (Key Directories)

-   **`memory-bank/`**: Stores all persistent project documentation. Key subdirectories include:
    -   `index.md`: Main index for the Memory Bank.
    -   Core context files like `productContext.md`, `techContext.md`, etc.
    -   `reference/`: Detailed, granular reference materials.
    -   `components/`: Documentation for reusable software components.
    -   `system/`: Broader system-level concerns and architecture.
    -   `cross-cutting/`: Concerns spanning multiple modules (logging, security, etc.).
    -   `progress/`: Detailed or periodic progress reports.
-   **`tasks/`**: Contains detailed markdown files for specific development tasks.
    -   `tasks/TEMPLATE.md`: The standard template for all new task files.
-   **`prompts/`**: Stores system prompts for AI agents, like `echo_system_prompt.md`.
-   **`echo_crew_ai_poc/` (or `src/`)**: Houses the source code for the CrewAI POC and future system implementations.
    -   `echo_crew_ai_poc/tools.py`: Custom CrewAI tools.
    -   `echo_crew_ai_poc/agents.py`: Agent definitions.
    -   `echo_crew_ai_poc/crew_tasks.py`: CrewAI task definitions.
    -   `echo_crew_ai_poc/main.py`: Main orchestration script.
-   **`output/`**: Default directory where Executor agents write generated code. This directory is typically not committed to version control.
-   **`.env`**: Stores API keys and sensitive configuration (not committed to version control).
-   **`.gitignore`**: Specifies intentionally untracked files for Git.
-   **`README.md`**: Main project README.
-   **`README_SYSTEM_OVERVIEW.md`**: Detailed system overview.
-   **[`requirements.txt`](../requirements.txt):** Lists Python project dependencies.

## 5. Setup and Environment

1.  **Clone Repository:** `git clone <repository_url>`
2.  **Navigate to Project Directory:** `cd echo-memory` (or the chosen project name)
3.  **Create Virtual Environment:** `python -m venv venv`
4.  **Activate Virtual Environment:**
    -   Windows: `venv\\Scripts\\activate`
    -   macOS/Linux: `source venv/bin/activate`
5.  **Install Dependencies:** `pip install -r requirements.txt` (A `requirements.txt` file will be created, listing `crewai`, `crewai-tools`, `python-dotenv`, `langchain-google-genai`, etc.)
6.  **Create `.env` file:** Copy `.env.example` (if provided) to `.env` or create it manually.
7.  **Add API Keys to `.env`:**
    ```
    GOOGLE_API_KEY="YOUR_GOOGLE_API_KEY"
    # OPENAI_API_KEY="YOUR_OPENAI_API_KEY" # If using OpenAI models
    # Other necessary keys
    ```
8.  **Verify Setup:** (Specific verification steps will be defined, e.g., running a simple test script).

## 6. Future Technical Considerations

-   **Advanced RAG:** For larger Memory Banks, implementing Retrieval Augmented Generation (chunking, embedding, vector search) will be crucial for efficient context retrieval.
-   **VS Code Plugin:** For tighter IDE integration.
-   **Alternative Orchestration:** Exploring other multi-agent frameworks or custom solutions beyond CrewAI.
-   **Scalability and Parallelism:** Enabling parallel execution of independent plan steps.