# usecases/

One file per use case (e.g. `earn_currency.go`, `purchase_furniture.go`, `decorate_room.go`).

Depends only on domain interfaces — never on concrete implementations. No business logic lives elsewhere.

Use cases are derived from `design/SoftwareRequirements.md`.
