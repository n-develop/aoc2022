import Foundation
import XCTest

public final class Day8Tests: XCTestCase {
    func test_part1() {
        let input = """
30373
25512
65332
33549
35390
"""
        
        let result = Day8.part1(input: input)
        
        XCTAssertEqual(21, result)
    }
    
    func test_part2() {
        let input = """
30373
25512
65332
33549
35390
"""
        
        let result = Day8.part2(input: input)
        
        XCTAssertEqual(8, result)
    }
}
