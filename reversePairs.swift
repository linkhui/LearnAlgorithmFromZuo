// 翻转对数量
// https://leetcode.cn/problems/reverse-pairs/description/

// 归并分治的思想
// 原理
// 1. 思考一个问题在大范围上的答案，是否等于左半部分和右半部分的答案之和+跨越左右两部分的部分的答案
// 2. 跨越左右两部分的部分的答案，如果加上左右各自有序这个设定，则可以利用双指针来计算，带来计算的便利性
// 3. 如果以上两点成立，则可以利用分治的思想，将问题分解为更小的子问题，直到分解到最小范围

func reversePairs(_ nums: [Int]) -> Int {
    helpArray = Array(repeating: Int(0), count: nums.count)
    return count(left: 0, right: nums.count - 1)
}

func count(left: Int, right: Int) -> Int {
    if left == right {
        return 0
    }
    let mid = (left + right) / 2
    return count(left: left, right: mid) + count(left: mid + 1, right: right) + merge(left: left, mid: mid, right: right)
}


var nums = [1, 3, 2, 3, 1]
var helpArray = Array(repeating: Int(0), count: nums.count)


func merge(left: Int, mid: Int, right: Int) -> Int {    
    var i = left
    var j = mid + 1
    var count = 0
    while i <= mid {
        while j <= right && nums[i] > 2 * nums[j] {
            j += 1
        }
        count += j - (mid + 1)
        i += 1
    }


    // 合并两个有序数组
    i = left
    j = mid + 1
    var k = left
    while i <= mid && j <= right {
        if nums[i] < nums[j] {
            helpArray[k] = nums[i]
            i += 1
        } else {
            helpArray[k] = nums[j]
            j += 1
        }
        k += 1
    }
    // 将剩余的元素添加到结果数组中
    while i <= mid {
        helpArray[k] = nums[i]
        i += 1
        k += 1
    }
    while j <= right {
        helpArray[k] = nums[j]
        j += 1
        k += 1
    }
    for i in left...right {
        nums[i] = helpArray[i]
    }

    return count
}

// 测试数据
print(reversePairs(nums)) // 输出: 2