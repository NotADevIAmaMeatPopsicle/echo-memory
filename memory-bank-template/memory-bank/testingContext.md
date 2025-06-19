# Testing Context

## Metadata
- **Type**: Memory Bank Core
- **Version**: 1.0.0
- **Last Updated**: [CURRENT_DATE]
- **Project Location**: [PROJECT_PATH]
- **Dependencies**: techContext.md, systemPatterns.md
- **Interfaces**: All components requiring testing

## Testing Philosophy

### Test-Driven Development (TDD)
**Approach:** Echo Task Management System requires TDD for all new features and significant refactors.

**TDD Cycle:**
1. **Red:** Write failing test that defines desired behavior
2. **Green:** Write minimal code to make test pass
3. **Refactor:** Improve code while keeping tests green
4. **Commit:** Commit tests and implementation separately

### Quality Standards
- **Minimum Coverage:** 90% for all new code
- **Test Reliability:** Zero flaky tests tolerated
- **Test Speed:** Unit test suite must run in under [TIME_LIMIT]
- **Test Clarity:** Each test should test one specific behavior

## Testing Strategy

### Testing Pyramid

#### Unit Tests (Foundation)
**Coverage Target:** 90%+  
**Framework:** [UNIT_TEST_FRAMEWORK]  
**Scope:** Individual functions, classes, and components in isolation

**Standards:**
- Mock all external dependencies
- Test both happy path and error conditions
- Use descriptive test names that explain behavior
- Follow AAA pattern (Arrange, Act, Assert)

#### Integration Tests (Middle)
**Coverage Target:** [INTEGRATION_COVERAGE_TARGET]  
**Framework:** [INTEGRATION_TEST_FRAMEWORK]  
**Scope:** Multiple components working together

**Standards:**
- Test real integrations between layers
- Use test database for data layer integration
- Test error handling between components
- Verify data flow and transformations

#### End-to-End Tests (Top)
**Coverage Target:** [E2E_COVERAGE_TARGET]  
**Framework:** [E2E_TEST_FRAMEWORK]  
**Scope:** Complete user workflows and critical business paths

**Standards:**
- Test from user perspective
- Cover critical business workflows
- Include authentication and authorization flows
- Test error scenarios users might encounter

### Specialized Testing

#### API Testing
**Framework:** [API_TEST_FRAMEWORK]  
**Coverage:** All API endpoints

**Test Categories:**
- **Contract Testing:** Request/response schemas
- **Authentication Testing:** All auth mechanisms
- **Authorization Testing:** Permission-based access
- **Error Response Testing:** All error conditions
- **Performance Testing:** Response time validation

#### Database Testing
**Approach:** [DATABASE_TEST_APPROACH]  
**Test Database:** [TEST_DB_CONFIGURATION]

**Test Categories:**
- **Repository Testing:** Data access layer validation
- **Migration Testing:** Schema change validation
- **Constraint Testing:** Database integrity rules
- **Performance Testing:** Query performance validation

## Test Environment Configuration

### Test Database Setup
```bash
# Test database initialization
[TEST_DB_SETUP_COMMANDS]

# Test data seeding
[TEST_DATA_COMMANDS]

# Test database cleanup
[TEST_DB_CLEANUP_COMMANDS]
```

### Environment Variables
```bash
# Test-specific environment configuration
[TEST_ENV_VARS]
```

### Mock Configuration
**Mocking Strategy:** [MOCKING_APPROACH]  
**External Services:** [HOW_EXTERNAL_SERVICES_ARE_MOCKED]  
**Database Mocking:** [WHEN_TO_MOCK_DATABASE]

## Test Organization

### Directory Structure
```
tests/
├── unit/
│   ├── [COMPONENT_TYPE_1]/
│   ├── [COMPONENT_TYPE_2]/
│   └── [COMPONENT_TYPE_3]/
├── integration/
│   ├── [INTEGRATION_TYPE_1]/
│   └── [INTEGRATION_TYPE_2]/
├── api/
│   ├── [API_GROUP_1]/
│   └── [API_GROUP_2]/
├── e2e/
│   ├── [WORKFLOW_1]/
│   └── [WORKFLOW_2]/
├── fixtures/
├── helpers/
└── __mocks__/
```

### Naming Conventions
- **Test Files:** `[component-name].[test-type].test.[extension]`
- **Test Suites:** `describe('[ComponentName]', () => { ... })`
- **Test Cases:** `it('should [expected behavior] when [conditions]', () => { ... })`

## Testing Patterns

### Unit Test Pattern
```[LANGUAGE]
import { [ComponentUnderTest] } from '[path]';
import { [MockDependency] } from '[mock-path]';

describe('[ComponentUnderTest]', () => {
  let [componentInstance];
  let [mockDependency];

  beforeEach(() => {
    [mockDependency] = new [MockDependency]();
    [componentInstance] = new [ComponentUnderTest]([mockDependency]);
  });

  describe('[methodName]', () => {
    it('should [expected behavior] when [conditions]', async () => {
      // Arrange
      const [input] = [test-data];
      [mockDependency].[method].mockResolvedValue([expected-response]);

      // Act
      const result = await [componentInstance].[methodName]([input]);

      // Assert
      expect(result).toEqual([expected-result]);
      expect([mockDependency].[method]).toHaveBeenCalledWith([expected-args]);
    });

    it('should throw [ErrorType] when [error-condition]', async () => {
      // Arrange
      const [invalidInput] = [invalid-data];
      [mockDependency].[method].mockRejectedValue(new [ErrorType]('[error-message]'));

      // Act & Assert
      await expect([componentInstance].[methodName]([invalidInput]))
        .rejects.toThrow([ErrorType]);
    });
  });
});
```

### Integration Test Pattern
```[LANGUAGE]
import { [TestApplication] } from '[test-app-path]';
import { [TestDatabase] } from '[test-db-path]';

describe('[ComponentIntegration]', () => {
  let app;
  let db;

  beforeAll(async () => {
    app = new [TestApplication]();
    db = new [TestDatabase]();
    await app.start();
    await db.migrate();
  });

  afterAll(async () => {
    await db.cleanup();
    await app.stop();
  });

  beforeEach(async () => {
    await db.seed();
  });

  afterEach(async () => {
    await db.truncate();
  });

  it('should [integration behavior] when [conditions]', async () => {
    // Arrange
    const [testData] = await db.create[Entity]([entity-data]);

    // Act
    const result = await app.[operation]([input]);

    // Assert
    expect(result).toEqual([expected-result]);
    const [verificationData] = await db.find[Entity]([search-criteria]);
    expect([verificationData]).toEqual([expected-state]);
  });
});
```

## Test Data Management

### Fixture Strategy
**Location:** `tests/fixtures/`  
**Format:** [FIXTURE_FORMAT]  
**Organization:** [HOW_FIXTURES_ARE_ORGANIZED]

### Test Data Builders
```[LANGUAGE]
class [EntityBuilder] {
  constructor() {
    this.data = {
      [default-properties]
    };
  }

  with[Property](value) {
    this.data.[property] = value;
    return this;
  }

  build() {
    return this.data;
  }

  async create() {
    return await [Repository].create(this.data);
  }
}
```

### Database Seeding
**Strategy:** [SEEDING_APPROACH]  
**Cleanup:** [CLEANUP_STRATEGY]  
**Isolation:** [HOW_TESTS_ARE_ISOLATED]

## Coverage and Quality

### Coverage Configuration
```[LANGUAGE]
// Coverage thresholds
{
  "branches": 90,
  "functions": 90,
  "lines": 90,
  "statements": 90
}
```

### Coverage Exclusions
**Excluded Patterns:**
- `[EXCLUSION_PATTERN_1]`
- `[EXCLUSION_PATTERN_2]`
- `[EXCLUSION_PATTERN_3]`

### Quality Gates
**Pre-commit Hooks:**
- All tests must pass
- Coverage thresholds must be met
- No test files with .skip or .only
- Linting checks must pass

## Performance Testing

### Performance Test Strategy
**Framework:** [PERFORMANCE_TEST_FRAMEWORK]  
**Targets:**
- **API Response Time:** [TARGET_TIME]
- **Database Query Time:** [TARGET_TIME]
- **Concurrent Users:** [TARGET_USERS]

### Load Testing
**Scenarios:**
1. **[SCENARIO_1]:** [DESCRIPTION] - [LOAD_PATTERN]
2. **[SCENARIO_2]:** [DESCRIPTION] - [LOAD_PATTERN]

## Continuous Testing

### Test Automation
**CI/CD Integration:** [HOW_TESTS_RUN_IN_CI]  
**Test Parallelization:** [PARALLEL_EXECUTION_STRATEGY]  
**Failure Handling:** [HOW_FAILURES_ARE_HANDLED]

### Test Reporting
**Coverage Reports:** [WHERE_REPORTS_ARE_GENERATED]  
**Test Results:** [HOW_RESULTS_ARE_REPORTED]  
**Performance Metrics:** [PERFORMANCE_TRACKING]

## Debugging and Troubleshooting

### Test Debugging
**Debug Configuration:** [HOW_TO_DEBUG_TESTS]  
**Logging in Tests:** [TEST_LOGGING_STRATEGY]  
**Test Isolation Issues:** [HOW_TO_ISOLATE_PROBLEMS]

### Common Test Patterns
**Flaky Tests:** [HOW_TO_PREVENT_FLAKY_TESTS]  
**Slow Tests:** [HOW_TO_OPTIMIZE_SLOW_TESTS]  
**Brittle Tests:** [HOW_TO_MAKE_TESTS_ROBUST]

---

**This testing context ensures comprehensive quality assurance aligned with Echo Task Management System standards, supporting production-ready code delivery.**