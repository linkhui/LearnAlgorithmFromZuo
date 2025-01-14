// 归并排序
import Foundation

/**
 * 递归版实现方案1，
 根据master公式，时间复杂度为O(nlogn)，
 T(n) = 2T(n/2) + O(n)
 a = 2, b = 2, d = 1
 log(a, b) = d, 所以时间复杂度为O(n^d * logn) = O(nlogn)
 空间复杂度为O(n)
 */
func mergeSort(_ array: [Int]) -> [Int] {
    if array.count <= 1 {
        return array
    }
    let mid = array.count / 2
    let left = mergeSort(Array(array[0..<mid]))
    let right = mergeSort(Array(array[mid..<array.count]))
    return merge(left, right)
}

// 合并两个有序数组
func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var result = [Int]()
    // 两个指针
    var i = 0, j = 0
    // 遍历两个数组
    while i < left.count && j < right.count {
        // 比较两个数组的元素
        if left[i] < right[j] {
            // 将较小的元素添加到结果数组中
            result.append(left[i])
            // 移动左数组的指针
            i += 1
        } else {
            // 将较小的元素添加到结果数组中
            result.append(right[j])
            // 移动右数组的指针
            j += 1
        }
    }
    // 将剩余的元素添加到结果数组中
    return result + left[i..<left.count] + right[j..<right.count]
}

let array = [1, 3, 2, 4, 5, 6, 7, 8, 9, 10]
print(mergeSort(array))


/**
 * 递归版实现方案2，使用辅助数组，空间复杂度为O(n)，原地排序
 */

// 待排序数组
var staticArray = [1, 3, 2, 4, 5, 6, 7, 8, 9, 10]
// 辅助数组
var temp = [Int](repeating: 0, count: staticArray.count)

func mergeSort2(_ left: Int, _ right: Int) {
    if left >= right {
        return
    }
    let mid = left + ((right - left) >> 1)
    mergeSort2(left, mid)
    mergeSort2(mid + 1, right)
    merge2(left, mid, right)
}

// 合并两个有序数组, 使用辅助数组，空间复杂度为O(n)，原地排序
func merge2(_ left: Int, _ mid: Int, _ right: Int) {
    var i = left, j = mid + 1, k = left
    while i <= mid && j <= right {
        if staticArray[i] < staticArray[j] {
            temp[k] = staticArray[i]
            i += 1
        } else {
            temp[k] = staticArray[j]
            j += 1
        }
        k += 1
    }
    // 将剩余的元素添加到结果数组中
    while i <= mid {
        temp[k] = staticArray[i]
        i += 1
        k += 1
    }
    while j <= right {
        temp[k] = staticArray[j]
        j += 1
        k += 1
    }
    // 将辅助数组中的元素复制到原数组中
    for i in left...right {
        staticArray[i] = temp[i]
    }
}

print("mergeSort2:")
mergeSort2(0, staticArray.count - 1)
print(staticArray)


/**
 * 非递归版实现方案
 * 算法原理：
 1. 将数组分成若干个长度为1的子数组，然后两两合并，直到合并成一个完整的数组
 2. 将数组分成若干个长度为2的子数组，然后两两合并，直到合并成一个完整的数组
 3. 将数组分成若干个长度为4的子数组，然后两两合并，直到合并成一个完整的数组
 4. 重复上述步骤，直到合并成一个完整的数组
 */

// 使用全局变量
// 非递归版实现方案

staticArray = [1, 3, 2, 4, 5, 6, 7, 8, 9, 10]
func mergeSort3() {
    var step = 1 // 步长
    while step < staticArray.count {
        mergePass(step)
        step *= 2
    }
}

// 合并两个有序数组
func mergePass(_ step: Int) {
    var i = 0
    // 处理大小为'step'的子数组对
    while i < staticArray.count - step {
        let left = i // 左数组第一个元素
        let mid = i + step - 1 // 左数组最后一个元素
        let right = min(i + 2 * step - 1, staticArray.count - 1) // 右数组最后一个元素
        merge2(left, mid, right)
        i += 2 * step // 移动到下一个子数组对
    }
}

print("mergeSort3 非递归版:")
print(staticArray)
mergeSort3()
print(staticArray)

/**
 * 非递归归并排序的执行过程示例 (以数组 [1, 3, 2, 4, 5, 6, 7, 8, 9, 10] 为例):
 *
 * 初始状态: [1, 3, 2, 4, 5, 6, 7, 8, 9, 10]
 * 
 * 第一轮 (step = 1): 两两合并长度为1的子数组
 * - 合并 [1] 和 [3] -> [1,3]
 * - 合并 [2] 和 [4] -> [2,4] 
 * - 合并 [5] 和 [6] -> [5,6]
 * - 合并 [7] 和 [8] -> [7,8]
 * - 合并 [9] 和 [10] -> [9,10]
 * 结果: [1,3, 2,4, 5,6, 7,8, 9,10]
 *
 * 第二轮 (step = 2): 两两合并长度为2的子数组
 * - 合并 [1,3] 和 [2,4] -> [1,2,3,4]
 * - 合并 [5,6] 和 [7,8] -> [5,6,7,8]
 * - [9,10] 因无配对数组，保持不变
 * 结果: [1,2,3,4, 5,6,7,8, 9,10]
 *
 * 第三轮 (step = 4): 两两合并长度为4的子数组
 * - 合并 [1,2,3,4] 和 [5,6,7,8] -> [1,2,3,4,5,6,7,8]
 * - [9,10] 因无配对数组，保持不变
 * 结果: [1,2,3,4,5,6,7,8, 9,10]
 *
 * 第四轮 (step = 8): 合并长度为8的子数组
 * - 合并 [1,2,3,4,5,6,7,8] 和 [9,10] 
 * 最终结果: [1,2,3,4,5,6,7,8,9,10]
 *
 * 特点:
 * 1. 每轮步长翻倍(step *= 2)
 * 2. 每轮中，按步长划分子数组，相邻子数组两两合并
 * 3. 最后一组如果元素不足，直接保持原样
 * 4. 当步长大于或等于数组长度时，排序完成

 * 时间复杂度的计算
 * 1. 每轮合并操作的时间复杂度为O(n)
 * 2. 每轮合并操作的次数为n/step，时间复杂度为O(n/step)
 * 3. 总的时间复杂度为O(n * logn)
 */

/**
 * 归并排序比冒泡排序快的原因:
 *
 * 1. 时间复杂度对比:
 *    - 归并排序: O(n * logn)
 *    - 冒泡排序: O(n²)
 *    对于大规模数据,n * logn 远小于 n²
 *
 * 2. 具体原因分析:
 *    - 冒泡排序需要进行n轮比较,每轮比较n-i次(i为轮数),导致大量重复比较
 *    - 归并排序采用分治思想,将问题分解为更小的子问题:
 *      a. 分解过程是对半分,只需logn次就能分解完成
 *      b. 合并过程虽然要遍历所有元素(O(n)),但每个元素只需要比较一次就能找到正确位置
 *      c. 避免了冒泡排序中的重复比较
 *
 * 3. 举例说明:
 *    对于长度为8的数组:
 *    - 冒泡排序需要: 7+6+5+4+3+2+1 = 28次比较
 *    - 归并排序需要: 3轮分解(log₂8=3),每轮8次比较,共24次比较
 *    数据量越大,这种差异越明显
 */
