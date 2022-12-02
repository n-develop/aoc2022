import Foundation

public struct Day1Code {
    public init() {}
    public func part1() throws -> Int {
        let fileURL = Bundle.main.url(forResource: "Day1Data", withExtension: "txt")
        let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
        let caloriesPerElve = content.split(separator: "\n\n", omittingEmptySubsequences: true)
            .map { snackList in
                snackList.split(separator: "\n").map { snack in
                    Int(String(snack)) ?? 0
                }.reduce(0, +)
            }
        
        return caloriesPerElve.max() ?? 0
    }
    
    public func part2() throws -> Int {
        let fileURL = Bundle.main.url(forResource: "Day1Data", withExtension: "txt")
        let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
        var caloriesPerElve = content.split(separator: "\n\n", omittingEmptySubsequences: true)
            .map { snackList in
                snackList.split(separator: "\n").map { snack in
                    Int(String(snack)) ?? 0
                }.reduce(0, +)
            }
        caloriesPerElve.sort()
                
        return caloriesPerElve.suffix(3).reduce(0, +)
    }
}
