# decisions/

Architecture Decision Records (ADRs). One file per non-trivial design decision, created during the Design Checkpoint step of a BDD session.

## Naming

`ADR-[NNN]-[short-title].md` — numbered sequentially (e.g. `ADR-001-calorie-to-coin-conversion.md`).

## Format

```markdown
# ADR-[NNN]: [short title]

Status: accepted

Context:
[Why this decision needed to be made — one or two sentences.]

Decision:
[What was decided.]

Consequences:
[What this enables and what tradeoffs it introduces.]
```

## Rules

- Do not create ADRs manually — they are written during BDD Design Checkpoint steps.
- One ADR per decision. If a session produces multiple decisions, create one file each.
- Check existing ADRs before numbering a new one to avoid collisions.
