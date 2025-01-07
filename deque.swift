// 双端队列
// 什么是双端队列：
// 双端队列（deque）是一种允许从两端插入和删除元素的队列。
// 双端队列支持从队列的头部和尾部插入和删除元素，因此它比普通队列更加灵活。
// 双端队列的实现通常使用链表或数组来实现。
// 双端队列的常见应用场景包括缓存、任务调度等。

// 双向链表实现
class ListNode {
    var value: Int
    var prev: ListNode?
    var next: ListNode?

    init(value: Int) {
        self.value = value
    }
}

class Deque {
    private var head: ListNode?
    private var tail: ListNode?
    private var size: Int

    init() {
        head = nil
        tail = nil
        size = 0
    }

    func pushFront(_ value: Int) {
        let newNode = ListNode(value: value)
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
            head?.prev = newNode
            head = newNode
        }
    }

    func pushBack(_ value: Int) {
        let newNode = ListNode(value: value)
        if tail == nil {
            head = newNode
            tail = newNode
        } else {
            newNode.prev = tail
            tail?.next = newNode
            tail = newNode
        }
    }

    func popFront() -> Int? {
        guard let _ = head else { return nil }
        let value = head?.value
        head = head?.next
        if head == nil {
            tail = nil
        }
        return value
    }

    func popBack() -> Int? {
        guard let _ = tail else { return nil }
       let value: Int? = tail?.value
        tail = tail?.prev
        if tail == nil {
            head = nil
        }
        return value        

    }



        
}

// Test the deque implementation
let deque = Deque()

// Test pushing elements
deque.pushFront(1)
deque.pushBack(2) 
deque.pushFront(0)
deque.pushBack(3)

// Test popping elements
print(deque.popFront() ?? "Empty") // Should print: 0
print(deque.popBack() ?? "Empty")  // Should print: 3
print(deque.popFront() ?? "Empty") // Should print: 1
print(deque.popBack() ?? "Empty")  // Should print: 2

// Test empty deque
print(deque.popFront() ?? "Empty") // Should print: Empty
print(deque.popBack() ?? "Empty")  // Should print: Empty

// Test pushing after empty
deque.pushFront(5)
deque.pushBack(6)
print(deque.popFront() ?? "Empty") // Should print: 5
print(deque.popBack() ?? "Empty")  // Should print: 6


// 设计循环双端队列
// 循环双端队列（circular deque）是一种允许从两端插入和删除元素的队列，
// 并且当队列满时，新元素会覆盖旧元素。
// 循环双端队列的实现通常使用数组来实现。
// 循环双端队列的常见应用场景包括缓存、任务调度等。


class MyCircularDeque {
    private var capacity: Int
    private var queue: [Int]
    private var front: Int
    private var rear: Int
    private var size: Int

    init(_ k: Int) {
        capacity = k
        queue = Array(repeating: 0, count: k)
        front = 0
        rear = 0
        size = 0
    }
    
    func insertFront(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        queue[front] = value
        front = (front + 1) % capacity
        size += 1
        return true
    }
    
    func insertLast(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        queue[rear] = value
        rear = (rear + 1) % capacity
        size += 1
        return true
    }
    
    func deleteFront() -> Bool {
        if isEmpty() {
            return false
        }
        front = (front + 1) % capacity
        size -= 1
        return true
    }
    
    func deleteLast() -> Bool {
        if isEmpty() {
            return false
        }
        rear = (rear - 1 + capacity) % capacity
        size -= 1
        return true
    }
    
    func getFront() -> Int {
        if isEmpty() {
            return -1
        }
        return queue[(front - 1 + capacity) % capacity]
    }
    
    func getRear() -> Int {
        if isEmpty() {
            return -1
        }
        return queue[(rear - 1 + capacity) % capacity]
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func isFull() -> Bool {
        return size == capacity
    }
} 

// 数组实现双端队列

// 使用数组实现的循环双端队列
// 该实现使用固定大小的数组来存储元素，通过front和rear指针来追踪队列的两端
class MyCircularArrayDeque {
    // 存储队列元素的数组
    var deque: [Int]
    // 指向队列头部的指针
    var front: Int
    // 指向队列尾部的指针
    var rear: Int
    // 当前队列中的元素个数
    var size: Int

    // 初始化指定大小的双端队列
    // - Parameter k: 队列的容量
    init(_ k: Int) {
        deque = Array(repeating: 0, count: k)
        front = 0
        rear = 0
        size = 0
    }
    
    // 检查队列是否已满
    // - Returns: 如果队列已满返回true，否则返回false
    func isFull() -> Bool {
        return size == deque.count
    }

    // 检查队列是否为空
    // - Returns: 如果队列为空返回true，否则返回false
    func isEmpty() -> Bool {
        return size == 0
    }

    // 在队列头部插入元素
    // - Parameter value: 要插入的元素值
    // - Returns: 如果插入成功返回true，队列已满返回false
    func insertFront(_ value: Int) -> Bool {
        if isFull() {
            return false
        }

        // 如果队列为空，直接在首位置插入
        if isEmpty() {
            deque[0] = value
            front = 0
            rear = 0
        } else {
            // 更新front指针，需要考虑循环
            front = front == 0 ? deque.count - 1 : front - 1
            deque[front] = value            
        }
        size += 1
        return true
    }

    // 在队列尾部插入元素
    // - Parameter value: 要插入的元素值
    // - Returns: 如果插入成功返回true，队列已满返回false
    func insertLast(_ value: Int) -> Bool {
        if isFull() {
            return false
        }

        // 如果队列为空，直接在首位置插入
        if isEmpty() {
            deque[0] = value
            front = 0
            rear = 0
        } else {
            // 更新rear指针，需要考虑循环
            rear = rear == deque.count - 1 ? 0 : rear + 1
            deque[rear] = value
        }
        size += 1
        return true
    }

    // 删除队列头部元素
    // - Returns: 如果删除成功返回true，队列为空返回false
    func deleteFront() -> Bool {
        if isEmpty() {
            return false
        }
        // 更新front指针，需要考虑循环
        front = front == deque.count - 1 ? 0 : front + 1
        size -= 1
        return true
    }

    // 删除队列尾部元素
    // - Returns: 如果删除成功返回true，队列为空返回false
    func deleteLast() -> Bool {
        if isEmpty() {
            return false
        }
        // 更新rear指针，需要考虑循环
        rear = rear == 0 ? deque.count - 1 : rear - 1
        size -= 1
        return true
    }

    // 获取队列头部元素
    // - Returns: 如果队列非空返回头部元素，否则返回-1
    func getFront() -> Int {
        return isEmpty() ? -1 : deque[front]
    }

    // 获取队列尾部元素
    // - Returns: 如果队列非空返回尾部元素，否则返回-1
    func getRear() -> Int {
        return isEmpty() ? -1 : deque[rear]
    }

    // 打印整个队列数组，用于调试
    func printDeque() {
        print(deque)
    }

}

let circularArrayDeque = MyCircularArrayDeque(3)
print(circularArrayDeque.insertFront(1))  // true  [1, 0, 0] front=0, rear=0
print(circularArrayDeque.insertLast(2))   // true  [1, 2, 0] front=0, rear=1
print(circularArrayDeque.insertFront(3))  // true  [1, 2, 3] front=2, rear=1
print(circularArrayDeque.insertLast(4))   // false (已满，无法插入)
circularArrayDeque.printDeque()           // [1, 2, 3]
print(circularArrayDeque.deleteFront())   // true  删除3 front=1
print(circularArrayDeque.deleteLast())    // true  删除2 rear=0
print(circularArrayDeque.getFront())      // 1     当前队首元素
print(circularArrayDeque.getRear())       // 1     当前队尾元素