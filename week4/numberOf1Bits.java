public class Solution {
  public int numSetBits(long a) {
    long ones = 0;

    while(a != 0) {
      ones = ones + (a & 1);
      a = a >>> 1;
    }
    return (int)ones;
  }
}
