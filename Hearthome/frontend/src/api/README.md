# api/

All HTTP calls to the backend live here. No fetch or axios calls elsewhere in the frontend.

Each file is an HTTP client wrapper — no logic, no transformation beyond parsing the HTTP response.
