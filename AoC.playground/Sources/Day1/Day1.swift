import Foundation

public struct Day1 {
    public static func part1() throws -> Int {
        let input = try Input.load(file: "Day1Data")
        let caloriesPerElve = input.split(separator: "\n\n", omittingEmptySubsequences: true)
            .map { snackList in
                snackList.split(separator: "\n").map { snack in
                    Int(String(snack)) ?? 0
                }.reduce(0, +)
            }
        
        return caloriesPerElve.max() ?? 0
    }
    
    public static func part2() throws -> Int {
        let input = try Input.load(file: "Day1Data")
        var caloriesPerElve = input.split(separator: "\n\n", omittingEmptySubsequences: true)
            .map { snackList in
                snackList.split(separator: "\n").map { snack in
                    Int(String(snack)) ?? 0
                }.reduce(0, +)
            }
        caloriesPerElve.sort()
                
        return caloriesPerElve.suffix(3).reduce(0, +)
    }
}
