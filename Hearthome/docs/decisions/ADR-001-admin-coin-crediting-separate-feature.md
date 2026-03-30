# ADR-001: Admin coin crediting is a separate feature

Status: accepted

Context:
The original requirements described an admin submitting calories on behalf of a player. During the BDD session it became clear that the admin action is directly crediting coins to a player's balance, with no calorie conversion involved.

Decision:
Admin coin crediting is extracted into its own feature file (credit_coins.feature) and is not part of the submit calories feature.

Consequences:
The submit calories feature remains focused on a single actor (the player) and a single action (submitting calories). Admin coin crediting will be specified and implemented independently, with its own scenarios, design, and use case.
