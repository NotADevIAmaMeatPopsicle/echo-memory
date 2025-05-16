# Memory Bank Index

This file serves as the central index for the Memory Bank of the Echo Hierarchical Coding System.

## Core Context Files

-   **[`productContext.md`](productContext.md):** Defines the "Why," "Problems Solved," and "How it Should Work" for the project.
-   **[`techContext.md`](techContext.md):** Outlines the technology stack, setup, and key technical decisions.
-   **[`systemPatterns.md`](systemPatterns.md):** Documents recurring architectural and design patterns used in the system.
-   **[`testingContext.md`](testingContext.md):** Describes the testing strategy, frameworks, and coverage targets.
-   **[`activeContext.md`](activeContext.md):** A dynamic file tracking the current focus, ongoing work, and immediate context for Echo.
-   **[`progress.md`](progress.md):** Logs significant milestones, completed tasks, and overall project progress.

## Detailed Documentation Subdirectories

This section outlines the purpose of the specialized subdirectories within the Memory Bank. Each subdirectory typically contains its own `index.md` or a set of markdown files detailing its specific domain.

-   **[`reference/`](reference/index.md):** Stores highly detailed, granular reference materials. This includes things like complete database schemas, exhaustive API specifications, or detailed configuration guides for specific tools. Echo consults these files *only when explicitly directed by a task file or a link in a higher-level document*.
-   **[`components/`](components/index.md):** Contains documentation for individual, reusable software components developed for or used by the project. Each component should have its own markdown file or sub-folder.
-   **[`system/`](system/index.md):** Focuses on broader system-level concerns, architecture, and major functional modules. This might include data models (overview level), system architecture diagrams, or documentation for core services.
-   **[`cross-cutting/`](cross-cutting/index.md):** Addresses concerns that span multiple modules or components, such as logging strategies, security policies, error handling guidelines, or coding standards.
-   **[`progress/`](progress/index.md):** (Optional/To be developed) May contain more detailed or periodic progress reports, sprint summaries, or specific deep dives into task progress beyond the main `progress.md`.

*(This structure helps organize detailed information, allowing Echo and developers to access specific context efficiently.)*

## How to Use

-   **Echo (AI Planner):** Always consult this index and [`activeContext.md`](activeContext.md) first. Navigate to relevant files based on the current task.
-   **Developers:** Use this index to quickly find relevant project documentation. Keep it updated when adding new core context files or major module documentation.