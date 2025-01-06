// https://leetcode.cn/problems/sum-lists-lcci/
// 2. 两数相加 链表求和
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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1  // Create mutable copy
        var l2 = l2  // Create mutable copy
        
        let head = ListNode(0)
        var cur = head
        var carry = 0   

        while l1 != nil || l2 != nil {
            let val1 = l1?.val ?? 0
            let val2 = l2?.val ?? 0
            let sum = val1 + val2 + carry
            carry = sum / 10
            cur.next = ListNode(sum % 10)
            cur = cur.next!
            l1 = l1?.next
            l2 = l2?.next
        }
        if carry > 0 {
            cur.next = ListNode(carry)
        }
        return head.next
    }
}

let l1 = ListNode(2, ListNode(4, ListNode(3)))
let l2 = ListNode(5, ListNode(6, ListNode(4)))
let result = Solution().addTwoNumbers(l1, l2)
print(result ?? "nil")
