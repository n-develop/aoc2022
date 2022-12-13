import Foundation
import XCTest

public final class Day10Tests: XCTestCase {
    func test_part1() {
        let input = """
addx 15
addx -11
addx 6
addx -3
addx 5
addx -1
addx -8
addx 13
addx 4
noop
addx -1
addx 5
addx -1
addx 5
addx -1
addx 5
addx -1
addx 5
addx -1
addx -35
addx 1
addx 24
addx -19
addx 1
addx 16
addx -11
noop
noop
addx 21
addx -15
noop
noop
addx -3
addx 9
addx 1
addx -3
addx 8
addx 1
addx 5
noop
noop
noop
noop
noop
addx -36
noop
addx 1
addx 7
noop
noop
noop
addx 2
addx 6
noop
noop
noop
noop
noop
addx 1
noop
noop
addx 7
addx 1
noop
addx -13
addx 13
addx 7
noop
addx 1
addx -33
noop
noop
noop
addx 2
noop
noop
noop
addx 8
noop
addx -1
addx 2
addx 1
noop
addx 17
addx -9
addx 1
addx 1
addx -3
addx 11
noop
noop
addx 1
noop
addx 1
noop
noop
addx -13
addx -19
addx 1
addx 3
addx 26
addx -30
addx 12
addx -1
addx 3
addx 1
noop
noop
noop
addx -9
addx 18
addx 1
addx 2
noop
noop
addx 9
noop
noop
noop
addx -1
addx 2
addx -37
addx 1
addx 3
noop
addx 15
addx -21
addx 22
addx -6
addx 1
noop
addx 2
addx 1
noop
addx -10
noop
noop
addx 20
addx 1
addx 2
addx 2
addx -6
addx -11
noop
noop
noop
"""
        let day = Day10(input: input)
        let result = day.execute()
        
        XCTAssertEqual(result, 13140)
    }
}

enum CpuOperation  {
    case addx(value: Int)
    case noop
}

public class Day10 {
    private let input: String
    
    public init(input: String) {
        self.input = input
    }
    
    private var cycle = 1
    private var signalSum = 0
    private var x = 1
    
    public func execute() -> Int {
        let operations = input
            .split(separator: "\n")
            .map { op in
                let elements = String(op)
                    .split(separator: " ")
                    .map(String.init)
                if elements[0] == "noop" {
                    return CpuOperation.noop
                } else {
                    return CpuOperation.addx(value: Int(elements[1])!)
                }
            }
        
        
        for op in operations {
            doCycle()
            if case .addx(let v) = op {
                doCycle()
                x += v
            }
        }
        
        func doCycle() {
            processCycle()
            cycle += 1
        }
        
        func processCycle() {
            if cycle == 20 || (cycle >= 60 && ((cycle - 20) % 40 == 0)) {
                signalSum += cycle * x
            }
        }
        
        return signalSum
    }
}


public class Day10Part2 {
    private let input: String
    
    public init(input: String) {
        self.input = input
    }
    
    private var cycle = 1
    private var x = 1
    private var linePosition = 0
    
    public func execute() {
        let operations = input
            .split(separator: "\n")
            .map { op in
                let elements = String(op)
                    .split(separator: " ")
                    .map(String.init)
                if elements[0] == "noop" {
                    return CpuOperation.noop
                } else {
                    return CpuOperation.addx(value: Int(elements[1])!)
                }
            }
        
        
        for op in operations {
            doCycle()
            if case .addx(let v) = op {
                doCycle()
                x += v
            }
        }
        
        print("")
    }
    
    func doCycle() {
        processCycle()
        cycle += 1
        linePosition += 1
    }
    
    func processCycle() {
        if (cycle-1) % 40 == 0 {
            print("")
            linePosition = 0
        }
        
        if linePosition > (x + 1) || linePosition < (x - 1) {
            print(".", terminator: "")
        } else {
            print("#", terminator: "")
        }
        
        
    }
}
