# Hearthome Software Requirements (MVP)

## 1. Purpose
Hearthome is a health-linked home decoration game where player activity is converted into in-game currency. In the MVP, calories burned is the only health metric, and the primary gameplay loop is:
calories burned -> currency earned -> furniture & items purchased -> house decorated.

## 2. Scope
This document defines needs and features for the project.

## 3. Needs
- Provide a direct and understandable link between real-world activity and in-game rewards.
- Encourage healthy behavior through visible game progress.
- Deliver a creative, inspiring, and stress-free decorating experience.

## 4. Features
- As a player, I can submit or sync calories burned.
- As a player, I can see how many coins I have.
- As a player, I can browse and buy furniture with coins.
- As a player, I can place, move, rotate, and store owned furniture on an isometric grid.
- As a player, I can place, move, rotate, and store owned items on furniture with a surface.

## 5. Behavior Examples

### 5.1 Submit Calories and View Calories
Values To Test:
- 1 -> 1
- 50 -> 50
- 0 -> invalid

#### 5.1.1 Valid - Submit calories
As a player, when I enter 1 calories burned, I gain and see 1 coins.
1. Player enters 1 calories burned.
2. System adds 1 coin to balance.
3. System displays balance of 1 coin.

#### 5.1.2 Valid - Submit calories - 2nd
As a player, when I enter 50 calories burned, I gain and see 50 coins.
1. Player enters 50 calories burned.
2. System adds 50 coins to balance.
3. System displays balance of 50 coins.

#### 5.1.3 Invalid - Submit zero calories
As a player, when I enter 0 calories, I see a message stating that calories entered must be greater than 0.
1. Player enters 0 calories burned.
2. System displays message: calories entered must be greater than 0.

### 5.2 Buy Furniture
Furniture to Test:
- Cabinet
Prices to Test:
- 1
- 2
Balances to Test:
- 0
- 1
- 50

Test Cases:
- Buy Cabinet for 1 coin, balance is 1 -> Cabinet in inventory, balance is 0
- Buy Cabinet for 1 coin, balance is 50 -> Cabinet in inventory, balance is 49.
- Buy Cabinet for 2 coins, balance is 50 -> Cabinet in inventory, balance is 48.
- Buy Cabinet for 1 coin, balance is 0 -> Inventory empty, balance is 0, unable to select buy option
- Buy Cabinet for 2 coin, balance is 1 -> Inventory empty, balance is 1, unable to select buy option

#### 5.2.1 Valid - Buy Cabinet
As a player, when I have a balance of 1 and buy a Cabinet which costs 1 coin, I gain the Cabinet in my inventory and my balance becomes 0.
1. Player has balance of 1.
2. Cabinet has cost of 1.
3. Player selects buy Cabinet.
4. System adds Cabinet to Player inventory.
5. System updates Player balance to 0.

#### 5.2.2 Valid - Buy Cabinet - 2nd
As a player, when I have a balance of 50 and buy a Cabinet which costs 1 coin, I gain the Cabinet in my inventory and my balance becomes 49.
1. Player has balance of 50.
2. Cabinet has cost of 1.
3. Player selects buy Cabinet.
4. System adds Cabinet to Player inventory.
5. System updates Player balance to 49.

#### 5.2.1 Valid - Buy Cabinet - 3rd
As a player, when I have a balance of 50 and buy a Cabinet which costs 2 coin, I gain the Cabinet in my inventory and my balance becomes 48.
1. Player has balance of 50.
2. Cabinet has cost of 2.
3. Player selects buy Cabinet.
4. System adds Cabinet to Player inventory.
5. System updates Player balance to 48.

#### 5.2.4 Invalid - Buy Cabinet - Not Enough Money
As a player, when I have a balance of 0 and try to buy a Cabinet which costs 1 coin, I cannot select the buy option, I do not gain the Cabinet, and my balance stays at 0.
1. Player has balance of 0.
2. Cabinet has cost of 1.
3. System disables ability to buy Cabinet.
4. System displays inability to buy Cabinet.
5. Player selects to buy Cabinet.
6. System displays inability to buy Cabinet.

#### 5.2.4 Invalid - Buy Cabinet - Not Enough Money - 2nd
As a player, when I have a balance of 1 and try to buy a Cabinet which costs 2 coins, I cannot select the buy option, I do not gain the Cabinet, and my balance stays at 1.
1. Player has balance of 1.
2. Cabinet has cost of 2.
3. System disables ability to buy Cabinet.
4. System displays inability to buy Cabinet.
5. Player selects to buy Cabinet.
6. System displays inability to buy Cabinet.

