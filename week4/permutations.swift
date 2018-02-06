import Foundation

class Solution {
  func permute(_ A: inout [Int]) -> [[Int]] {
    var permutations = [[Int]]()

      entry(&A, 0, &permutations)

      return permutations
  }

  fileprivate func entry(_ A: inout [Int], _ swapIndex: Int, _ permutations: inout [[Int]]) {
    for i in swapIndex..<A.count {
      A.swapAt(i, swapIndex)

        entry(&A, swapIndex + 1, &permutations)

        A.swapAt(swapIndex, i)
    }

    if swapIndex == A.count - 1 {
      permutations.append(A)
    }
  }
}
