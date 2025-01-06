// 86. 分隔链表
// https://leetcode.cn/problems/partition-list/description/
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode: CustomStringConvertible {
    var description: String {
        return "\(val)" + (next != nil ? " -> \(next!.description)" : "")
    }
}

class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {

        var leftHead: ListNode? = nil
        var leftTail: ListNode? = nil
        var rightHead: ListNode? = nil
        var rightTail: ListNode? = nil

        var current = head

        while current != nil {
            let next = current!.next
            current!.next = nil

            if current!.val < x {
                if leftHead == nil {
                    leftHead = current
                    leftTail = current
                } else {
                    leftTail!.next = current
                    leftTail = current
                }
            } else {
                if rightHead == nil {
                    rightHead = current
                    rightTail = current
                } else {
                    rightTail!.next = current
                    rightTail = current
                }
            }

            current = next
        }
        
        if leftHead == nil {
            return rightHead
        }

        leftTail!.next = rightHead
        return leftHead
    }
}