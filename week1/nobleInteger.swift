import Foundation

class Solution {
	func solve(_ A: inout [Int]) -> Int {
        let sortedArray = A.sorted { $0 < $1 }

        for i in 0..<sortedArray.count-1 {
            if sortedArray[i] == sortedArray[i + 1] {
                continue
            }

            if sortedArray[i] == sortedArray.count - i - 1 {
                return 1
            }
        }

        if sortedArray[sortedArray.count - 1] == 0 {
            return 1
        }
        return -1
    }
}
