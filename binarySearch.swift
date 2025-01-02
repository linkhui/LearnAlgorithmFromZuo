/**
    二分搜索
    如果数组长度为N，暴力搜索时间复杂度为O(N)
    如果数组长度为N，二分搜索的时间复杂度为O(logN)
    
    1. 算法原理：
	•	二分搜索每次将搜索区间分为两半。
	•	如果目标值不在中间位置，就可以排除一半的数据，仅需在剩余的一半中继续搜索。
	•	这一过程重复进行，直到找到目标值或搜索区间为空。
	2.	计算过程：
	•	假设初始数据量为  n 。
	•	每次迭代后，数据量缩减为原来的一半：
	•	第 1 次迭代：剩余  n/2 。
	•	第 2 次迭代：剩余  n/4 。
	•	第  k  次迭代：剩余  n / 2^k 。
	•	当  n / 2^k = 1  时，停止迭代。
	•	解得  k = \log_2(n) 。

    因此，二分搜索的时间复杂度是 O(log n)。
*/



// 暴力遍历的笨方法
func find(_ array: [Int], _ target: Int) -> Int {
    for i in 0..<array.count {
        if array[i] == target {
            return i
        }
    }
    return -1
}

// 暴力遍历的笨方法查找大于等于target的最小值
func findMin(_ array: [Int], _ target: Int) -> Int {
    for i in 0..<array.count {
        if array[i] >= target {
            return i
        }
    }
    return -1
}

// 暴力遍历的笨方法查找小于等于target的最右位置
func findMax(_ array: [Int], _ target: Int) -> Int {
    var res = -1
    for i in 0..<array.count {
        if array[i] <= target {
            res = i
        }
    }
    return res
}


func binarySearch(_ array: [Int], _ target: Int) -> Int {
    var left = 0
    var right = array.count - 1
    while left <= right {
        //let mid = left + ((right - left) / 2)
        let mid = (left + right) / 2
        if array[mid] == target {
            return mid
        } else if array[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return -1  // Target not found
}


// 寻找大于等于target的最小值
func binarySearchMin(_ array: [Int], _ target: Int) -> Int {
    var left = 0
    var right = array.count - 1
    var res = -1
    while left <= right {
        // 使用位运算计算中间位置
        // 不直接使用 (left + right) / 2 是为了防止溢出
        // 溢出的情况是left和right都很大，相加会溢出，比如left和right都是2^31-1，相加会溢出
        // 所以使用位运算计算中间位置   
        // right - left 得到区间长度
        // >> 1 相当于除以2
        // 最后加上left得到中间位置
        let mid = left + ((right - left) >> 1)
        if array[mid] >= target {
            res = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return res
}

// 寻找小于等于target的最右位置
func binarySearchMax(_ array: [Int], _ target: Int) -> Int {
    var left = 0
    var right = array.count - 1
    var res = -1
    while left <= right {
        let mid = left + ((right - left) >> 1)
        if array[mid] <= target {
            res = mid
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return res
}

// 在有序数组中找小于等于target的最左位置是没有意义的   
// 因为如果数组为空，返回-1
// 如果数组第一个元素大于target，返回-1
// 如果数组第一个元素小于等于target，返回0
// 所以这个函数是用来测试的
func searchLessEqualLeft(_ array: [Int], _ target: Int) -> Int {
    if array.count == 0 {
        return -1
    }
    if array[0] > target {
        return -1
    }
    return 0
}



// 对数器的方法验证
func searchTest() {

    let N = 10
    let V = 1000
    let testTime = 10
    print("测试开始")

    for _ in 0..<testTime {
        let n = Int.random(in: 0..<N)
        var array = Array.init(repeating: 0, count: n)
        for i in 0..<n {
            array[i] = Int.random(in: 0..<V)
        }
        array.sort()

        let target = Int.random(in: 0..<V)
        // 检查是否相等
        if find(array, target) != binarySearch(array, target) {
            print("error")
            print("array: \(array)")
            print("target: \(target)")
            print("find: \(find(array, target))")
            print("binarySearch: \(binarySearch(array, target))")
        }

        let target2 = Int.random(in: 0..<V)
        // 检查是否相等
        if findMin(array, target2) != binarySearchMin(array, target2) {
            print("error")
            print("array: \(array)")
            print("target: \(target)")
            print("findMin: \(findMin(array, target))")
            print("binarySearchMin: \(binarySearchMin(array, target))")
        }

        let target3 = Int.random(in: 0..<V)
        // 检查是否相等
        if findMax(array, target3) != binarySearchMax(array, target3) {
            print("error")
            print("array: \(array)")
            print("target: \(target)")
            print("findMax: \(findMax(array, target))")
            print("binarySearchMax: \(binarySearchMax(array, target))")
        }
    }
    print("测试结束")
}

searchTest()