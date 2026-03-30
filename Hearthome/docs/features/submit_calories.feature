Feature: Submit calories for in-game currency

  As a player
  I want to submit calories I burned
  So that I earn in-game currency to buy furniture and items to decorate my home

  # Acceptance criteria
  # 1. When a player submits a valid positive number of calories, their coin balance increases by that amount.
  # 2. If the backend receives a submission of zero, a negative number, or a decimal by any means, it rejects it, awards no coins, and returns an error explaining that the value must be a positive whole number.
  # 3. The UI prevents a user from entering a negative or decimal value of calories and displays feedback indicating the value of calories must be a positive whole number.
  # 4. The UI prevents a user from submitting zero calories and displays feedback indicating the value of calories must be a positive whole number.
  # 5. If a submission fails due to a technical error, the error is logged, and the user is informed and prompted to try again.
  # 6. If a calorie submission fails due to a technical error 10 times, the user is directed to contact an admin or file a GitHub issue.
  # 7. If the UI receives a backend error indicating a non-positive or decimal number was submitted, it logs it as an error and displays feedback indicating the value of calories must be a positive whole number.
  # 8. If a user submits a number of calories greater than 100,000, their coin balance does not change and they receive feedback indicating the number of calories submitted must be less than or equal to 100,000.

  # --- AC 1 ---

  Scenario: Player submits calories and receives coins
    Given a player with a coin balance of 0
    When the player submits 50 calories burned
    Then their coin balance becomes 50
    And the UI displays a coin balance of 50

  Scenario: Player submits calories and balance increases by that amount
    Given a player with a coin balance of 100
    When the player submits 40 calories burned
    Then their coin balance becomes 140
    And the UI displays a coin balance of 140

  # --- AC 2 ---

  Scenario: Backend rejects a calorie submission of zero
    Given a player with a coin balance of 100
    When the backend receives a calorie submission of 0
    Then the submission is rejected
    And no coins are awarded
    And an error is returned explaining the value must be a positive whole number
    And the player's coin balance remains 100

  Scenario: Backend rejects a negative calorie submission
    Given a player with a coin balance of 100
    When the backend receives a calorie submission of -10
    Then the submission is rejected
    And no coins are awarded
    And an error is returned explaining the value must be a positive whole number
    And the player's coin balance remains 100

  Scenario: Backend rejects a decimal calorie submission
    Given a player with a coin balance of 100
    When the backend receives a calorie submission of 1.5
    Then the submission is rejected
    And no coins are awarded
    And an error is returned explaining the value must be a positive whole number
    And the player's coin balance remains 100

  # --- AC 3 ---

  Scenario: UI prevents entering a negative calorie value
    Given a player
    When the player attempts to enter -10 calories
    Then the input does not accept the value
    And the UI displays feedback indicating the value of calories must be a positive whole number

  Scenario: UI prevents entering a decimal calorie value
    Given a player
    When the player attempts to enter 1.5 calories
    Then the input does not accept the value
    And the UI displays feedback indicating the value of calories must be a positive whole number

  # --- AC 4 ---

  Scenario: UI prevents submitting zero calories
    Given a player
    When the player attempts to submit 0 calories
    Then the submission is not made
    And the UI displays feedback indicating the value of calories must be a positive whole number

  # --- AC 5 ---

  Scenario: User is informed and prompted to retry after a technical error
    Given a player
    And a technical error will occur
    When the player submits calories
    Then the user is informed that the submission failed
    And the user is prompted to try again

  # --- AC 6 ---

  Scenario: User is directed to contact an admin after 10 consecutive technical errors
    Given a player whose calorie submission has failed due to a technical error 9 times
    And a technical error will occur
    When the player submits calories
    Then the user is directed to contact an admin or file a GitHub issue

  Scenario: Failure count resets after a successful submission
    Given a player whose calorie submission has failed due to a technical error 9 times
    And the player has since successfully submitted calories
    And a technical error will occur
    When the player submits calories
    Then the user is informed that the submission failed
    And the user is prompted to try again

  # --- AC 7 ---

  Scenario: UI logs and displays feedback when the backend rejects a non-positive or decimal calorie submission
    Given a player
    When the UI receives a backend error indicating the submitted calorie value must be a positive number
    Then the error is logged
    And the UI displays feedback indicating the value of calories must be a positive whole number

  # --- AC 8 ---

  Scenario: UI prevents submitting more than 100,000 calories
    Given a player with a coin balance of 0
    When the player attempts to submit 100,001 calories
    Then the submission is not made
    And the player's coin balance remains 0
    And the UI displays feedback indicating the number of calories submitted must be less than or equal to 100,000
