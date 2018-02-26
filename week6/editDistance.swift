import Foundation

class Solution {
  func minDistance(_ A: inout String, _ B: inout String) -> Int {
    let word1 = Array(A)
      let word2 = Array(B)
      var dp = [Int]()
      for i in 0 ... word2.count {
        dp.append(i)
      }

    for r in 1 ... word1.count {
      var pre = dp[0]
        dp[0] = r
        for c in 1 ... word2.count {
          let cur = dp[c]
            if word1[r - 1] == word2[c - 1] {
              dp[c] = pre
            } else {
              // replace, delete, insert
              dp[c] = min(pre + 1, min(cur + 1, dp[c - 1] + 1))
            }
          pre = cur
        }
    }

    return dp[word2.count]
  }
}

