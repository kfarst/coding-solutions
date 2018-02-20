import Foundation

class Solution {
  class TreeGraph {
    var root: Int!
      var adj = [Int: Set<Int>]()
      init(_ input: [Int]) {
        for i in 0 ..< input.count {
          let j = input[i]
            if j == -1 {
              self.root = i
            } else {
              if adj[j] == nil {
                adj[j] = Set<Int>()
              }
              adj[j]!.insert(i)
            }
        }
      }
  }

  func solve(_ A: inout [Int]) -> Int {
    let g = TreeGraph(A)
      return dfs(g, g.root).0 - 1
  }

  func dfs(_ g: TreeGraph, _ root: Int) -> (Int, Int) {
    var maxChild = 0
      var first = 0
      var second = 0
      if let ns = g.adj[root] {
        for n in ns {
          let (childRes, longest) = dfs(g, n)
            maxChild = max(maxChild, childRes)
            if longest > first {
              second = first
                first = longest
            } else if longest > second {
              second = longest
            }
        }
      }

    let result = (max(1 + first + second, maxChild), 1 + first)
      return result
  }
}

