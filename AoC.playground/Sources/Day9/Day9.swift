import Foundation

public class Day9 {
    enum Direction  {
        case up(steps: Int)
        case down(steps: Int)
        case left(steps: Int)
        case right(steps: Int)
    }
    
    private let input: String
    
    public init(input: String) {
        self.input = input
    }
    
    private var tailPositions = Set<String>()
    private var head = CGPoint(x: 0, y: 0)
    private var tail = CGPoint(x: 0, y: 0)
    
    public func part1() -> Int {
        tailPositions.insert("0,0")
        let directions = input
            .split(separator: "\n")
            .map { direction in
                let elements = String(direction)
                    .split(separator: " ")
                    .map(String.init)
                if elements[0] == "U" {
                    return Direction.up(steps: Int(elements[1])!)
                } else if elements[0] == "D" {
                    return Direction.down(steps: Int(elements[1])!)
                } else if elements[0] == "L" {
                    return Direction.left(steps: Int(elements[1])!)
                } else {
                    return Direction.right(steps: Int(elements[1])!)
                }
            }
        
        for direction in directions {
            if case .up(let steps) = direction {
                for _ in (0..<steps) {
                    head.y += 1
                    if head.distance(to: tail) > 1 {
                        moveTail()
                    }
                }
            } else if case .down(let steps) = direction {
                for _ in (0..<steps) {
                    head.y -= 1
                    if head.distance(to: tail) > 1 {
                        moveTail()
                    }
                }
            } else if case .left(let steps) = direction {
                for _ in (0..<steps) {
                    head.x -= 1
                    if head.distance(to: tail) > 1 {
                        moveTail()
                    }
                }
            } else if case .right(let steps) = direction {
                for _ in (0..<steps) {
                    head.x += 1
                    if head.distance(to: tail) > 1 {
                        moveTail()
                    }
                }
            }
        }
        return tailPositions.count
    }
    
    func moveTail() {
        if head.x == tail.x {
            tail.y = (head.y + tail.y) / 2
        } else if head.y == tail.y {
            tail.x = (head.x + tail.x) / 2
        } else {
            if abs(head.x - tail.x) > abs(head.y - tail.y) {
                tail.x = (head.x + tail.x) / 2
                tail.y = head.y
            } else {
                tail.y = (head.y + tail.y) / 2
                tail.x = head.x
            }
        }
        tailPositions.insert("\(tail.x),\(tail.y)")
    }
}

extension CGPoint {
    func distance(to point: CGPoint) -> Int {
        return Int(sqrt(pow(x - point.x, 2) + pow(y - point.y, 2)))
    }
}
