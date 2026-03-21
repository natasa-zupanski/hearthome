# adapters/fitnessclient/

HTTP client for the external C# fitness service.

Responsibilities: HTTP call and raw deserialization only. No game logic, no field selection — those live in `domain/`.

If the fitness service API contract changes, only this package should need to change.
