Feature: Credit coins to a player's balance

  As an admin
  I want to credit coins to a player's balance
  So that I can correct missed or failed calorie entries

  # Acceptance criteria
  # 1. When an admin credits a valid positive number of coins to a player's balance, that player's coin balance increases by that amount and the admin's coin balance is unaffected.

  # --- AC 1 ---

  Scenario: Admin credits coins to a player's balance
    Given a player with a coin balance of 0
    And an admin with a coin balance of 0
    When the admin selects that player
    And adds 50 coins to their balance
    Then the player's coin balance becomes 50
    And the admin's coin balance remains 0
