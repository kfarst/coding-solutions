import Foundation

/**
 * Definition for a binary tree node
 *
 * class TreeNode {
 *    var val: Int = 0
 *    var left: TreeNode?
 *    var right: TreeNode?
 * }
 *
 */

class Solution {
  func maxDepth(_ A: TreeNode?) -> Int {
    return getDepth(A, 0)
  }

  fileprivate func getDepth(_ A: TreeNode?, _ depth: Int) -> Int {
    guard A != nil else {
      return depth
    }

    return [getDepth(A?.left, depth + 1), getDepth(A?.right, depth + 1)].max()!
  }
}
