import Foundation

public enum Opponent: String {
    case rock = "A"
    case paper = "B"
    case scissor = "C"
    
    func requiredShape(for outcome: Outcome) -> Player {
        switch self {
        case .rock:
            switch outcome {
            case .loss:
                return .scissor
            case .draw:
                return .rock
            case .win:
                return .paper
            }
        case .paper:
            switch outcome {
            case .loss:
                return .rock
            case .draw:
                return .paper
            case .win:
                return .scissor
            }
        case .scissor:
            switch outcome {
            case .loss:
                return .paper
            case .draw:
                return .scissor
            case .win:
                return .rock
            }
        }
    }
}

public enum Outcome: String {
    case loss = "X"
    case draw = "Y"
    case win = "Z"
}

public enum Player: String {
    case rock = "X"
    case paper = "Y"
    case scissor = "Z"
    
    func shapeScore() -> Int {
        switch self {
        case .rock:
            return 1
        case .paper:
            return 2
        case .scissor:
            return 3
        }
    }
    
    func roundScore(opponent: Opponent) -> Int {
        switch self {
        case .rock:
            switch opponent {
            case .rock:
                return 3 + self.shapeScore()
            case .paper:
                return self.shapeScore()
            case .scissor:
                return 6 + self.shapeScore()
            }
        case .paper:
            switch opponent {
            case .rock:
                return 6 + self.shapeScore()
            case .paper:
                return 3 + self.shapeScore()
            case .scissor:
                return self.shapeScore()
            }
        case .scissor:
            switch opponent {
            case .rock:
                return self.shapeScore()
            case .paper:
                return 6 + self.shapeScore()
            case .scissor:
                return 3 + self.shapeScore()
            }
        }
    }
}

public struct Day2 {
    public static func part1() throws -> Int {
        let input = try Input.load(file: "Day2Data")
        let sum = input.split(separator: "\n", omittingEmptySubsequences: true).map { round in
            let game = round.split(separator: " ").map { String($0) }
            let opponent = Opponent(rawValue: game[0])!
            let player = Player(rawValue: game[1])!
            return player.roundScore(opponent: opponent)
        }
            .reduce(0, +)
        
        return sum
    }
    
    public static func part2() throws -> Int {
        let input = try Input.load(file: "Day2Data")
        let sum = input.split(separator: "\n", omittingEmptySubsequences: true).map { round in
            let game = round.split(separator: " ").map { String($0) }
            let opponent = Opponent(rawValue: game[0])!
            let outcome = Outcome(rawValue: game[1])!
            let player = opponent.requiredShape(for: outcome)
            
            return player.roundScore(opponent: opponent)
        }
            .reduce(0, +)
        return sum
    }
}
