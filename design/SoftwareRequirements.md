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

### 5.3 Place Furniture on Grid
Furniture to Test:
- Cabinet (1x1 footprint)
- Sofa (2x1 footprint, rotates to 1x2)

Grid to Test:
- 4x4 room

Positions to Test:
- (1,1) — valid empty tile
- (1,4) — valid boundary tile
- (1,3) — valid tile adjacent to boundary (relevant for 2x1 footprint)
- (1,4) — boundary tile where a 2x1 footprint would extend outside

Test Cases:
- Place Cabinet (1x1) at empty (1,1) within 4x4 room -> Cabinet placed at (1,1)
- Place Sofa (2x1) rotated to (1x2) at (1,3) within 4x4 room -> Sofa placed at (1,3)-(1,4)
- Place Cabinet (1x1) at occupied (1,1) -> not placed, invalid
- Place Cabinet (1x1) at (5,1) outside 4x4 room -> not placed, invalid
- Place Sofa (2x1) at (1,4) within 4x4 room where footprint extends to (1,5) -> not placed, invalid
- Place Sofa (2x1) rotated to (1x2) at (1,3) where (1,4) is occupied -> not placed, invalid

#### 5.3.1 Valid - Place Cabinet
As a player, when I place a Cabinet on an empty tile within the room, the Cabinet is placed there.
1. Room is a 4x4 grid.
2. Tile (1,1) is empty.
3. Player places Cabinet at (1,1).
4. System places Cabinet at (1,1).

#### 5.3.2 Valid - Place Rotated Sofa
As a player, when I rotate a Sofa 90° and place it where the rotated footprint fits within the room and on empty tiles, the Sofa is placed there.
1. Room is a 4x4 grid.
2. Tiles (1,3) and (1,4) are empty.
3. Sofa has a 2x1 footprint; player rotates it 90° making it 1x2.
4. Player places Sofa at (1,3).
5. System places Sofa occupying (1,3) and (1,4).

#### 5.3.3 Invalid - Place on Occupied Space
As a player, when I try to place a Cabinet on an occupied tile, the Cabinet is not placed.
1. Room is a 4x4 grid.
2. Tile (1,1) is occupied by existing furniture.
3. Player attempts to place Cabinet at (1,1).
4. System does not place Cabinet.
5. System displays that the placement is invalid.

#### 5.3.4 Invalid - Place Outside Room Boundary
As a player, when I try to place a Cabinet outside the room boundary, the Cabinet is not placed.
1. Room is a 4x4 grid.
2. Player attempts to place Cabinet at (5,1).
3. System does not place Cabinet.
4. System displays that the placement is invalid.

#### 5.3.5 Invalid - Footprint Extends Outside Boundary
As a player, when I try to place a Sofa where part of its footprint falls outside the room boundary, the Sofa is not placed.
1. Room is a 4x4 grid.
2. Sofa has a 2x1 footprint.
3. Player attempts to place Sofa at (1,4), which would extend the footprint to (2,4) — outside the grid.
4. System does not place Sofa.
5. System displays that the placement is invalid.

#### 5.3.6 Invalid - Rotated Footprint Overlaps Occupied Space
As a player, when I rotate a Sofa and try to place it where the rotated footprint overlaps an occupied tile, the Sofa is not placed.
1. Room is a 4x4 grid.
2. Tile (1,4) is occupied by existing furniture.
3. Sofa has a 2x1 footprint; player rotates it 90° making it 1x2.
4. Player attempts to place Sofa at (1,3), which would extend the rotated footprint to (1,4).
5. System does not place Sofa.
6. System displays that the placement is invalid.

### 5.4 Move Furniture (Edit Session)
Furniture to Test:
- Cabinet (1x1 footprint)

Grid to Test:
- 4x4 room

Test Cases:
- Move Cabinet from (1,1) to empty (2,2) -> Cabinet at (2,2), (1,1) is empty
- Move Cabinet A from (1,1) to (2,2), then Cabinet B from (2,2) to (1,1) within same session, confirm -> A at (2,2), B at (1,1)
- Drop Cabinet on occupied tile -> Cabinet bounces back to (1,1)
- Drop Cabinet outside boundary -> Cabinet bounces back to (1,1)
- Move Cabinet from (1,1) to (2,2), then cancel session -> Cabinet back at (1,1)
- Move Cabinet from (1,1) to (2,2), then confirm session -> Cabinet stays at (2,2)

#### 5.4.1 Valid - Move Furniture
As a player, when I move a Cabinet to a valid empty position and confirm the edit session, the Cabinet is at the new position.
1. Room is a 4x4 grid.
2. Cabinet is at (1,1). Tile (2,2) is empty.
3. Player moves Cabinet to (2,2).
4. System places Cabinet at (2,2). Tile (1,1) is now empty.
5. Player confirms the edit session.
6. System commits Cabinet at (2,2).

#### 5.4.2 Valid - Swap Two Furniture Pieces
As a player, when I swap the positions of two Cabinets within one edit session and confirm, both Cabinets are in each other's original positions.
1. Room is a 4x4 grid.
2. Cabinet A is at (1,1). Cabinet B is at (2,2).
3. Player moves Cabinet A to (2,2). System places A at (2,2). Tile (1,1) is now empty.
4. Player moves Cabinet B to (1,1). System places B at (1,1).
5. Player confirms the edit session.
6. System commits Cabinet A at (2,2) and Cabinet B at (1,1).

#### 5.4.3 Invalid - Drop on Occupied Tile
As a player, when I drop a Cabinet on an occupied tile, the Cabinet bounces back to its original position.
1. Room is a 4x4 grid.
2. Cabinet A is at (1,1). Cabinet B is at (2,2).
3. Player attempts to move Cabinet A to (2,2).
4. System detects (2,2) is occupied.
5. System returns Cabinet A to (1,1).
6. System displays that the placement is invalid.

#### 5.4.4 Invalid - Drop Outside Boundary
As a player, when I drop a Cabinet outside the room boundary, the Cabinet bounces back to its original position.
1. Room is a 4x4 grid.
2. Cabinet is at (1,1).
3. Player attempts to move Cabinet to (5,1).
4. System detects (5,1) is outside the room.
5. System returns Cabinet to (1,1).
6. System displays that the placement is invalid.

#### 5.4.5 Cancel Edit Session
As a player, when I move a Cabinet and then cancel the edit session, the Cabinet returns to its original position.
1. Room is a 4x4 grid.
2. Cabinet is at (1,1). Tile (2,2) is empty.
3. Player moves Cabinet to (2,2).
4. Player cancels the edit session.
5. System reverts Cabinet to (1,1).

#### 5.4.6 Confirm Edit Session
As a player, when I move a Cabinet and then confirm the edit session, the Cabinet stays at the new position.
1. Room is a 4x4 grid.
2. Cabinet is at (1,1). Tile (2,2) is empty.
3. Player moves Cabinet to (2,2).
4. Player confirms the edit session.
5. System commits Cabinet at (2,2).

### 5.5 Store Furniture
Furniture to Test:
- Cabinet (1x1 footprint)

Grid to Test:
- 4x4 room

Test Cases:
- Store Cabinet from (1,1) -> Cabinet in inventory, tile (1,1) is empty

#### 5.5.1 Valid - Store Furniture
As a player, when I store a Cabinet that is placed on the grid, the Cabinet is removed from the grid and added to my inventory.
1. Room is a 4x4 grid.
2. Cabinet is at (1,1).
3. Player stores Cabinet.
4. System removes Cabinet from (1,1). Tile (1,1) is now empty.
5. System adds Cabinet to Player inventory.

