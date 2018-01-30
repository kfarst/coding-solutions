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
    # @param b : integer
    # @return the head node in the linked list
    def removeNthFromEnd(a, b)
        first_node = a
        current_node = a.dup
        offset_node = a.dup

        for i in 0...b
            current_node = current_node.next

            if current_node.nil?
                return first_node.next
            end
        end

        while !current_node.next.nil?
            offset_node = offset_node.next
            current_node = current_node.next
        end

        offset_node.next = offset_node.next.next

        first_node
    end
end
