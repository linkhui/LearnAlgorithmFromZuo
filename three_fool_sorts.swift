// 冒泡排序，冒泡排序的时间复杂度为O(n^2)
func bubbleSort(_ array: inout [Int]) {
    for i in 0..<array.count {
        for j in 0..<array.count - 1 - i {
            if array[j] > array[j + 1] {
                array.swapAt(j, j + 1)
            }
        }
    }
}

var arr = [1, 3, 2, 4, 5]
bubbleSort(&arr)
print(arr)

// 选择排序，选择排序的时间复杂度为O(n^2)
func selectionSort(_ array: inout [Int]) {
    for i in 0..<array.count {
        var minIndex = i
        for j in i+1..<array.count {
            if array[j] < array[minIndex] {
                minIndex = j
            }
        }
        if minIndex != i {
            array.swapAt(i, minIndex)
        }
    }
}

var arr1 = [1, 3, 2, 4, 5]
selectionSort(&arr1)
print(arr1)

// 插入排序，插入排序的时间复杂度为O(n^2)
func insertionSort(_ array: inout [Int]) {
    for i in 1..<array.count {
        // 0到i-1是有序的，将array[i]插入到0到i-1中
        for j in (0..<i).reversed() {
            if array[j] > array[j + 1] {
                array.swapAt(j, j + 1)
            }
        }
    }
}

var arr2 = [1, 3, 2, 4, 5]
insertionSort(&arr2)
print(arr2)
