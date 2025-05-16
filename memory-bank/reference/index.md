# Reference Material Index

This directory stores highly detailed, granular reference materials for the Echo Hierarchical Coding System. These documents are typically consulted by Echo only when explicitly directed by a task file or a link within a higher-level Memory Bank document (like those in `memory-bank/system/` or `memory-bank/components/`).

## Purpose

The `reference/` directory is intended to hold information that is:
-   Too detailed for general overview documents.
-   Likely to be updated independently of higher-level design.
-   Essential for precise implementation of specific components or features.

## Examples of Content

-   **Database Schemas:**
    -   `database-schema/tables/[table_name].md` (detailed column definitions, constraints, indexes)
    -   `database-schema/relationships.md` (ERDs or descriptions of table relationships)
-   **API Specifications:**
    -   `api-specs/external/[api_name].md` (OpenAPI/Swagger specs or detailed descriptions of external APIs)
    -   `api-specs/internal/[service_name].md` (Specifications for internal microservices)
-   **Configuration Guides:**
    -   `config/tool_xyz_config.md` (Detailed setup and configuration for specific development tools or services)
-   **Data Dictionaries:**
    -   `data-dictionary/main_entities.md` (Exhaustive list of data fields, types, and descriptions)
-   **Low-Level Design Documents:**
    -   For particularly complex algorithms or modules, a detailed low-level design might reside here.

## How to Use

-   **Linking:** Higher-level documents in `memory-bank/system/` or `memory-bank/components/` should link to specific files here when more detail is required. For example, a system architecture document might mention a database and link to the detailed schema in `reference/database-schema/`.
-   **Task Files:** Task files in `tasks/` may instruct Echo to consult specific reference documents here for implementation details.

*(This index should be updated as new categories or significant reference documents are added.)*