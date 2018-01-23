public class Solution {
    public String minWindow(String A, String B) {
        int len1 = A.length();
        int len2 = B.length();

        if (len1 < len2)
        {
            return "";
        }

        int hash_pat[] = new int[256];
        int hash_str[] = new int[256];

        for (int i = 0; i < len2; i++)
            hash_pat[B.charAt(i)]++;

        int start = 0, start_index = -1, min_len = Integer.MAX_VALUE;

        int count = 0;
        for (int j = 0; j < len1 ; j++)
        {
            hash_str[A.charAt(j)]++;

            if (hash_pat[A.charAt(j)] != 0 &&
                hash_str[A.charAt(j)] <= hash_pat[A.charAt(j)] )
                count++;

            if (count == len2)
            {
                while ( hash_str[A.charAt(start)] > hash_pat[A.charAt(start)]
                       || hash_pat[A.charAt(start)] == 0)
                {

                    if (hash_str[A.charAt(start)] > hash_pat[A.charAt(start)])
                        hash_str[A.charAt(start)]--;
                    start++;
                }

                int len_window = j - start + 1;
                if (min_len > len_window)
                {
                    min_len = len_window;
                    start_index = start;
                }
            }
        }

        if (start_index == -1)
        {
           return "";
        }

        return A.substring(start_index, start_index + min_len);
    }
}
