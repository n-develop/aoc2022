import Foundation

public struct Day6 {
    public static func part1(input: String) -> Int {
        getMarkerPosition(markerLength: 4, input: input)
    }
    
    public static func part2(input: String) -> Int {
        getMarkerPosition(markerLength: 14, input: input)
    }
    
    private static func getMarkerPosition(markerLength: Int, input: String) -> Int {
        for i in 0..<input.count - markerLength {
            let marker = Set(input[i...(i+(markerLength-1))])
            if marker.count == markerLength {
                return i+markerLength
            }
        }
        return 0
    }
}
