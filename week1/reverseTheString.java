public class Solution {
	public String reverseWords(String a) {
	    String[] separatedWords = a.split("\\s");

	    StringBuilder s = new StringBuilder();

	    for (int i = separatedWords.length - 1; i > -1; i--) {
	        s.append(separatedWords[i].trim() + " ");
	    }

	    return s.toString().trim();
	}
}