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
  var path1: [Int] = [Int]()
    var path2: [Int] = [Int]()

    func lca(_ A: TreeNode?, _ B: inout Int, _ C: inout Int) -> Int {
      if !findPath(A, B, &path1) || !findPath(A, C, &path2) {
        return -1
      }

      var i = 0

        while i < path1.count && i < path2.count {
          if path1[i] != path2[i] {
            break
          }

          i += 1
        }

      return path1[i - 1]
    }

  fileprivate func findPath(_ A: TreeNode?, _ match: Int, _ path: inout [Int]) -> Bool {
    guard A != nil else {
      return false
    }

    path.append(A!.val)

      if A?.val == match {
        return true
      }

    if findPath(A?.left, match, &path) {
      return true
    }

    if findPath(A?.right, match, &path) {
      return true
    }

    path.removeLast()

      return false
  }
}
