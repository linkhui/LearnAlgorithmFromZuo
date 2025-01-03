import Foundation

func complexityTest() {
    let N = 100000
    print("测试开始")
    // 获取当前时间
    let start = Date()
    // 执行算法
    for i in 1...N {
        for _ in stride(from: i, through: N, by: i) {
            // 这两个嵌套循环的时间复杂度为O(N*logN)
            // 1/2 + 1/2 * 1/3 + 1/2 * 1/3 * 1/4 + ... + 1/2 * 1/3 * 1/4 * ... * 1/N
            // 这个是调和级数，时间复杂度为O(logN)
            // 所以这个算法的时间复杂度为O(N*logN)
        }
    }

    // 获取当前时间
    let end = Date()
    // 计算时间差
    let time = end.timeIntervalSince(start)
    print("测试结束，时间: \(time * 1000)ms")
}

complexityTest()
