//https://leetcode.cn/problems/implement-stack-using-queues/description/
// 225. 用队列实现栈

// 算法，记录队列里元素的个数
// 从尾部入队的时候，将队列里的元素出队，再入队

class MyStack {
    private var queue: [Int]

    init() {
        queue = []
    }

    // push的时候，将队列里的元素出队，再入队
    // 这样，队列的尾部就是栈的顶部
    // 时间复杂度：O(n)
    func push(_ x: Int) {
        let count = queue.count
        queue.append(x)
        for _ in 0..<count {
            queue.append(queue.removeFirst())
        }

        print("queue: \(queue)")
    }

    // pop的时候，直接返回队列的第一个元素
    // 时间复杂度：O(1)
    func pop() -> Int {
        return queue.removeFirst()
    }

    // top的时候，直接返回队列的第一个元素
    // 时间复杂度：O(1)
    func top() -> Int {
        return queue.first!
    }

    // empty的时候，直接返回队列是否为空
    // 时间复杂度：O(1)
    func empty() -> Bool {
        return queue.isEmpty
    }
}

let stack = MyStack()
stack.push(1)
stack.push(2)
stack.push(3)
print(stack.pop())
print(stack.top())
print(stack.empty())
