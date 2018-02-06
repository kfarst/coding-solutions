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
  public int kthsmallest(TreeNode A, int B) {
    ArrayList<Integer> buffer = new ArrayList<Integer>();
    inorderSearch(A, buffer, B);
    return buffer.get(B-1);
  }

  public void inorderSearch(TreeNode node, ArrayList<Integer> buffer, int k){
    if(buffer.size() >= k)
      return;
    if(node.left != null){
      inorderSearch(node.left, buffer, k);
    }
    buffer.add(node.val);
    if(node.right != null){
      inorderSearch(node.right, buffer, k);
    }
  }
}
