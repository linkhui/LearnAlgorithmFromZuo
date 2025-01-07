// https://leetcode.cn/problems/min-stack/description/
// 155. 最小栈

class MinStack {
    private var stack: [Int]
    private var minStack: [Int]

    init() {
        stack = []
        minStack = []
    }

    func push(_ val: Int) { // 时间复杂度：O(1)
        stack.append(val)
        minStack.append(min(minStack.last ?? Int.max, val))
    }

    func pop() { // 时间复杂度：O(1)
        stack.removeLast()
        minStack.removeLast()
    }

    func top() -> Int { // 时间复杂度：O(1)
        return stack.last!
    }

    func getMin() -> Int { // 时间复杂度：O(1)
        return minStack.last!
    }
}

let minStack = MinStack()
minStack.push(-2)
minStack.push(0)
minStack.push(-3)
minStack.push(5)
print(minStack.getMin()) // 返回 -3
minStack.pop()
print(minStack.top()) // -3
print(minStack.getMin()) // 返回 -3
minStack.pop()
print(minStack.getMin()) // 返回 -2