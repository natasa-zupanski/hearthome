import { describe, it, expect } from 'vitest';
import { submitCalories } from '../../src/frontend/services/calorieService';

describe('submitCalories', () => {

    // 5.1.1 Valid - Submit calories
    // As a player, when I enter 1 calories burned, I gain and see 1 coins.
    describe('given a player with a balance of 0', () => {
        describe('when the player submits 1 calorie burned', () => {
            it('then the balance becomes 1', () => {
                const result = submitCalories({ balance: 0, calories: 1 });
                expect(result.balance).toBe(1);
            });
        });
    });

    // 5.1.2 Valid - Submit calories - 2nd
    // As a player, when I enter 50 calories burned, I gain and see 50 coins.
    describe('given a player with a balance of 0', () => {
        describe('when the player submits 50 calories burned', () => {
            it('then the balance becomes 50', () => {
                const result = submitCalories({ balance: 0, calories: 50 });
                expect(result.balance).toBe(50);
            });
        });
    });

});
