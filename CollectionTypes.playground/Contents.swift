//: Playground - noun: a place where people can play

import UIKit

// 宣告儲存 Int 型別的陣列
var arr: Array<Int>
var arr2: [Int]
// 宣告一個型別為 Int 的空陣列
var arr3 = [Int]()
// 為這個陣列加上一個值
arr3.append(12)
// 這時如果又要再將這個陣列指派成空陣列
// 因為前面宣告時已經定義好型別
// 所以可以很簡單的使用 [] 來指派成空陣列
arr3 = []
// 或是首次宣告變數時 有明確定義好型別 也可以使用 []
var anotherArr: [Int] = []
print(anotherArr)

// threeInts 是一種 [Int] 陣列, 等於 [0, 0, 0]
var threeInts = [Int](repeating:0, count: 3)
print(threeInts)

// 首先創建一個 [0,0,0] 的陣列
var secondThreeInts = [Int](repeating: 0, count: 3)
// 接著再創建一個 [2,2,2] 的陣列
var anotherThreeInts = [Int](repeating: 2, count: 3)

// 最後將兩個陣列合併
var SixInts = secondThreeInts + anotherThreeInts
// 會變成 [0,0,0,2,2,2]
print(SixInts)

var shoppingList: [String] = ["Eggs", "Milk"]
// 即創建了一個型別為 [String] 且包含兩個值的陣列
print(shoppingList)
// 因為 Swift 會自動的型別推斷
// 所以陣列中如果明確的表示了是什麼型別的值 便不用再標註型別
var anotherList = ["Rice", "Apples"]
// 因為陣列包含著型別為 String 的值
// Swift 可以推斷這個陣列的型別為 [String]
print(anotherList)
var anotherList2 = [String](repeating: "3", count: 3)
print(anotherList2)

var arr4 = ["Apples", "Eggs", "Milk", "Rice", "Water"]

// 陣列的索引值是由 0 開始計算 所以 arr4[2] 指的是第三個
// 印出：Milk
print(arr4[2])

// 要修改一個索引值對應的值 直接將其指派新的值就可以了
arr4[2] = "Oranges"
// 這時已將 Milk 改成 Oranges 所以會印出：Oranges
print(arr4[2])

// 如果要修改一個區間內的值 可以使用區間寫法修改
print(arr4.count)
arr4[1...4] = ["Milk"]
// 這樣會將原本索引值 1 到 4 的值修改成 Milk
// 所以現在 arr4 會變成 ["Apples", "Milk"]
print(arr4)
print(arr4.count)

var arr5 = ["Apples", "Eggs", "Milk"]
// 印出陣列中的個數：3
print(arr5.count)

// 將陣列指派為空陣列
arr5 = []

if(arr5.isEmpty) {
    print("Empty !")
} else {
    print("Not Empty !")
}

// 使用 append(_:) 方法來加入新的值
var arr6 = ["Apples", "Eggs"]
arr6.append("Milk") // 加入新的值 順序會在最後一個
// 現在 arr6 會變成 ["Apples", "Eggs", "Milk"]
print(arr6)
// 如果要選擇加入的索引值的位置 使用 insert(_:atIndex:) 方法
// arr6.insert(要加入的值, atIndex:要加入的索引值位置)
arr6.insert("Rice" ,at: 0)
// 現在 arr6 會變成 ["Rice" ,"Apples", "Eggs", "Milk"]
// 所有索引值在後面的都會順延往後一個位置
print(arr6)
// 移除一個索引位置的值 使用 removeAtIndex(_:) 方法
arr6.remove(at: 1)
print(arr6)
// 所有後面的值都會遞補向前一個位置
// 現在 arr6 會變成 ["Rice", "Eggs", "Milk"]
// 或者是移除最後一個值 使用 removeLast() 方法
arr6.removeLast()
print(arr6)
// 現在 arr6 會變成 ["Rice", "Eggs"]
var arr7 = ["Rice" ,"Apples", "Eggs", "Milk"]
for item in arr7 {
    print(item)
}

// 當你同時也需要獲得陣列值時 可以使用 enumerate() 方法
for (index, value) in arr7.enumerated() {
    print("Item \(index + 1): \(value)")
}

//創建一個空的 Set
var mySet = Set<Int>()
// 可以在宣告時直接填入值
var anotherSet: Set<String> = ["Rock", "Classical", "Hip hop"]
print(anotherSet.count)
// 指派為一個空 Set, 雖然長得跟陣列使用方法一樣
// 但因為前面已經有明確宣告是 Set, 所以這仍然是 Set<String> 型別
anotherSet = []
// Set 所含的值的數量
// 因為目前是空 Set,印出：0
print(anotherSet.count)
// 使用 isEmpty 檢查 Set 內是否有值
if(anotherSet.isEmpty) {
    print("Empty !")
} else {
    print("Not empty !")
}

var mySet2: Set<String> = ["Rock", "Classical"]
// 使用 insert(_:) 來加入新的值
mySet2.insert("Hip hop")
print(mySet2)
// 目前為 ["Rock", "Classical", "Hip hop"] (無順序)

// 使用 remove(_:) 來移除一個值
// 如果這個值是 mySet2 裡的一個值, 會移除掉這個值並返回此值
// 反之 不存在裡面的話 則是返回 nil
mySet2.remove("Rock")
// 目前為 ["Classical", "Hip hop"] (無順序)
print(mySet2)

// 使用 contains(_:) 來檢查 Set 裡是否包含一個特定的值
if mySet2.contains("Classical") {
    print("Classical is here !")
} else {
    print("Not Here !")
}

// 使用 removeAll() 來移除其內所有的值
mySet2.removeAll()
print(mySet2)

var mySet3: Set<String> = ["Rice" ,"Apples", "Eggs"]
for item in mySet3 {
    print(item)
}

// 因為 Set 沒有順序, 可以使用 sort() 方法來返回一個有序的陣列
for item in mySet3.sorted() {
    print(item)
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
print(evenDigits.sorted(){$1 > $0})

// [] 空 Set 因為兩個 Set 沒有交集
var intersectionSet: Set<Int> = oddDigits.intersection(evenDigits.sorted(){$0 > $1})
print(intersectionSet)
// [1, 2, 9] 因為兩個 Set 都有 3,5,7
// 所以返回兩個 Set 中 除了這三個值以外的值
var exclusiveOrSet: Array<Int> = oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
print(exclusiveOrSet)

// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] 包含兩個 Set 中所有的值
var unionSet: Array<Int> = oddDigits.union(evenDigits).sorted()
print(unionSet)
var unionSet2: Array<Int> = oddDigits.union(singleDigitPrimeNumbers).sorted()
print(unionSet2)

// [1, 9] 因為 3,5,7 在 singleDigitPrimeNumbers 內
// 所以返回 oddDigits 中 除了這三個值之外的值
var subtractSet: Array<Int> = oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
print(subtractSet)
var subtractSet2: Array<Int> = oddDigits.subtracting(evenDigits).sorted()
print(subtractSet2)

let houseAnimals: Set = ["狗", "貓"]
let farmAnimals: Set = ["牛", "雞", "羊", "狗", "貓"]
let cityAnimals: Set = ["鳥", "鼠"]
print(houseAnimals.isSubset(of: farmAnimals))
// 返回 true 因為 farmAnimals 包含 houseAnimals 內所有的值

print(farmAnimals.isSuperset(of: houseAnimals))
// 與上一行意思一樣 只是效果相反 所以也是返回 true

print(farmAnimals.isDisjoint(with: cityAnimals))
// 返回 true 因為 farmAnimals 跟 cityAnimals 沒有交集


// 宣告一個字典型別
var someDict: Dictionary<String, String>
// 或是這樣也可以
var someAnotherDict: [String: String]

// 宣告一個空字典 鍵的型別是 String , 值的型別是 Int
var myDict = [String: Int]()
// 在字典中新增一個值
myDict["one"] = 1
print(myDict)
// 再將字典設為空字典 因為前面已經有型別標註過了 所以使用 [:]
myDict = [:]

// 宣告一個型別為 [String: String] 的字典
var myDict2 = ["TYO": "Tokyo", "DUB": "Dublin"]
// 字典裡值的數量
// 印出：2
print(myDict2.count)

// 檢查字典裡是否有值
if(myDict2.isEmpty) {
    print("Empty !")
} else {
    print("Not empty !")
}

// 如果這個 key 沒有對應到字典裡的值, 就新增一個值
myDict2["LHR"] = "London"
print((myDict2["LHR"] != nil ? myDict2["LHR"]! : ""))
// 如果 key 有對應到字典裡的值, 則是修改這個值
myDict2["LHR"] = "London Heathrow"
print(myDict2["LHR"] ?? nil)
// 如果要移除這個值 則是將其設為 nil
myDict2["LHR"] = nil
print(myDict2["LHR"] ?? nil)

var myDict3 = ["LHR": "London", "DUB": "Dublin"]

// 使用 updateValue(_:forKey:) 更新一個值
// 返回一個對應值的型別的可選值 (這邊就是返回一個 String? )
myDict3.updateValue("London Heathrow", forKey: "LHR")
// 印出：London Heathrow
print(myDict3["LHR"]!)

// 使用 removeValueForKey(_:) 移除一個值
// 返回被刪除的值, 如果沒有對應的值的話則會返回 nil
myDict3.removeValue(forKey: "DUB")
print(myDict3)

var myDict4 = ["LHR": "London", "DUB": "Dublin"]

// 只需要鍵時, 使用 keys 屬性, 取得一個只有鍵的陣列
var someArr1 = [String](myDict4.keys)
print(someArr1.sorted())
// 只需要值時, 使用 values 屬性, 取得一個只有值的陣列
var someArr2 = [String](myDict4.values)
print(someArr2.sorted())

var myDict5 = ["LHR": "London", "DUB": "Dublin"]
for (key, value) in myDict5 {
    print("\(key): \(value)")
}

for key in myDict5.keys {
    print(key)
}

for value in myDict5.values {
    print(value)
}