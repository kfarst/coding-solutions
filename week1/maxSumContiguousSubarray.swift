import Foundation

class Solution {
	func maxSubArray(_ A: [Int]) -> Int {
        var maxSoFar = 0
        var maxEndingHere = 0

        if let firstVal = A.first {
            maxSoFar = firstVal
        }

        for i in 1..<A.count {
            maxEndingHere = maxEndingHere + A[i]

            if maxSoFar < maxEndingHere {
                maxSoFar = maxEndingHere;
            }

            if maxEndingHere < 0 {
                maxEndingHere = 0
            }
        }

        return maxSoFar
	}
}