public class Solution {
  public int minimumTotal(ArrayList<ArrayList<Integer>> a) {

    // Finding the row size
    int rows = a.size();

    // Find the minimum sum, using the original array itself
    for (int i = rows - 2; i >= 0; i--) {
      for (int j = 0; j < a.get(i).size(); j++) {
        a.get(i).set(j, a.get(i).get(j) + Math.min(a.get(i + 1).get(j), a.get(i + 1).get(j + 1)));
      }
    }

    // Returning the first place holder
    return a.get(0).get(0);
  }
}
