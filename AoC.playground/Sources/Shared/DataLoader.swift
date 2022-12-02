import Foundation

public struct Input {
    public static func load(file: String) throws -> String {
        let fileURL = Bundle.main.url(forResource: file, withExtension: "txt")
        return try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
    }
}
