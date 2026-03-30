# ADR-003: Technical error counter lives in the frontend

Status: accepted

Context:
ACs 5 and 6 describe what happens when calorie submissions fail due to technical errors — the user is informed and prompted to retry, and after 10 consecutive failures is directed to contact an admin. The question was whether this retry/redirect logic belongs in the backend domain or the frontend.

Decision:
The technical error counter and the retry/redirect logic are UI state, managed in the frontend. The backend is not involved.

Consequences:
The backend domain remains focused on business logic. The frontend owns the responsibility of counting failures and deciding when to switch from a retry prompt to an admin contact message. This state does not persist across sessions.
