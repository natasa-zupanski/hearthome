# ADR-002: AC 2 backend rejection includes decimals

Status: accepted

Context:
The backend will likely receive calories as an integer, making a decimal submission impossible at the transport layer. The question was whether AC 2 (backend rejection of invalid values) should mention decimals or omit them on the grounds that they can never arrive.

Decision:
AC 2 includes decimals alongside zero and negative numbers. The acceptance criteria should not assume the transport type, as that is an implementation detail that may change.

Consequences:
The backend validation is implementation-agnostic and will remain correct if the API contract changes (e.g. accepting a float). The UI-side decimal prevention (AC 3) and the backend rejection (AC 2) are consistent with each other.
