// 单链表节点
class ListNode {
    var val: Int
    var next: ListNode?
    
    init(val: Int = 0, next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

// 双链表节点
class DoubleListNode {
    var val: Int = 0
    var next: DoubleListNode?
    var prev: DoubleListNode?

    init(val: Int = 0, next: DoubleListNode? = nil, prev: DoubleListNode? = nil) {
        self.val = val
        self.next = next
        self.prev = prev
    }
}

class Solution {
    // 反转单链表 https://leetcode.cn/problems/reverse-linked-list/description/
    func reverseList(_ head: ListNode?) -> ListNode? {
        // 初始化
        var next: ListNode? = nil
        var prev: ListNode? = nil
        var curr: ListNode? = head

        while curr != nil {
            // 保存下一个节点
            next = curr?.next
            // 反转当前节点
            curr?.next = prev
            // 移动prev
            prev = curr
            // 移动curr
            curr = next
        }

        return prev
    }

    func printList(_ head: ListNode?) { 
        var curr = head
        while curr != nil {
            print(curr!.val)
            curr = curr?.next
        }
    }
}

let solution = Solution()
let head = ListNode(val: 1, next: ListNode(val: 2, next: ListNode(val: 3, next: ListNode(val: 4, next: ListNode(val: 5)))))
solution.printList(head)
let reversedHead = solution.reverseList(head)
solution.printList(reversedHead)