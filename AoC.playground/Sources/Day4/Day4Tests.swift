import Foundation
import XCTest

public final class Day4Tests: XCTestCase {
    func test_part1() {
        let input = """
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
"""
        let result = Day4.part1(input: input)
        XCTAssertEqual(2, result)
    }
    
    func test_part2() {
        let input = """
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
"""
        let result = Day4.part2(input: input)
        XCTAssertEqual(4, result)
    }
}
