struct Employee: Comparable {
    var name: String
    var age: Int
    
    // 实现Comparable协议的静态方法
    static func < (lhs: Employee, rhs: Employee) -> Bool {
        // 首先按年龄比较
        if lhs.age != rhs.age {
            return lhs.age < rhs.age
        }
        // 年龄相同则按姓名比较
        return lhs.name < rhs.name
    }
    
    // 实现Equatable协议的方法
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.age == rhs.age && lhs.name == rhs.name
    }
}

let employee1 = Employee(name: "Alice", age: 30)
let employee2 = Employee(name: "Bob", age: 25)

// 使用比较器进行比较
print(employee1 > employee2) // 输出: true，因为Alice年龄大
print(employee1 == employee2) // 输出: false

var arr = [employee1, employee2]
arr.sort()
print(arr)  