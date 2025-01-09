// 二叉树

// 二叉树的定义
// 二叉树是每个节点最多有两个子树的树结构。
// 通常子树被称作“左子树”（left subtree）和“右子树”（right subtree）。
// 二叉树常被用于实现二叉查找树和二叉堆。

// 二叉树的性质
// 在二叉树的第i层上至多有2^(i-1)个节点。
// 深度为k的二叉树至多有2^k-1个节点。
// 对任何一棵二叉树T，如果其终端节点数为n0，度为2的节点数为n2，则n0=n2+1。

class TreeNode {
    var value: Int
    var left: TreeNode?
    var right: TreeNode?

    init(value: Int) {
        self.value = value
    }
}

// 递归序
// 递归序是指在递归遍历二叉树时，每个节点都会被访问三次：
// 1. 第一次到达该节点时（对应前序位置）
// 2. 访问完左子树后返回到该节点时（对应中序位置）
// 3. 访问完右子树后返回到该节点时（对应后序位置）
// 
// 例如对于节点A：
//     第一次：准备访问A节点时 -> 前序位置
//     第二次：访问完A的左子树返回时 -> 中序位置  
//     第三次：访问完A的右子树返回时 -> 后序位置
//
// 理解递归序对于理解二叉树的前序、中序、后序遍历非常重要：
// - 前序遍历就是在第一次到达节点时打印
// - 中序遍历就是在第二次到达节点时打印
// - 后序遍历就是在第三次到达节点时打印


// 二叉树的遍历
// 二叉树的遍历是指从根节点开始，按照某种顺序访问二叉树中的所有节点。
// 常见的遍历方式有前序遍历、中序遍历和后序遍历。

// 前序遍历
// 前序遍历的顺序是：根节点 -> 左子树 -> 右子树。
// 时间复杂度：O(N)
// 空间复杂度：O(h)：h是树的高度
// 前序遍历的代码如下：
func preOrderTraversal(root: TreeNode?) {
    guard let root = root else { return }
    print(root.value)
    preOrderTraversal(root: root.left)
    preOrderTraversal(root: root.right)
}

// https://leetcode.cn/problems/binary-tree-preorder-traversal/
// 前序遍历的递归实现，返回遍历结果数组
// 参数：
//   - root: 二叉树的根节点
// 返回值：包含按前序遍历顺序的节点值的数组
// 实现思路：
//   1. 如果节点为空，返回空数组
//   2. 否则按照 根节点->左子树->右子树 的顺序:
//      - 将当前节点值放入数组
//      - 递归遍历左子树得到数组
//      - 递归遍历右子树得到数组
//      - 将三个部分拼接返回
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    return [root.value] + preorderTraversal(root.left) + preorderTraversal(root.right)
}

//  https://leetcode.cn/problems/binary-tree-inorder-traversal/
// 中序遍历
// 中序遍历的顺序是：左子树 -> 根节点 -> 右子树。
// 时间复杂度：O(N)
// 空间复杂度：O(h)：h是树的高度
// 中序遍历的代码如下：
func inOrderTraversal(root: TreeNode?) {
    guard let root = root else { return }
    inOrderTraversal(root: root.left)
    print(root.value)
    inOrderTraversal(root: root.right)
}

// https://leetcode.cn/problems/binary-tree-postorder-traversal/submissions/592070722/
// 后序遍历
// 后序遍历的顺序是：左子树 -> 右子树 -> 根节点。
// 时间复杂度：O(N)
// 空间复杂度：O(h)：h是树的高度
// 后序遍历的代码如下：
func postOrderTraversal(root: TreeNode?) {
    guard let root = root else { return }
    postOrderTraversal(root: root.left)
    postOrderTraversal(root: root.right)
    print(root.value)
}


// example
let root = TreeNode(value: 1)
root.left = TreeNode(value: 2)
root.right = TreeNode(value: 3)
root.left?.left = TreeNode(value: 4)
root.left?.right = TreeNode(value: 5)
root.right?.left = TreeNode(value: 6)
root.right?.right = TreeNode(value: 7)

print("前序遍历：")
preOrderTraversal(root: root)
print("中序遍历：")
inOrderTraversal(root: root)
print("后序遍历：")
postOrderTraversal(root: root)

/**
 栈的方式，实现非递归的前序、中序、后序遍历
 */

struct StackStruct<T> {
    private var items: [T] = []

    mutating func push(_ item: T) {
        items.append(item)
    }

    mutating func pop() -> T? {
        return items.removeLast()
    }

    func peek() -> T? {
        return items.last
    }

    func isEmpty() -> Bool {
        return items.isEmpty
    }
}

// 前序遍历
// 时间复杂度：O(N)
// 空间复杂度：O(h)：h是树的高度
func preOrderTraversalStack(root: TreeNode?) {
    guard let root = root else { return }
    var stack = StackStruct<TreeNode>()
    stack.push(root)
    while !stack.isEmpty() {
        let node = stack.pop()
        print(node?.value ?? "nil")
        if let right = node?.right {
            stack.push(right)
        }
        if let left = node?.left {
            stack.push(left)
        }
    }
} 
// 中序遍历
func inOrderTraversalStack(root: TreeNode?) {
    // 如果根节点为空，直接返回
    guard let root = root else { return }
    
    // 创建一个栈来存储节点
    var stack = StackStruct<TreeNode>()
    // 当前遍历到的节点
    var current: TreeNode? = root
    
    // 当栈不为空或当前节点不为空时继续遍历
    while !stack.isEmpty() || current != nil {
        // 如果当前节点不为空
        if current != nil {
            // 将当前节点入栈
            stack.push(current!)
            // 继续遍历左子树
            current = current?.left
        } else {
            // 当前节点为空时，从栈中弹出节点
            current = stack.pop()
            // 打印节点值（中序遍历的访问节点操作）
            print(current?.value ?? "nil")
            // 遍历右子树
            current = current?.right
        }
    }
}  

// 后序遍历
func postOrderTraversalStack(root: TreeNode?) {
    guard let root = root else { return }
    
    // 创建两个栈，一个用于遍历，一个用于存储结果
    var stack1 = StackStruct<TreeNode>()
    var stack2 = StackStruct<TreeNode>()
    
    // 将根节点压入第一个栈
    stack1.push(root)
    
    // 当第一个栈不为空时继续遍历
    while !stack1.isEmpty() {
        // 从第一个栈弹出节点
        if let node = stack1.pop() {
            // 将节点压入第二个栈
            stack2.push(node)
            
            // 先将左子节点压入第一个栈
            if let left = node.left {
                stack1.push(left)
            }
            
            // 再将右子节点压入第一个栈
            if let right = node.right {
                stack1.push(right)
            }
        }
    }
    
    // 从第二个栈中弹出并打印节点，实现后序遍历顺序
    while !stack2.isEmpty() {
        if let node = stack2.pop() {
            print(node.value)
        }
    }
}

// 用一个栈的方法实现后序遍历
func postOrderTraversalStack2(root: TreeNode?) {
    guard let root = root else { return }
    var stack = StackStruct<TreeNode>()
    var current: TreeNode? = root
    var lastVisited: TreeNode? = nil
    
    while !stack.isEmpty() || current != nil {
        // Go all the way left
        while current != nil {
            stack.push(current!)
            current = current?.left
        }
        
        let peekNode = stack.peek()
        
        // If right child exists and hasn't been visited yet, move to right subtree
        if let rightChild = peekNode?.right, lastVisited !== rightChild {
            current = rightChild
        } else {
            // Process current node
            if let node = stack.pop() {
                print(node.value)
                lastVisited = node
            }
        }
    }
}

print("前序遍历，栈实现：")
preOrderTraversalStack(root: root)
print("中序遍历，栈实现：")
inOrderTraversalStack(root: root)
print("后序遍历，栈实现，两个栈：")
postOrderTraversalStack(root: root)
print("后序遍历，栈实现，一个栈：")
postOrderTraversalStack2(root: root)
