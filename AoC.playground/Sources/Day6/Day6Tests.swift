import Foundation
import XCTest

public final class Day6Tests: XCTestCase {
    func test_part1_1() {
        let input = "bvwbjplbgvbhsrlpgdmjqwftvncz"
        
        let result = Day6.part1(input: input)
        
        XCTAssertEqual(5, result)
    }
    
    func test_part1_2() {
        let input = "nppdvjthqldpwncqszvftbrmjlhg"
        
        let result = Day6.part1(input: input)
        
        XCTAssertEqual(6, result)
    }
    
    func test_part1_3() {
        let input = "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"
        
        let result = Day6.part1(input: input)
        
        XCTAssertEqual(10, result)
    }
    
    func test_part1_4() {
        let input = "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"
        
        let result = Day6.part1(input: input)
        
        XCTAssertEqual(11, result)
    }
    
    func test_part2_1() {
        let input = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
        
        let result = Day6.part2(input: input)
        
        XCTAssertEqual(19, result)
    }
    
    func test_part2_2() {
        let input = "bvwbjplbgvbhsrlpgdmjqwftvncz"
        
        let result = Day6.part2(input: input)
        
        XCTAssertEqual(23, result)
    }
    
    func test_part2_3() {
        let input = "nppdvjthqldpwncqszvftbrmjlhg"
        
        let result = Day6.part2(input: input)
        
        XCTAssertEqual(23, result)
    }
    
    func test_part2_4() {
        let input = "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"
        
        let result = Day6.part2(input: input)
        
        XCTAssertEqual(29, result)
    }
    
    func test_part2_5() {
        let input = "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"
        
        let result = Day6.part2(input: input)
        
        XCTAssertEqual(26, result)
    }
}
