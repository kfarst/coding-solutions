class Solution
    # @param a : string
    # @return an integer
    def isPalindrome(a)
        a = a.gsub(/[^0-9a-z ]/i, '').split.join.downcase
        a == a.reverse ? 1 : 0
    end
end