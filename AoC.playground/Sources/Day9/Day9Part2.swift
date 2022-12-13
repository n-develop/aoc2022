import Foundation

public class Day9Part2 {
    enum Direction  {
        case up(steps: Int)
        case down(steps: Int)
        case left(steps: Int)
        case right(steps: Int)
    }
    
    private let input: String
    
    public init(input: String) {
        self.input = input
        for _ in 0..<9 {
            rope.append(CGPoint(x: 0, y: 0))
        }
        tailPositions.insert("\(rope[8].x),\(rope[8].y)")
    }
    
    private var tailPositions = Set<String>()
    private var head = CGPoint(x: 0, y: 0)
    private var rope: [CGPoint] = []
    
    public func execute() -> Int {
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
                    moveAllKnots()
                    tailPositions.insert("\(rope[8].x),\(rope[8].y)")
                }
            } else if case .down(let steps) = direction {
                for _ in (0..<steps) {
                    head.y -= 1
                    moveAllKnots()
                    tailPositions.insert("\(rope[8].x),\(rope[8].y)")
                }
            } else if case .left(let steps) = direction {
                for _ in (0..<steps) {
                    head.x -= 1
                    moveAllKnots()
                    tailPositions.insert("\(rope[8].x),\(rope[8].y)")
                }
            } else if case .right(let steps) = direction {
                for _ in (0..<steps) {
                    head.x += 1
                    moveAllKnots()
                    tailPositions.insert("\(rope[8].x),\(rope[8].y)")
                }
            }
        }
        return tailPositions.count
    }
    
    func moveAllKnots() {
        var prev = head
        for i in 0..<rope.count {
            if prev.distance(to: rope[i]) > 1 {
                moveTail(prev: prev, knotIndex: i)
            }
            prev = rope[i]
        }
    }
    
    func moveTail(prev: CGPoint, knotIndex: Int) {
        if prev.x == rope[knotIndex].x {
            rope[knotIndex].y = CGFloat(Int((prev.y + rope[knotIndex].y) / 2))
        } else if head.y == rope[knotIndex].y {
            rope[knotIndex].x = CGFloat(Int((prev.x + rope[knotIndex].x) / 2))
        } else {
            if abs(prev.x - rope[knotIndex].x) > abs(prev.y - rope[knotIndex].y) {
                rope[knotIndex].x = CGFloat(Int((prev.x + rope[knotIndex].x) / 2))
                rope[knotIndex].y = prev.y
            } else {
                rope[knotIndex].y = CGFloat(Int((prev.y + rope[knotIndex].y) / 2))
                rope[knotIndex].x = prev.x
            }
        }
    }
}
