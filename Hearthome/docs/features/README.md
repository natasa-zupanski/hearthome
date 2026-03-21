# features/

Gherkin feature files produced during BDD sessions. One file per feature.

## Format

```gherkin
Feature: [feature name in plain language]

  As a [role]
  I want [goal]
  So that [reason]

  # Acceptance criteria
  # 1. [item]
  # 2. [item]

  Scenario: [short descriptive title]
    Given [the starting context]
    When  [the action taken]
    Then  [the observable outcome]
    And   [additional outcome, if needed]
```

## Rules

- Do not create or edit feature files manually — they are written incrementally during BDD sessions as each step is confirmed.
- Each file covers exactly one feature.
- `SoftwareRequirements.md` is the starting reference for discovery, but acceptance criteria are always derived fresh through conversation.
