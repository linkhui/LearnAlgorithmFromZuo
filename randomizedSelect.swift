// 随机选择算法
// 随机选择算法是一种用于在未排序的数组中找到第k小的元素的算法。
// 它通过随机选择一个元素作为枢轴，然后将数组分成两部分，一部分小于枢轴，一部分大于枢轴，然后递归地在其中一部分中寻找第k小的元素。
// 这种方法的时间复杂度为O(n)，空间复杂度为O(1)。
// 它是一种高效的算法，适用于需要快速找到数组中第k小的元素的情况。

/// 在未排序数组中查找第i小的元素
/// - Parameters:
///   - arr: 输入数组（可修改）
///   - p: 数组的起始索引
///   - r: 数组的结束索引
///   - i: 要查找的第i小的元素（i从1开始）
/// - Returns: 第i小的元素值
func randomizedSelect(_ arr: inout [Int], _ p: Int, _ r: Int, _ i: Int) -> Int {
    // 如果区间只包含一个元素，直接返回该元素
    if p == r {
        return arr[p]
    }
    // 随机划分数组，返回枢轴的位置
    let q = randomizedPartition(&arr, p, r)
    // 计算枢轴是第几小的元素
    let k = q - p + 1
    
    if i == k {
        // 如果枢轴正好是要找的第i小的元素，直接返回
        return arr[q]
    } else if i < k {
        // 如果要找的元素比枢轴小，在左半部分继续查找
        return randomizedSelect(&arr, p, q - 1, i)
    } else {
        // 如果要找的元素比枢轴大，在右半部分继续查找
        return randomizedSelect(&arr, q + 1, r, i - k)
    }
}

/// 随机选择一个元素作为枢轴进行划分
/// - Parameters:
///   - arr: 输入数组（可修改）
///   - p: 数组的起始索引
///   - r: 数组的结束索引
/// - Returns: 枢轴的最终位置
func randomizedPartition(_ arr: inout [Int], _ p: Int, _ r: Int) -> Int {
    // 随机选择一个位置作为枢轴
    let i = Int.random(in: p...r)
    // 将枢轴元素交换到数组末尾
    arr.swapAt(i, r)
    // 调用标准的划分函数
    return partition(&arr, p, r)
}

/// 以最后一个元素为枢轴对数组进行划分
/// - Parameters:
///   - arr: 输入数组（可修改）
///   - p: 数组的起始索引
///   - r: 数组的结束索引
/// - Returns: 枢轴的最终位置
func partition(_ arr: inout [Int], _ p: Int, _ r: Int) -> Int {
    // 选择最后一个元素作为枢轴
    let x = arr[r]
    // i用于追踪小于等于枢轴的元素的边界
    var i = p - 1
    
    // 遍历除了枢轴外的所有元素
    for j in p..<r {
        // 如果当前元素小于等于枢轴
        if arr[j] <= x {
            i += 1
            // 将该元素交换到小于等于区域
            arr.swapAt(i, j)
        }
    }
    // 将枢轴放到最终位置
    arr.swapAt(i + 1, r)
    // 返回枢轴的位置
    return i + 1
}

// 初始数组
var arr = [3,2,1,5,6,4]
var k = 5

// 执行随机选择算法
// 每次划分后数组会被部分排序,小于枢轴的元素在左边,大于枢轴的元素在右边
// 例如第一次划分后可能变为: [2, 0, 3, 4, 1, 5, 9, 8, 6, 7]
//                        枢轴为5,左边都小于5,右边都大于5
// 算法会根据k的位置决定是在左半部分还是右半部分继续查找
let result = randomizedSelect(&arr, 0, arr.count - 1, k)

// 输出第k小的元素
// 此时数组并非完全有序,但可以保证第k个位置的元素是正确的第k小元素
print("The \(k)th smallest element is \(result)")


// 如果是求第K大的元素，只需要将k改为arr.count - k + 1即可
k = 2
let kThLargest = randomizedSelect(&arr, 0, arr.count - 1, arr.count - k + 1)
print("The \(k)th largest element is \(kThLargest)")
