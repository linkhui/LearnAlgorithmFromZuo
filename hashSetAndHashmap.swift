//define a hash set
var hashSet = Set<String>()

let str1 = "apple"
let str2 = "apple"

print(str1 == str2)


//add elements to the hash set
hashSet.insert("apple")
hashSet.insert("banana")
hashSet.insert("cherry")

//print the hash set
print(hashSet)
print(hashSet.count)

//check if the hash set contains an element
print(hashSet.contains("apple"))

//remove an element from the hash set
hashSet.remove("banana")
print(hashSet)


// define a hash map
var hashMap = [String: Int]()

//add elements to the hash map
hashMap["apple"] = 1
hashMap["banana"] = 2
hashMap["cherry"] = 3

//print the hash map
print(hashMap)

print(hashMap.count)

//check if the hash map contains a key
print(hashMap.contains(where: { $0.key == "apple" }))

//remove a key-value pair from the hash map
hashMap.removeValue(forKey: "banana")
print(hashMap)

//print the value for a key
print(hashMap["apple"] as Any)

//update the value for a key
hashMap["apple"] = 4
print(hashMap)

//remove all key-value pairs from the hash map
hashMap.removeAll()
print(hashMap)

//iterate over the key-value pairs in the hash map
for (key, value) in hashMap {
    print("Key: \(key), Value: \(value)")
}

//check if the hash map is empty
print(hashMap.isEmpty)


//check if the hash map contains a value
print(hashMap.contains(where: { $0.value == 1 }))

//get the keys and values as arrays
let keys = Array(hashMap.keys)
let values = Array(hashMap.values)
print(keys)
print(values)

// 有序表，类似Java中的TreeMap
var treeMap: [Int: String] = [:]

treeMap[1] = "apple"
treeMap[2] = "banana"
treeMap[3] = "cherry"

// 方案2：创建一个保持插入顺序的有序字典结构
// 这个结构体可以保持插入顺序，并且可以按照插入顺序遍历
// 时间复杂度：O(1)
struct OrderedDictionary<Key: Hashable, Value> {
    private var keys: [Key] = []
    private var dict: [Key: Value] = [:]
    
    mutating func set(_ value: Value, for key: Key) {
        if dict[key] == nil {
            keys.append(key)
        }
        dict[key] = value
    }
    
    func get(_ key: Key) -> Value? {
        return dict[key]
    }
    
    var orderedKeys: [Key] {
        return keys
    }

    func firstKey() -> Key? {
        return keys.first
    }
}

var orderedMap = OrderedDictionary<Int, String>()

orderedMap.set("apple", for: 1)
orderedMap.set("banana", for: 2)
orderedMap.set("cherry", for: 3)

print(orderedMap.orderedKeys)

print(orderedMap.firstKey())
