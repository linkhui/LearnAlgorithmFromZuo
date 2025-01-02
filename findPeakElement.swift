// 寻找峰值元素 https://leetcode.cn/problems/find-peak-element/
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        let n = nums.count

        if n == 1 {
            return 0
        }
        // 边界情况，单独验证0位置和n-1位置
        if nums[0] > nums[1] {
            return 0
        }
        if nums[n - 1] > nums[n - 2] {
            return n - 1
        }
        // 二分搜索
        var left = 1
        var right = n - 2
        while left <= right {
            let mid = left + ((right - left) >> 1)
            if nums[mid] > nums[mid - 1] && nums[mid] > nums[mid + 1] {
                return mid
            }
            if nums[mid] < nums[mid - 1] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return -1
    }
}

let solution = Solution()
let nums = [1,2,1,3,5,6,4]
let result = solution.findPeakElement(nums)
print(result)
