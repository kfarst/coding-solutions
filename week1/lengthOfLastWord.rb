class Solution
    # @param a : string
    # @return an integer
    def lengthOfLastWord(a)
        a.split(' ').last.to_s.size
    end
end