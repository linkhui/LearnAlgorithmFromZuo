//https://leetcode.cn/problems/implement-queue-using-stacks/description/
// 232. 用栈实现队列
// 但从平摊分析的角度来看，所有基本操作（push、pop、peek）的平均时间复杂度都是 O(1)。这是因为每个元素从入队到出队的过程中，最多只会被移动两次（一次进入 inStack，一次转移到 outStack）。

class MyQueue {
    private var inStack: [Int]
    private var outStack: [Int]

    init() {
        inStack = []
        outStack = []
    }
    // 将inStack中的元素转移到outStack中
    // 如果outStack为空，则将inStack中的元素转移到outStack中
    // 如果转移，则将inStack中的全部元素转移到outStack中
    private func inToOut() {
        if outStack.isEmpty {
            while !inStack.isEmpty {
                outStack.append(inStack.removeLast())
            }
        }
        print("inStack: \(inStack), outStack: \(outStack)")
    }

    func push(_ x: Int) {
        inStack.append(x)
        inToOut()
    }

    func pop() -> Int {
        inToOut()
        return outStack.removeLast()
    }

    func peek() -> Int {
        inToOut()
        return outStack.last!
    }

    func empty() -> Bool {
        return inStack.isEmpty && outStack.isEmpty
    }

}

let queue = MyQueue()
queue.push(1)
queue.push(2)
queue.push(3)
queue.push(4)
print(queue.peek())
print(queue.empty())
