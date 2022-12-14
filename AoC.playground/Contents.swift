import Foundation

func day1() throws {
    print(try Day1.part1())
    print(try Day1.part2())
}

func day2() throws {
    print(try Day2.part1())
    print(try Day2.part2())
}

func day3() throws {
    Day3Tests.defaultTestSuite.run()

    let input = try Input.load(file: "Day3Data")
    print("Day3-1: \(Day3.part1(input: input))")
    print("Day3-2: \(Day3.part2(input: input))")
}

func day4() throws {
    Day4Tests.defaultTestSuite.run()

    let input = try Input.load(file: "Day4Data")
    print("Day4-1: \(Day4.part1(input: input))")
    print("Day4-2: \(Day4.part2(input: input))")
}

func day5() throws {
    let input = try Input.load(file: "Day5Data")
    print(Day5.part1(input: input))
    print(Day5.part2(input: input))
}

func day6() throws {
    Day6Tests.defaultTestSuite.run()
    let input = try Input.load(file: "Day6Data")
    print("Part 1: \(Day6.part1(input: input))")
    print("Part 2: \(Day6.part2(input: input))")
}

func day7() throws {
    Day7Tests.defaultTestSuite.run()
    let input = try Input.load(file: "Day7Data")
    let day7 = Day7(input: input)
    print("Part 1: \(day7.part1())")
    print("Part 2: \(day7.part2())")
}

func day8() throws {
    Day8Tests.defaultTestSuite.run()
    let input = try Input.load(file: "Day8Data")
    print("Part 1: \(Day8.part1(input: input))")
    print("Part 2: \(Day8.part2(input: input))")
}

func day9() throws {
    Day9Tests.defaultTestSuite.run()
    let input = try Input.load(file: "Day9Data")
    let day9 = Day9(input: input)
    print("Part 1: \(day9.part1())")
    let day92 = Day9Part2(input: input)
    print("Part 2: \(day92.execute())")
}

func day10() throws {
    print("\n### Day 10")
    Day10Tests.defaultTestSuite.run()
    let input = try Input.load(file: "Day10Data")
    let day10 = Day10(input: input)
    print("Part 1: \(day10.execute())")
    print("---")
    let day102 = Day10Part2(input: input)
    print("Part 2:")
    day102.execute()
}

func day11() throws {
    print("\n### Day 11")
    Day11Tests.defaultTestSuite.run()
    let input = try Input.load(file: "Day11Data")
    let day = Day11Part1(input: input)
    print("Part 1: \(day.execute())")
}

/*
try day1()
try day2()
try day3()
try day4()
try day5()
try day6()
try day7()
try day8()
try day9()
try day10()
 */
try day11()
