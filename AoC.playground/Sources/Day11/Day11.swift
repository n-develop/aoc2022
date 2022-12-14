import Foundation
import XCTest

public final class Day11Tests: XCTestCase {
    func test_part1() {
        let input = """
Monkey 0:
  Starting items: 79, 98
  Operation: new = old * 19
  Test: divisible by 23
    If true: throw to monkey 2
    If false: throw to monkey 3

Monkey 1:
  Starting items: 54, 65, 75, 74
  Operation: new = old + 6
  Test: divisible by 19
    If true: throw to monkey 2
    If false: throw to monkey 0

Monkey 2:
  Starting items: 79, 60, 97
  Operation: new = old * old
  Test: divisible by 13
    If true: throw to monkey 1
    If false: throw to monkey 3

Monkey 3:
  Starting items: 74
  Operation: new = old + 3
  Test: divisible by 17
    If true: throw to monkey 0
    If false: throw to monkey 1
"""
        
        let day = Day11Part1(input: input)
        let result = day.execute()
        
        XCTAssertEqual(10605, result)
    }
}

class Monkey: CustomStringConvertible {
    var description: String {
        return "Monkey \(id)\n\tItems: \(items)\n\tOperation: \(operation)\n\tTest: \(test)\n\t\tTrue: \(testSuceededMonkey)\n\t\tFalse: \(testFailedMonkey)\n"
    }
    
    let id: Int
    var items: [Int]
    let test: Int
    let testFailedMonkey: Int
    let testSuceededMonkey: Int
    let operation: MonkeyOperation
    
    var totalInspecitons: Int = 0
    
    init(id: Int, items: [Int], test: Int, testFailedMonkey: Int, testSuceededMonkey: Int, operation: MonkeyOperation) {
        self.id = id
        self.items = items
        self.test = test
        self.testFailedMonkey = testFailedMonkey
        self.testSuceededMonkey = testSuceededMonkey
        self.operation = operation
    }
    
    func inspect(_ item: Int) -> Int {
        totalInspecitons += 1
        switch operation {
        case .plus(let value):
            return item + value
        case .multiply(let value):
            return item * value
        case .square:
            return item * item
        }
    }
    
    func testLevel(_ item: Int) -> Int {
        if item % test == 0 {
            return testSuceededMonkey
        }
        return testFailedMonkey
    }
    
    func catchItem(_ item: Int) {
        items.append(item)
    }
    
    func clearItems() {
        items.removeAll()
    }
}

enum MonkeyOperation {
    case plus(value: Int)
    case multiply(value: Int)
    case square
}

class MonkeyParser {
    static func parse(input: String) -> [Monkey] {
        input
            .split(separator: "\n\n")
            .map { monkeyText in
                var properties = String(monkeyText)
                    .split(separator: "\n")
                    .map { String($0) }
                properties[0].removeFirst("Monkey ".count)
                properties[0].removeLast()
                let id = Int(properties[0])!
                properties[1].removeFirst("  Starting items: ".count)
                let items = properties[1].split(separator: ", ").map{ Int($0)! }
                properties[2].removeFirst("  Operation: new = old ".count)
                let operationParts = properties[2].split(separator: " ").map{ String($0) }
                var operation: MonkeyOperation = .square
                if operationParts[0] == "+" {
                    operation = .plus(value: Int(operationParts[1])!)
                } else {
                    if operationParts[1] != "old" {
                        operation = .multiply(value: Int(operationParts[1])!)
                    }
                }
                properties[3].removeFirst("  Test: divisible by ".count)
                let test = Int(properties[3])!
                properties[4].removeFirst("    If true: throw to monkey ".count)
                let testTrue = Int(properties[4])!
                properties[5].removeFirst("    If false: throw to monkey ".count)
                let testFalse = Int(properties[5])!
                
                return Monkey(
                    id: id,
                    items: items,
                    test: test,
                    testFailedMonkey: testFalse,
                    testSuceededMonkey: testTrue,
                    operation: operation
                )
            }
    }
}

public class Day11Part1 {
    private let input: String
    
    public init(input: String) {
        self.input = input
    }
    
    public func execute() -> Int {
        let monkeys = MonkeyParser.parse(input: input)
        print(monkeys)
        for _ in 0..<20 {
            for monkey in monkeys {
                for item in monkey.items {
                    //print("### Monkey \(monkey.id) checks item \(item)")
                    let worryLevel = monkey.inspect(item)
                    //print("after inspection: \(worryLevel)")
                    let reliefLevel = Int(worryLevel / 3)
                    //print("after relief: \(reliefLevel)")
                    let targetMonkey = monkey.testLevel(reliefLevel)
                    //print("throw to Monkey \(targetMonkey)")
                    monkeys[targetMonkey].catchItem(reliefLevel)
                }
                monkey.clearItems()
            }
        }
        let sortedMonkeys = monkeys.sorted { $0.totalInspecitons > $1.totalInspecitons }
        return sortedMonkeys[0].totalInspecitons * sortedMonkeys[1].totalInspecitons
    }
}
