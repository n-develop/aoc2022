import Foundation

public struct Day4 {
    public static func part1(input: String) -> Int {
        let pairs = input.split(separator: "\n").map{ String($0) }
        var sum = 0
        for pair in pairs {
            let ranges = pair.split(separator: ",")
                .map { elfRange in
                    elfRange.split(separator: "-")
                        .map { number in
                            Int(String(number))
                        }
                }

            let x = ranges[0][1]! ... ranges[0][1]!
            let y = ranges[1][0]! ... ranges[1][1]!
            if x.clamped(to: y) == x || y.clamped(to: x) == y {
                sum += 1
            }
        }
        return sum
    }
    
    public static func part2(input: String) -> Int {
        let pairs = input.split(separator: "\n").map{ String($0) }
        var sum = 0
        for pair in pairs {
            let ranges = pair.split(separator: ",")
                .map { elfRange in
                    elfRange.split(separator: "-")
                        .map { number in
                            Int(String(number))
                        }
                }

            let x = ranges[0][1]! ... ranges[0][1]!
            let y = ranges[1][0]! ... ranges[1][1]!
            if x.overlaps(y) {
                sum += 1
            }
        }
        return sum
    }
}
