# ADR-004: No player data persistence interface for the submit calories feature

Status: accepted

Context:
The submit calories use case needs to update a player's coin balance. The question was whether to define a domain interface for persisting player data as part of this feature's domain design.

Decision:
No player data persistence interface is defined for this feature. The use case operates on a Player entity directly. Persistence is deferred to a future feature when login and authorization are introduced.

Consequences:
The domain design for this feature stays minimal and avoids premature assumptions about persistence strategy. An appropriate interface for persisting player data will be introduced and named when the login/authorization feature is specified.
