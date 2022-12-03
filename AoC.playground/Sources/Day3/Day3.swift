import Foundation

public struct Day3 {
    private static func getPriority() -> [String: Int] {
        var priority: [String: Int] = [:]

        let startingValueUpper = Int(("A" as UnicodeScalar).value) // 65
        let startingValueLower = Int(("a" as UnicodeScalar).value) //
        for i in 0 ..< 26 {
            priority[String(UnicodeScalar(i + startingValueLower)!)] = i+1
            priority[String(UnicodeScalar(i + startingValueUpper)!)] = i+27
        }
        return priority
    }
    
    public static func part1(input: String) -> Int {
        let priority = getPriority()
        var sum = 0
        let backpacks = input.split(separator: "\n").map{ String($0) }
        for backpack in backpacks {
            let startIndex = backpack.startIndex
            let middleIndex = backpack.index(startIndex, offsetBy: (backpack.count / 2))
            
            let firstCompartment = backpack[startIndex..<middleIndex]
            let secondCompartment = backpack[middleIndex...]
            let wrongItem = firstCompartment.first(where: { secondCompartment.contains($0)})
            sum += priority[String(wrongItem!)]!
        }
        return sum
    }
    
    public static func part2(input: String) -> Int {
        let priority = getPriority()
        let backpacks = input.split(separator: "\n").map{ String($0) }
        let groupCount = backpacks.count / 3
        var sum = 0
        for counter in 0 ..< groupCount {
            let i = counter * 3
            let badge = backpacks[i].first { backpacks[i+1].contains($0) && backpacks[i+2].contains($0) }
            sum += priority[String(badge!)]!
        }
        return sum
    }
}
