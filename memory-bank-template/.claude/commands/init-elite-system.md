# Command: /init-elite-system
# Usage: /init-elite-system [project_name] [project_description]
# Example: /init-elite-system "My Awesome App" "A revolutionary productivity application"

You are tasked with initializing the Echo Task Management System for a new project. This command deploys the complete Echo Task Management System with memory bank structure, cross-system coordination, and production-ready development standards.

**Project Information:**
- **Project Name:** ${1} (if not provided, prompt user)
- **Project Description:** ${2} (if not provided, prompt user)

**Actions to Perform:**

1. **Gather Project Information (if not provided):**
   - Project name and description
   - Technology stack preferences (backend, frontend, database)
   - Primary development team size and roles
   - Target deployment timeline
   - Key business requirements

2. **Deploy Echo Task Management System:**
   - Create complete directory structure (memory-bank/, tasks/, .claude/, .roo/)
   - Deploy all template files with customized placeholders
   - Initialize ECHO-TASK-REGISTRY.md with first task placeholder
   - Set up cross-system coordination between Claude Code and Echo (.roo)

3. **Initialize Memory Bank Structure:**
   - Deploy activeContext.md with initialization summary
   - Create productContext.md with project requirements
   - Set up techContext.md with technology stack
   - Initialize systemPatterns.md and testingContext.md
   - Create progress.md with current status
   - Set up component and cross-cutting documentation directories

4. **Configure Development Standards:**
   - Deploy Elite Task templates with project-specific customization
   - Set up validation gates and status tracking
   - Configure testing requirements and quality standards
   - Initialize issue tracking and task completion report structure

5. **Set Up Cross-System Integration:**
   - Deploy CLAUDE.md with project-specific guidance
   - Create Echo prompt template for .roo integration
   - Configure update-memory-bank command with git automation
   - Establish coordination protocols between AI systems

6. **Validate Deployment:**
   - Verify all directories and files are created correctly
   - Confirm templates are properly customized with project information
   - Validate Echo Task Management System is operational
   - Test cross-system coordination setup

**Template Replacements:**
- `[PROJECT_NAME]` → Project name provided
- `[PROJECT_DESCRIPTION]` → Project description provided
- `[CURRENT_DATE]` → Current date (YYYY-MM-DD format)
- `[PROJECT_PATH]` → Current working directory path
- Technology stack placeholders → User-specified technologies

**Directory Structure to Create:**
```
project-root/
├── CLAUDE.md (customized from template)
├── memory-bank/
│   ├── activeContext.md
│   ├── productContext.md
│   ├── techContext.md
│   ├── systemPatterns.md
│   ├── testingContext.md
│   ├── progress.md
│   ├── next-steps-action-plan.md
│   ├── index.md
│   ├── components/
│   ├── cross-cutting/
│   ├── system/
│   ├── task-completion-reports/
│   └── issues/
├── tasks/
│   ├── ECHO-TASK-REGISTRY.md
│   ├── ELITE-TASK-TEMPLATE.md
│   ├── ELITE-STATUS-TRACKING.md
│   └── ELITE-VALIDATION-GATES.md
├── .claude/
│   └── commands/
│       └── update-memory-bank.md
└── .roo/
    └── echo-prompt.md
```

**Success Criteria:**
- [ ] Complete Echo Task Management System deployed
- [ ] All template files customized with project information
- [ ] Memory bank structure fully initialized
- [ ] Cross-system coordination configured
- [ ] First task placeholder created in registry
- [ ] Development standards and quality gates established

**Output:**
Provide a comprehensive summary of:
1. All files and directories created
2. Key customizations applied
3. Next steps for the development team
4. Instructions for using the Echo Task Management System
5. Cross-system coordination setup confirmation

**Git Integration:**
After successful deployment:
1. Stage all created files: `git add .`
2. Create initialization commit with detailed message
3. Push to remote repository (if configured)

This initialization establishes the complete Echo Task Management System foundation proven successful in enterprise-grade development projects.