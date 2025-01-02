/**
    ## 二进制操作

    负数的二进制表示是正数的补码，
    正数的二进制表示是原码

    负数的二进制转换：
    1. 先求正数的二进制表示
    2. 减1
    3. 取反

    比如-7的二进制表示：
    1. 7的二进制表示：0000 0111
    2. 减1：0000 0110
    3. 取反：1111 1001

    怎么看一个负数的二进制表示：
    1. 先看符号位，符号位为1，表示是负数
    2. 去掉符号位，剩下的数先取反，再加1
    3. 最后把符号位加上

    比如1111 1001的二进制表示：
    1. 先看符号位，符号位为1，表示是负数
    2. 去掉符号位，剩下的数先取反，再加1：1111 1001 -> 0000 0110 -> 0000 0111
    3. 最后把符号位加上：-0000 0111
    4. 所以1111 1001的二进制表示是-7
*/

// 打印一个int类型的二进制表示, 32位, 左侧是高位，右侧是低位
func printSimpleBinary(_ num: Int) {
    for i in (0..<32).reversed() {
        print((num & (1 << i)) != 0 ? 1 : 0, terminator: "")
    }
    print()
}

printSimpleBinary(7)
print("打印7的二进制表示")

// 打印-3的二进制表示
// 负数的二进制表示是正数的补码
// 先打印-1的二进制表示
printSimpleBinary(-7)
print("负数-7的二进制表示是正数7的补码,先减1再取反")

// 定义一个二进制数
let binary = 0b1010
printSimpleBinary(binary)
print(binary)
print("定义一个二进制数")

// binary 取反
printSimpleBinary(~binary)
print(~binary)
print("取反")

// binary 取反后加1
printSimpleBinary(~binary + 1)
print(~binary + 1)
print("取反后加1")

// 相反数 取反后加1
print(~binary + 1)
print("相反数 取反后加1")

// << 左移
printSimpleBinary(binary << 1)
print(binary << 1)
print("<< 左移")

// >> 右移
printSimpleBinary(binary >> 1)
print(binary >> 1)
print(">> 右移")

// 位与
printSimpleBinary(binary & 1)
print(binary & 1)
print("& 位与")

// 位或
printSimpleBinary(binary | 1)
print(binary | 1)
print("| 位或")