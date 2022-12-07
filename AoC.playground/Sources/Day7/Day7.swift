import Foundation

public class Day7 {
    var totalSize: Int = 0
    var directory: [String:Int] = [:]
    
    let input: String
    
    public init(input: String) {
        self.input = input
        parseDirectories()
    }
    
    func parseDirectories() {
        var path: [String] = []
        let lines = input.split(separator: "\n").map { String($0) }

        for line in lines {
            if line.starts(with: "$ cd") {
                let dirName = line[5..<line.count]
                if dirName == "/" {
                    path.removeAll()
                } else if dirName == ".." {
                    path.removeLast()
                } else {
                    path.append(dirName)
                }
            } else if line.starts(with: /\d+/) {
                let fileInfo = line.split(separator: " ").map{ String($0) }
                let fileSize = Int(fileInfo[0])!
                var filePath = ""
                for dir in path {
                    filePath.append("/\(dir)")
                    if !directory.keys.contains(filePath) {
                        directory[filePath] = fileSize
                    } else {
                        directory[filePath] = directory[filePath]! + fileSize
                    }
                }
                totalSize += fileSize
            }
        }
    }
    
    public func part1() -> Int {
        return directory.filter {
            $0.value <= 100000
        }
        .map { $0.value }
        .reduce(0, +)
    }
    
    public func part2() -> Int {
        let freeSpace = 70000000 - totalSize
        let spaceToCleanUp = 30000000 - freeSpace
        let dirToDelete = directory
            .map { $0.value }
            .sorted()
            .first { $0 >= spaceToCleanUp }
            
        return dirToDelete!
    }
}
