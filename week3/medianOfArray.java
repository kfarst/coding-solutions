public class Solution {
  // DO NOT MODIFY BOTH THE LISTS
  public double findMedianSortedArrays(final List<Integer> a, final List<Integer> b) {
    int m = a.size(), n = b.size();
    int l = (m + n + 1) / 2;
    int r = (m + n + 2) / 2;

    return (getkth(a, 0, b, 0, l) + getkth(a, 0, b, 0, r)) / 2.0;
  }

  private double getkth(List<Integer> A, int aStart, List<Integer> B, int bStart, int k) {
    if (aStart > A.size() - 1) return B.get(bStart + k - 1);
    if (bStart > B.size() - 1) return A.get(aStart + k - 1);
    if (k == 1) return Math.min(A.get(aStart), B.get(bStart));

    int aMid = Integer.MAX_VALUE, bMid = Integer.MAX_VALUE;
    if (aStart + k/2 - 1 < A.size()) aMid = A.get(aStart + k/2 - 1);
    if (bStart + k/2 - 1 < B.size()) bMid = B.get(bStart + k/2 - 1);

    if (aMid < bMid)
      return getkth(A, aStart + k/2, B, bStart, k - k/2);
    else
      return getkth(A, aStart, B, bStart + k/2, k - k/2);
  }
}

