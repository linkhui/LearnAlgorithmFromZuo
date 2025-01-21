// 向堆中插入一个新值
func heapInsert(arr: inout [Int], index: Int) {
    var index = index
    while arr[index] > arr[(index - 1) / 2] {
        arr.swapAt(index, (index - 1) / 2)
        index = (index - 1) / 2
    }
}

// 堆化函数，用于维护最大堆性质
func heapify(arr: inout [Int], index: Int, size: Int) {
    // 计算左右子节点的索引
    let left = 2 * index + 1
    let right = 2 * index + 2
    
    // 初始化最大值索引为当前节点
    var largest = index
    
    // 如果左子节点存在且大于当前最大值，更新最大值索引
    if left < size && arr[left] > arr[largest] {
        largest = left
    }
    
    // 如果右子节点存在且大于当前最大值，更新最大值索引 
    if right < size && arr[right] > arr[largest] {
        largest = right
    }
    
    // 如果最大值不是当前节点，则交换位置并递归调整
    if largest != index {
        arr.swapAt(index, largest)
        heapify(arr: &arr, index: largest, size: size)
    } 
}  

// 堆排序函数
func heapSort(arr: inout [Int]) {

    // 构建最大堆
    let n = arr.count
    for i in 0..<n {
        heapInsert(arr: &arr, index: i)
    }

    // 堆排序
    var size = n
    while size > 1 {
        arr.swapAt(0, size - 1)
        size -= 1
        heapify(arr: &arr, index: 0, size: size)
    }
} 

// 堆排序2,从底到上构建最大堆
func heapSort2(arr: inout [Int]) {
    let n = arr.count
    for i in (0..<n).reversed() {
        heapify(arr: &arr, index: i, size: n)
    }

    // 堆排序
    var size = n
    while size > 1 {
        arr.swapAt(0, size - 1)
        size -= 1
        heapify(arr: &arr, index: 0, size: size)
    }
}

var arr = [1, 3, 2, 4, 5]
heapSort(arr: &arr)
print(arr)

arr = [1, 3, 2, 4, 5]
heapSort2(arr: &arr)
print(arr)

