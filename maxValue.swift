// 用递归的方式求最大值
func maxValue(_ array: [Int]) -> Int {
    return maxValueHelper(array, 0, array.count - 1)
}

func maxValueHelper(_ array: [Int], _ left: Int, _ right: Int) -> Int {
    if left == right {
        return array[left]
    }
    let mid = left + ((right - left) >> 1)
    let leftMax = maxValueHelper(array, left, mid)
    let rightMax = maxValueHelper(array, mid + 1, right)
    return max(leftMax, rightMax)
}

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(maxValue(array))