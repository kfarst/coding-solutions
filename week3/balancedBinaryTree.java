/**
 * Definition for binary tree
 * class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) {
 *      val = x;
 *      left=null;
 *      right=null;
 *     }
 * }
 */
public class Solution {
  public int isBalanced(TreeNode A) {
    int heightOfLeft;
    int heightOfRight;

    if (A == null)
      return 1;

    heightOfLeft = height(A.left);
    heightOfRight = height(A.right);

    if (Math.abs(heightOfLeft - heightOfRight) <= 1 && isBalanced(A.left) == 1 && isBalanced(A.right) == 1)
      return 1;

    return 0;
  }

  int height(TreeNode node)
  {
    if (node == null)
      return 0;

    return 1 + Math.max(height(node.left), height(node.right));
  }
}

