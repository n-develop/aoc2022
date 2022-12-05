import Foundation

struct Stack {
    init(_ initialInput: String) {
        initialInput.forEach { character in
            items.append(String(character))
        }
    }
    
    private var items: [String] = []
    
    func peek() -> String? {
        return items.first
    }
    
    mutating func pop() -> String {
        return items.removeFirst()
    }
  
    mutating func push(_ element: String) {
        items.insert(element, at: 0)
    }
}

public struct Day5 {
    private static func getStacks() -> [Stack] {
        var stacks: [Stack] = []
         stacks.append(Stack("PLMNWVBH"))
        stacks.append(Stack("HQM"))
        stacks.append(Stack("LMQFGBDN"))
        stacks.append(Stack("GWMQFTZ"))
        stacks.append(Stack("PHTM"))
        stacks.append(Stack("TGHDJMBC"))
        stacks.append(Stack("RVFBNM"))
        stacks.append(Stack("SGRMHLP"))
        stacks.append(Stack("NCBDP"))
        return stacks
    }
    
    public static func part1(input: String) -> String {
        var stacks = getStacks()
        let lines = input.split(separator: "\n").map { String($0).getNumbers }
        
        for line in lines {
            for _ in 0 ..< line[0] {
                let move = stacks[line[1] - 1].pop()
                stacks[line[2] - 1].push(move)
            }
        }
        
        return stacks.map { stack in
            stack.peek()!
        }
        .joined()
    }
    
    public static func part2(input: String) -> String {
        var stacks = getStacks()
        let lines = input.split(separator: "\n").map { String($0).getNumbers }
        
        for line in lines {
            var tempStack = Stack("")
            for _ in 0 ..< line[0] {
                let move = stacks[line[1] - 1].pop()
                tempStack.push(move)
            }
            for _ in 0 ..< line[0] {
                let move = tempStack.pop()
                stacks[line[2] - 1].push(move)
            }
        }
        
        return stacks.map { stack in
            stack.peek()!
        }
        .joined()
    }
}

extension String {
    var getNumbers: [Int] {
        let numbersInString = self.components(separatedBy: .decimalDigits.inverted).filter { !$0.isEmpty }
        return numbersInString.compactMap { Int($0) }
    }
}
