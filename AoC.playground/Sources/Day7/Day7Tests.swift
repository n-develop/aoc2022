import Foundation
import XCTest

public final class Day7Tests: XCTestCase {
    public func test_part1() {
        let input = """
$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
"""
        let day7 = Day7(input: input)
        let result = day7.part1()
        
        XCTAssertEqual(95437, result)
    }
    
    public func test_part2() {
        let input = """
$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
"""
        let day7 = Day7(input: input)
        let result = day7.part2()
        
        XCTAssertEqual(24933642, result)
    }
}
