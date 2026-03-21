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
5. System adds Cabinet to Player inventory under the furniture tab.

#### 5.5.2 Valid - Store Furniture With Items on It
As a player, when I store a Dresser that has items on its surface, the Dresser and all items on it are removed from the grid and added to my inventory.
1. Room is a 4x4 grid. Dresser is at (1,1) and has a 2x2 surface.
2. Plant is at (1,1) on the Dresser surface.
3. Player stores Dresser.
4. System removes Dresser from (1,1) on the room grid. Tile (1,1) is now empty.
5. System adds Dresser to Player inventory under the furniture tab.
6. System adds Plant to Player inventory under the items tab.

### 5.6 Place Item on Furniture Surface
Note: Item placement on the room floor follows the same rules as furniture placement in section 5.3.

Note: Furniture with a surface tracks the height of that surface so it can be rendered correctly. This height is not necessarily the maximum height of the furniture (e.g. a couch seat is lower than its back). A piece of furniture may have multiple surfaces at different heights (e.g. stairs).

Furniture to Test:
- Dresser (2x2 rectangular surface grid)
- Stairs (two surfaces: bottom step 2x1, top step 2x1)

Items to Test:
- Plant (1x1 footprint)
- Tray (2x1 footprint, rotates to 1x2)

Test Cases:
- Place Plant (1x1) on empty tile (1,1) of Dresser surface -> Plant placed at (1,1) on surface
- Place Tray (2x1) rotated to (1x2) at (1,1) on Dresser surface where (1,1) and (1,2) are empty -> Tray placed at (1,1)-(1,2)
- Place Plant on occupied tile (1,1) of Dresser surface -> not placed, invalid
- Place Plant at (3,1) outside Dresser 2x2 surface -> not placed, invalid
- Place Tray (2x1) at (1,2) on Dresser surface where footprint extends to (2,2) outside surface -> not placed, invalid
- Place Tray (2x1) rotated to (1x2) at (1,1) on Dresser surface where (1,2) is occupied -> not placed, invalid
- Place Plant on bottom step surface of Stairs -> Plant placed on bottom step
- Place Plant on top step surface of Stairs -> Plant placed on top step

#### 5.6.1 Valid - Place Item on Surface
As a player, when I place a Plant on an empty tile on a Dresser surface, the Plant is placed there.
1. Dresser is placed in the room. Dresser has a 2x2 rectangular surface.
2. Surface tile (1,1) is empty.
3. Player places Plant at (1,1) on the Dresser surface.
4. System places Plant at (1,1) on the Dresser surface.

#### 5.6.2 Valid - Place Rotated Item on Surface
As a player, when I rotate a Tray and place it where the rotated footprint fits on the surface, the Tray is placed there.
1. Dresser is placed in the room. Dresser has a 2x2 rectangular surface.
2. Surface tiles (1,1) and (1,2) are empty.
3. Tray has a 2x1 footprint; player rotates it 90° making it 1x2.
4. Player places Tray at (1,1) on the Dresser surface.
5. System places Tray occupying (1,1) and (1,2) on the Dresser surface.

#### 5.6.3 Invalid - Place Item on Occupied Surface Tile
As a player, when I try to place a Plant on an occupied tile on the Dresser surface, the Plant is not placed.
1. Dresser is placed in the room. Dresser has a 2x2 rectangular surface.
2. Surface tile (1,1) is occupied by an existing item.
3. Player attempts to place Plant at (1,1) on the Dresser surface.
4. System does not place Plant.
5. System displays that the placement is invalid.

#### 5.6.4 Invalid - Place Item Outside Surface Boundary
As a player, when I try to place a Plant outside the Dresser surface boundary, the Plant is not placed.
1. Dresser is placed in the room. Dresser has a 2x2 rectangular surface.
2. Player attempts to place Plant at (3,1) on the Dresser surface.
3. System does not place Plant.
4. System displays that the placement is invalid.

#### 5.6.5 Invalid - Item Footprint Extends Outside Surface Boundary
As a player, when I try to place a Tray where part of its footprint falls outside the surface boundary, the Tray is not placed.
1. Dresser is placed in the room. Dresser has a 2x2 rectangular surface.
2. Tray has a 2x1 footprint.
3. Player attempts to place Tray at (1,2) on the Dresser surface, which would extend the footprint to (2,2) — outside the surface grid.
4. System does not place Tray.
5. System displays that the placement is invalid.

#### 5.6.6 Invalid - Rotated Item Footprint Overlaps Occupied Surface Tile
As a player, when I rotate a Tray and try to place it where the rotated footprint overlaps an occupied surface tile, the Tray is not placed.
1. Dresser is placed in the room. Dresser has a 2x2 rectangular surface.
2. Surface tile (1,2) is occupied by an existing item.
3. Tray has a 2x1 footprint; player rotates it 90° making it 1x2.
4. Player attempts to place Tray at (1,1) on the Dresser surface, which would extend the rotated footprint to (1,2).
5. System does not place Tray.
6. System displays that the placement is invalid.

#### 5.6.7 Valid - Place Item on One of Multiple Surfaces
As a player, when I place items on each surface of a multi-surface piece of furniture, each item is placed independently on its respective surface.
1. Stairs are placed in the room. Stairs have two surfaces: a bottom step (2x1) and a top step (2x1).
2. Player places Plant on tile (1,1) of the bottom step surface.
3. System places Plant at (1,1) on the bottom step surface.
4. Player places Plant on tile (1,1) of the top step surface.
5. System places Plant at (1,1) on the top step surface.

### 5.7 Move Items (Edit Session)
Note: Invalid drop cases (occupied tile, outside boundary, rotated footprint) follow the same rules as section 5.4. Confirm and cancel session behaviour is also the same as section 5.4.

Furniture to Test:
- Dresser A (2x2 surface)
- Dresser B (2x2 surface)

Items to Test:
- Plant (1x1 footprint)

Grid to Test:
- 4x4 room

Test Cases:
- Move Plant from Dresser A surface (1,1) to empty Dresser A surface (2,2) -> Plant at (2,2) on Dresser A surface
- Move Plant from Dresser A surface (1,1) to empty room floor tile (3,3) -> Plant at (3,3) on floor
- Move Plant from room floor (1,1) to empty Dresser A surface (1,1) -> Plant at (1,1) on Dresser A surface
- Move Plant from Dresser A surface (1,1) to empty Dresser B surface (1,1) -> Plant at (1,1) on Dresser B surface

#### 5.7.1 Valid - Move Item Within Same Surface
As a player, when I move a Plant to an empty tile on the same surface and confirm, the Plant is at the new position.
1. Dresser A is placed in the room with a 2x2 surface.
2. Plant is at (1,1) on Dresser A surface. Tile (2,2) is empty.
3. Player moves Plant to (2,2) on Dresser A surface.
4. System places Plant at (2,2). Tile (1,1) is now empty.
5. Player confirms the edit session.
6. System commits Plant at (2,2) on Dresser A surface.

#### 5.7.2 Valid - Move Item from Surface to Floor
As a player, when I move a Plant from a Dresser surface to an empty floor tile and confirm, the Plant is on the floor.
1. Dresser A is placed in the room. Plant is at (1,1) on Dresser A surface.
2. Room floor tile (3,3) is empty.
3. Player moves Plant to floor tile (3,3).
4. System places Plant at (3,3) on the room floor. Surface tile (1,1) is now empty.
5. Player confirms the edit session.
6. System commits Plant at (3,3) on the room floor.

#### 5.7.3 Valid - Move Item from Floor to Surface
As a player, when I move a Plant from the room floor to an empty surface tile and confirm, the Plant is on the surface.
1. Dresser A is placed in the room with a 2x2 surface. Surface tile (1,1) is empty.
2. Plant is at (3,3) on the room floor.
3. Player moves Plant to (1,1) on Dresser A surface.
4. System places Plant at (1,1) on Dresser A surface. Floor tile (3,3) is now empty.
5. Player confirms the edit session.
6. System commits Plant at (1,1) on Dresser A surface.

#### 5.7.4 Valid - Move Item Between Two Furniture Surfaces
As a player, when I move a Plant from one Dresser surface to another and confirm, the Plant is on the new surface.
1. Dresser A and Dresser B are both placed in the room, each with a 2x2 surface.
2. Plant is at (1,1) on Dresser A surface. Tile (1,1) on Dresser B surface is empty.
3. Player moves Plant to (1,1) on Dresser B surface.
4. System places Plant at (1,1) on Dresser B surface. Dresser A surface tile (1,1) is now empty.
5. Player confirms the edit session.
6. System commits Plant at (1,1) on Dresser B surface.

### 5.8 Store Items
Items to Test:
- Plant (1x1 footprint)

Test Cases:
- Store Plant from Dresser surface (1,1) -> Plant in inventory items tab, surface tile (1,1) is empty
- Store Plant from room floor (1,1) -> Plant in inventory items tab, floor tile (1,1) is empty

#### 5.8.1 Valid - Store Item from Surface
As a player, when I store a Plant that is placed on a Dresser surface, the Plant is removed from the surface and added to my inventory under the items tab.
1. Dresser is placed in the room. Plant is at (1,1) on the Dresser surface.
2. Player stores Plant.
3. System removes Plant from (1,1) on the Dresser surface. Surface tile (1,1) is now empty.
4. System adds Plant to Player inventory under the items tab.

#### 5.8.2 Valid - Store Item from Floor
As a player, when I store a Plant that is placed on the room floor, the Plant is removed from the floor and added to my inventory under the items tab.
1. Plant is at (1,1) on the room floor.
2. Player stores Plant.
3. System removes Plant from (1,1) on the room floor. Floor tile (1,1) is now empty.
4. System adds Plant to Player inventory under the items tab.

