export function submitCalories({ balance, calories }: { balance: number; calories: number }): { balance: number } {
    return { balance: balance + calories };
}
