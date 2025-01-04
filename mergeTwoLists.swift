class ListNode {
    var val: Int
    var next: ListNode?
    init(val: Int = 0, next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        return "\(val)" + (next != nil ? " -> \(next!)" : "")
    }
}

class Solution {
    // 合并两个有序链表 https://leetcode.cn/problems/merge-two-sorted-lists/
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // 处理空链表的情况
        guard let list1 = list1 else { return list2 }
        guard let list2 = list2 else { return list1 }

        // 选择值较小的节点作为合并后的头节点
        let head: ListNode? = list1.val < list2.val ? list1 : list2
        // cur1指向头节点的下一个节点
        var cur1 = head?.next
        // cur2指向未被选为头节点的链表
        var cur2: ListNode? = head === list1 ? list2 : list1
        // prev指向当前处理到的节点
        var prev = head

        // 当两个链表都还有节点时继续合并
        while cur1 != nil && cur2 != nil {
            // 比较两个节点的值，选择较小的节点连接到合并链表中
            if cur1!.val < cur2!.val {
                // cur1的值较小，将prev的next指向cur1
                prev?.next = cur1
                // cur1指向下一个节点
                cur1 = cur1?.next
            } else {
                // cur2的值较小或相等，将prev的next指向cur2
                prev?.next = cur2
                // cur2指向下一个节点
                cur2 = cur2?.next
            }
            // prev指向刚刚连接的节点，准备下一次连接
            prev = prev?.next
        }

        // 收尾的工作：将剩余的节点连接到合并后的链表末尾
        prev?.next = cur1 ?? cur2   

        return head
        
    }
}

let solution = Solution()
let list1 = ListNode(val: 1, next: ListNode(val: 2, next: ListNode(val: 4)))
let list2 = ListNode(val: 1, next: ListNode(val: 3, next: ListNode(val: 4)))
let mergedList = solution.mergeTwoLists(list1, list2)
print(mergedList ?? "nil")