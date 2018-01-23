# Definition for singly-linked list.
# class ListNode
#     attr_accessor :next,:data
#     def initialize(data)
#         @data = data
#         @next=nil
#     end
# end

class Solution
    # @param a : head node of linked list
    # @return an integer
    def lPalin(a)
        fast = a
        slow = a
        stack = []

        while !fast.nil? && !fast.next.nil?
            stack.unshift slow

            fast = fast.next.next
            slow = slow.next
        end

        if !fast.nil?
            slow = slow.next
        end

        while !slow.nil?
            top = stack.shift

            if top.data != slow.data
                return 0
            end

            slow = slow.next
        end

        1
    end
end
