public class Solution {
  ArrayList<ArrayList<String>> resultLst;
  ArrayList<String> currLst;

  public ArrayList<ArrayList<String>> partition(String a) {
    resultLst = new ArrayList<ArrayList<String>>();
    currLst = new ArrayList<String>();

    backTrack(a,0);

    return resultLst;
  }

  private void backTrack(String s, int l){
    if(currLst.size()>0
        && l>=s.length()){
      ArrayList<String> r = (ArrayList<String>) currLst.clone();
      resultLst.add(r);
        }

    for(int i=l;i<s.length();i++){
      if(isPalindrome(s,l,i)){
        if(l==i)
          currLst.add(Character.toString(s.charAt(i)));
        else
          currLst.add(s.substring(l,i+1));
        backTrack(s,i+1);
        currLst.remove(currLst.size()-1);
      }
    }
  }

  private boolean isPalindrome(String str, int l, int r){
    if (l==r) return true;

    while(l<r) {
      if(str.charAt(l)!=str.charAt(r)) return false;
      l++;
      r--;
    }

    return true;
  }
}
