import Foundation

class Solution {
  var n: Int!

    func jump(_ A: inout [Int]) -> Int {
      n = A.count
        if n <= 1 {
          return 0
        }

      var steps = 0
        var maxReachable = 0
        var i = 0
        while i < n {
          let cur = A[i]
            maxReachable = i + cur
            if i == maxReachable {
              return -1
            }

          steps += 1
            if maxReachable >= n - 1 {
              break
            }

          for j in (i + 1 ... i + cur).reversed() {
            if j + A[j] > maxReachable {
              i = j
                maxReachable = j + A[j]
            }
          }
        }
      return steps
    }
}
