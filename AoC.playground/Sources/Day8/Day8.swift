import Foundation

public struct Day8 {
    public static func part1(input: String) -> Int {
        
        let rows = input.split(separator: "\n").map { $0 }
        let field = rows.map { $0.map{ c in Int(String(c))! } }
        let rowCount = rows.count
        let colCount = field[0].count
        var numberOfVisibleTree = 0
        for y in 0..<rowCount {
            for x in 0..<field[0].count {
                let tree = field[y][x]
                var visibleTop = true
                var visibleBottom = true
                var visibleLeft = true
                var visibleRight = true
                for ny in 0..<y {
                    if field[ny][x] >= tree {
                        visibleTop = false
                        break
                    }
                }
                for ny in (y+1)..<rowCount {
                    if field[ny][x] >= tree {
                        visibleBottom = false
                        break
                    }
                }
                for nx in 0..<x {
                    if field[y][nx] >= tree {
                        visibleLeft = false
                        break
                    }
                }
                for nx in (x+1)..<colCount {
                    if field[y][nx] >= tree {
                        visibleRight = false
                        break
                    }
                }
                if visibleTop || visibleBottom || visibleLeft || visibleRight {
                    numberOfVisibleTree += 1
                }
            }
        }
        return numberOfVisibleTree
    }
    
    public static func part2(input: String) -> Int {
        let rows = input.split(separator: "\n").map { $0 }
        let field = rows.map { $0.map{ c in Int(String(c))! } }
        let rowCount = rows.count
        let colCount = field[0].count
        var bestScenicScore = 0
        for y in 0..<rowCount {
            for x in 0..<field[0].count {
                let tree = field[y][x]
                var scoreTop = 0
                var scoreBottom = 0
                var scoreLeft = 0
                var scoreRight = 0
                for ny in (0..<y).reversed() {
                    scoreTop += 1
                    if field[ny][x] >= tree {
                        break
                    }
                }
                for ny in (y+1)..<rowCount {
                    scoreBottom += 1
                    if field[ny][x] >= tree {
                        break
                    }
                }
                for nx in (0..<x).reversed() {
                    scoreLeft += 1
                    if field[y][nx] >= tree {
                        break
                    }
                }
                for nx in (x+1)..<colCount {
                    scoreRight += 1
                    if field[y][nx] >= tree {
                        break
                    }
                }
                let totalScore = scoreTop * scoreBottom * scoreRight * scoreLeft
                if totalScore > bestScenicScore {
                    bestScenicScore = totalScore
                }
            }
        }
        return bestScenicScore
    }
}
