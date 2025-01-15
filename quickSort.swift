// 随机快速排序
// 输入：整数数组
// 输出：排序后的数组
func quickSort(_ nums: [Int]) -> [Int] {
    // 基本情况：如果数组长度小于2，直接返回
    if nums.count < 2 {
        return nums
    }

    // 随机选择基准值（pivot）以优化性能
    let pivot = nums[Int.random(in: 0..<nums.count)]
    
    // 创建三个数组来存储：
    var less = [Int]()     // 小于基准值的元素
    var equal = [Int]()    // 等于基准值的元素
    var greater = [Int]()  // 大于基准值的元素

    // 将数组中的每个元素与基准值比较，并分配到对应的数组中
    for num in nums { 
        if num < pivot {
            less.append(num)
        } else if num == pivot {
            equal.append(num)
        } else {
            greater.append(num)
        }
    }

    // 递归排序小于和大于部分，并与等于部分连接
    // 最终返回完整的排序数组
    return quickSort(less) + equal + quickSort(greater)
}

let nums = [3, 6, 8, 10, 1, 2, 1]
print(quickSort(nums))
