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
  func isSameTree(_ A: TreeNode?, _ B: TreeNode?) -> Int {
    guard A?.val == B?.val else {
      return 0
    }

    guard A != nil && B != nil else {
      return 1
    }

    return isSameTree(A?.left, B?.left) == 1
      && isSameTree(A?.right, B?.right) == 1 ? 1 : 0
  }
}
