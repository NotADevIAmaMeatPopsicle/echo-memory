# ECHO TASK TEMPLATE

**Task ID:** `TASK-XXX` (Sequential numbering: TASK-001, TASK-002, etc.)
**Date Created:** YYYY-MM-DD
**Created By:** [Your Name/Role]
**Status:** BLOCKED | READY | IN_PROGRESS | TESTING | DONE
**Priority:** CRITICAL | HIGH | MEDIUM | LOW
**Dependencies:** [List of TASK-IDs that must be completed first]
**Estimated Effort:** [Hours/Days - be realistic, not optimistic]
**Assigned To:** [Who is responsible for completion]

---

## 1. PROBLEM STATEMENT

**What exactly needs to be built/fixed and WHY?**

Provide a clear, concise description of:
- The specific technical problem or feature requirement
- Business justification and impact
- Current state vs desired state
- Stakeholder requirements

## 2. ACCEPTANCE CRITERIA (MANDATORY - RIGID REQUIREMENTS)

**These are the NON-NEGOTIABLE requirements for task completion:**

✅ **Functional Requirements:**
- [ ] Requirement 1 (must be specific and testable)
- [ ] Requirement 2 (must be specific and testable)
- [ ] Requirement 3 (must be specific and testable)

✅ **Technical Requirements:**
- [ ] Code follows established patterns and architecture
- [ ] All security requirements met
- [ ] Performance requirements met
- [ ] Error handling implemented

✅ **Quality Requirements:**
- [ ] Test coverage ≥ 90% for new code
- [ ] All tests passing
- [ ] Documentation updated
- [ ] Code review completed

## 3. IMPLEMENTATION DETAILS

**Step-by-step technical approach:**

### Phase 1: [Phase Name]
1. Step 1 with specific technical details
2. Step 2 with specific technical details
3. Step 3 with specific technical details

### Phase 2: [Phase Name]
1. Step 1 with specific technical details
2. Step 2 with specific technical details

### Key Technical Decisions:
- Decision 1: Rationale
- Decision 2: Rationale

### Files to be Created/Modified:
- `path/to/file1.js` - Purpose and changes
- `path/to/file2.js` - Purpose and changes

## 4. TEST STRATEGY (COMPREHENSIVE)

### Unit Tests Required:
- [ ] Test scenario 1
- [ ] Test scenario 2
- [ ] Edge case 1
- [ ] Error condition 1

### Integration Tests Required:
- [ ] Integration scenario 1
- [ ] Integration scenario 2

### API Tests Required (if applicable):
- [ ] Endpoint test 1
- [ ] Endpoint test 2

### Manual Testing Checklist:
- [ ] Manual test 1
- [ ] Manual test 2

### Performance Testing (if applicable):
- [ ] Load test scenarios
- [ ] Response time requirements

## 5. DEFINITION OF DONE (MANDATORY CHECKLIST)

**Task is NOT complete until ALL items are checked:**

### Code Completion:
- [ ] All implementation details completed
- [ ] Code follows project standards and patterns
- [ ] No console errors or warnings
- [ ] All TODOs and FIXMEs resolved

### Testing Completion:
- [ ] All unit tests written and passing
- [ ] All integration tests written and passing
- [ ] Test coverage ≥ 90% for new code
- [ ] Manual testing completed

### Documentation:
- [ ] Code documentation updated (JSDoc, comments)
- [ ] API documentation updated (Swagger)
- [ ] Memory bank documentation updated
- [ ] README updated if needed

### Quality Assurance:
- [ ] Code review completed by another developer
- [ ] Security review completed (if applicable)
- [ ] Performance validation completed (if applicable)
- [ ] Linting and formatting checks pass

### Integration:
- [ ] Changes committed with proper commit message
- [ ] Branch merged (if applicable)
- [ ] Deployment verification (if applicable)
- [ ] Rollback plan documented (if applicable)

## 6. RISK ASSESSMENT

### High Risk Items:
- **Risk 1:** Description and mitigation strategy
- **Risk 2:** Description and mitigation strategy

### Medium Risk Items:
- **Risk 1:** Description and mitigation strategy

### Dependencies at Risk:
- Dependency on external system/team/resource

### Rollback Plan:
- How to undo changes if something goes wrong

## 7. STATUS TRACKING (MANDATORY UPDATES)

### Status Change Log:
| Date | Status | Updated By | Notes |
|------|--------|------------|-------|
| YYYY-MM-DD | CREATED | [Name] | Task created |

### Current Blockers (if status is BLOCKED):
- **Blocker 1:** Description, responsible party, expected resolution
- **Blocker 2:** Description, responsible party, expected resolution

### Progress Notes:
- **YYYY-MM-DD:** Progress update
- **YYYY-MM-DD:** Progress update

## 8. VALIDATION GATES

### Pre-Work Validation:
- [ ] All dependencies are truly complete (not just "done")
- [ ] Required resources/access available
- [ ] Task is properly scoped and sized
- [ ] Implementation approach approved

### Mid-Work Validation:
- [ ] Implementation following planned approach
- [ ] No scope creep occurring
- [ ] Timeline on track
- [ ] Quality standards being met

### Completion Validation:
- [ ] All acceptance criteria met
- [ ] Definition of done checklist complete
- [ ] Stakeholder sign-off received
- [ ] Production readiness confirmed

## 9. RELATED ARTIFACTS

### Task Dependencies:
- **Depends on:** TASK-XXX (specific reason)
- **Blocks:** TASK-XXX (specific reason)

### Related Issues:
- ISSUE-XXX: Description

### Documentation Links:
- Memory Bank Reference: `memory-bank/path/to/doc.md`
- Technical Spec: `docs/path/to/spec.md`

### Code References:
- Existing implementation: `src/path/to/file.js:line`
- Related functionality: `src/path/to/file.js:line`

---

**CRITICAL RULES:**
1. **NO TASK STARTS** until all dependencies are DONE (not just "in progress")
2. **NO TASK IS MARKED DONE** until Definition of Done checklist is 100% complete
3. **STATUS UPDATES ARE MANDATORY** - must update with timestamp and reason for any status change
4. **ACCEPTANCE CRITERIA ARE IMMUTABLE** - changes require new task creation
5. **VALIDATION GATES MUST BE PASSED** - no skipping for "time pressure"

*This template ensures elite-level delivery with zero ambiguity and maximum quality.*