import Foundation

class Solution {
	func generate(_ A: inout Int) -> [[Int]] {
        var result = [[Int]]()

        for i in 0..<A {
            var row = Array(repeating: 1, count: i + 1)

            if i > 1, let previousRow = result.last {
                for j in 1..<i {
                    row[j] = previousRow[j - 1] + previousRow[j]
                }
            }

            result.append(row)
        }

        return result
	}
}
