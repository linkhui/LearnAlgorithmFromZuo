// 先进先出队列实现

class Queue {
    private var items: [Int] = []

    func enqueue(_ item: Int) {
        items.append(item)
    }

    func dequeue() -> Int? {
        return items.removeFirst()
    }

    func peek() -> Int? {
        return items.first
    }

    func isEmpty() -> Bool {
        return items.isEmpty
    }

    func size() -> Int {
        return items.count
    }
}

class Stack {
    private var items: [Int] = []

    func push(_ item: Int) {
        items.append(item)
    }

    func pop() -> Int? {
        return items.removeLast()
    }

    func peek() -> Int? {
        return items.last
    }

    func isEmpty() -> Bool {
        return items.isEmpty
    }

    func size() -> Int {
        return items.count
    }
}

// 栈的数组实现
class StackArray {
    private var items: [Int] = []
    private var top: Int = 0

    init(size: Int) {
        items = Array(repeating: 0, count: size)
        top = 0
    }

    func push(_ item: Int) {
        top += 1
        items[top] = item
    }

    func pop() -> Int? {
        if top == 0 {
            return nil
        }
        let item = items[top]
        top -= 1
        return item
    }

    func peek() -> Int? {
        return items[top]
    }

    func isEmpty() -> Bool {
        return top == 0
    }

    func size() -> Int {
        return top
    }
}

// 测试
let queue = Queue()
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
print(queue.peek()!) // 1
print(queue.dequeue()!) // 1
print(queue.dequeue()!) // 2
print(queue.dequeue()!) // 3
print(queue.isEmpty()) // true
print(queue.size()) // 0

let stack = Stack()
stack.push(1)
stack.push(2)
stack.push(3)
print(stack.peek()!) // 3
print(stack.pop()!) // 3
print(stack.pop()!) // 2
print(stack.pop()!) // 1
print(stack.isEmpty()) // true
print(stack.size()) // 0

// 设计循环队列
class MyCircularQueue {

    var queue: [Int]    
    var front: Int
    var rear: Int
    var size: Int

    init(_ k: Int) {
        queue = Array(repeating: 0, count: k)
        front = 0
        rear = 0
        size = 0
    }
    
    func enQueue(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        queue[rear] = value
        rear = (rear + 1) % queue.count
        size += 1
        return true
    }
    
    func deQueue() -> Bool {
        if isEmpty() {
            return false
        }
        front = (front + 1) % queue.count
        size -= 1
        return true
    }
    
    func Front() -> Int {
        if isEmpty() {  
            return -1
        }
        return queue[front]
    }
    
    func Rear() -> Int {
        if isEmpty() {
            return -1
        }
        let index = (rear - 1 + queue.count) % queue.count
        return queue[index]
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func isFull() -> Bool {
        return size == queue.count
    }
}

// 测试
let circularQueue = MyCircularQueue(3)
print(circularQueue.enQueue(1)) // true
print(circularQueue.enQueue(2)) // true
print(circularQueue.enQueue(3)) // true
print(circularQueue.enQueue(4)) // false
print(circularQueue.Rear()) // 3
print(circularQueue.isFull()) // true
print(circularQueue.deQueue()) // true
print(circularQueue.enQueue(4)) // true
print(circularQueue.Rear()) // 4