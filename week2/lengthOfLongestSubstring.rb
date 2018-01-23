class Solution
    # @param a : string
    # @return an integer
    def lengthOfLongestSubstring(a)
         letters = {}
         index = 0
         current_count = 0
         highest_count = 0
         chars = a.chars

        while index < a.size
            curr_char = chars[index]

            if !letters[curr_char].nil?
                highest_count = [current_count, highest_count].max

                index = letters[curr_char] + 1
                letters = {}
                current_count = 0
            else
                letters[curr_char] = index
                current_count += 1
                index += 1
            end
        end

        [current_count, highest_count].max
    end
end
