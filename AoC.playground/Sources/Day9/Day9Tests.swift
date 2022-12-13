import Foundation
import XCTest

public final class Day9Tests: XCTestCase {
    func test_part1() {
        let input = """
R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2
"""
        let day = Day9(input: input)
        
        let result = day.part1()
        
        XCTAssertEqual(13, result)
    }
    
    func test_part2() {
        let input = """
R 5
U 8
L 8
D 3
R 17
D 10
L 25
U 20
"""
        let day = Day9Part2(input: input)
        
        let result = day.execute()
        
        XCTAssertEqual(36, result)
    }
}

