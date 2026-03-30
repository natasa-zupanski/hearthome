# ADR-005: Domain design for submit calories feature

Status: accepted

Context:
No code exists yet for this project. The domain design for the submit calories feature needed to be agreed before implementation begins.

Decision:
The following domain building blocks are defined for this feature:

**Entities / value objects**
- `Player` — owns the coin balance; updated directly by the use case
- `CalorieSubmission` — value object representing the submitted calorie amount
- `CalorieValidator` — domain service; enforces that the value is a positive whole number and does not exceed 100,000
- Domain error types (e.g. `InvalidCalorieValueError`) — named error types for invalid submissions

**Domain interfaces**
- `Logger` — allows the use case to log without depending on infrastructure

**Use case**
- `SubmitCalories` — accepts a calorie submission for a player, validates it, updates the player's coin balance, and returns an error if the submission is invalid

Consequences:
Implementation begins from the domain layer outward. The calorie-to-coin conversion rate (1:1) is a trivial rule handled inside the use case, not a separate entity. Persistence and authorization are out of scope for this feature.
