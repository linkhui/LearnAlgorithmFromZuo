// 小和问题
// 在一个数组中，每一个数左边比当前数小的数累加起来，叫做这个数组的小和。求一个数组的小和。
// https://www.nowcoder.com/practice/edfe05a1d45c4ea89101d936cac32469
import Foundation

var count = 6
var dataArray:[Int64] = []

// var line = readLine()
// count = Int(line!) ?? 0
// line = readLine()
// dataArray = line?.split(separator: " ").map { Int64($0) ?? 0 } ?? []

var helpArray = Array(repeating: Int64(0), count: count)

// 测试数据
dataArray = [1, 3, 5, 2, 4, 6]

func smallSum(_ left: Int, _ right: Int) -> Int64 {
    if left == right {
        return 0
    }
    let mid = (left + right) / 2
    return smallSum(left, mid) + smallSum(mid + 1, right) + merge(left, mid, right)
}

// 合并两个有序数组，并计算小和
func merge(_ left: Int, _ mid: Int, _ right: Int) -> Int64 {
    var ans = Int64(0)
    var i = left
    var j = mid + 1
    var sum = Int64(0)
    while j <= right {
        while i <= mid && dataArray[i] <= dataArray[j] {
            sum += dataArray[i]
            i += 1
        }
        j += 1
        ans += sum
    }

    i = left
    j = mid + 1
    var k = left
    while i <= mid && j <= right {
        if dataArray[i] < dataArray[j] {
            helpArray[k] = dataArray[i]
            i += 1
        } else {
            helpArray[k] = dataArray[j]
            j += 1
        }
        k += 1
    }
    // 将剩余的元素添加到结果数组中
    while i <= mid {
        helpArray[k] = dataArray[i]
        i += 1
        k += 1
    }
    while j <= right {
        helpArray[k] = dataArray[j]
        j += 1
        k += 1
    }
    // 将辅助数组中的元素复制到原数组中
    for i in left...right {
        dataArray[i] = helpArray[i]
    }
    print(left, mid, right, ans)
    return ans
}

print(smallSum(0, count - 1))