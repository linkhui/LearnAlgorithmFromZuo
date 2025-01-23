  // 合并K个有序链表，用堆结构的方法排序
  // 时间复杂度：O(NlogK)
  // 空间复杂度：O(K)
  // https://leetcode.cn/problems/vvXgSW/submissions/594982830/
  // 解题思路：
  // 1. 将所有链表的头节点加入优先队列
  // 2. 从优先队列中取出最小的节点，并将其加入到结果链表中
  // 3. 如果当前节点有下一个节点，则将其加入优先队列
  // 4. 重复步骤2和3，直到优先队列为空

class ListNode {
    var val: Int
    var next: ListNode?

    init(val: Int, next: ListNode?) {
        self.val = val
        self.next = next
    }

    // 打印链表
    func printList() {
        var current: ListNode? = self
        while current != nil {
            print(current!.val, terminator: " -> ")
            current = current!.next
        }
        print("nil")
    }
}

extension ListNode: Comparable {
    static func < (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val < rhs.val
    }
    
    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val
    }
    
}

// 定义一个优先队列
struct PriorityQueue<Element: Comparable> {
    private var elements: [Element] = []

    mutating func enqueue(_ element: Element) {
        elements.append(element)
        elements.sort()
    }

    mutating func dequeue() -> Element? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }

    func isEmpty() -> Bool {
        return elements.isEmpty
    }
}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    // 创建一个优先队列
    var pq = PriorityQueue<ListNode>()

    // 将所有链表的头节点加入优先队列
    for list in lists {
        if let head = list {
            pq.enqueue(head)
        }
    }

    // 创建一个虚拟头节点
    let dummy = ListNode(val: 0, next: nil)
    var current = dummy

    // 从优先队列中取出最小的节点，并将其加入到结果链表中
    while let node = pq.dequeue() {
        current.next = node
        current = node

        // 如果当前节点有下一个节点，则将其加入优先队列
        if let next = node.next {
            pq.enqueue(next)
        }
    }

    return dummy.next
}

// 测试
let list1 = ListNode(val: 1, next: ListNode(val: 4, next: ListNode(val: 5, next: nil)))
let list2 = ListNode(val: 1, next: ListNode(val: 3, next: ListNode(val: 4, next: nil)))
let list3 = ListNode(val: 2, next: ListNode(val: 6, next: nil))

let lists = [list1, list2, list3]
let mergedList = mergeKLists(lists)
mergedList?.printList()