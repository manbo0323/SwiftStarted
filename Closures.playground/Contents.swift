//: Playground - noun: a place where people can play

import UIKit

// 建立另一個函式，有三個參數依序為
// 型別為 (Int, Int) -> Int 的函式, Int, Int
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult({(number1: Int, number2: Int) -> Int in
    return number1 + number2
}, 12, 85)
// Swift 可以自動推斷其參數及返回值的型別
printMathResult({number1, number2 in return number1 + number2}, 12, 85)
// 單行表達式閉包可以通過隱藏return來隱式回傳單行表達式的結果
printMathResult({number1, number2 in number1 + number2}, 12, 85)
// Swift 自動為閉包提供參數名稱縮寫功能, 對應參數名稱縮寫的型別會通過函式型別自動進行推斷，所以同時in也可以被省略
printMathResult({$0 + $1}, 12, 85)
// Swift 的String型別定義了關於加號+的字串實作，其作為一個函式接受兩個數值，並返回這兩個數值相加的值
printMathResult(+, 12, 85)

// 定義一個函式 參數是一個整數 回傳是一個型別為 () -> Int 的閉包
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    // 用來儲存計數總數的變數
    var runningTotal = 0
    
    // 巢狀函式 簡單的將參數的數字加進計數並返回
    // runningTotal 和 amount 都被捕獲了
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    // 返回捕獲變數參考的巢狀函式
    return incrementer
}

// 宣告一個常數
// 會被指派為一個每次呼叫就會將 runningTotal 加 10 的函式 incrementer
let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())
// 如果另外再宣告一個常數
// 會有屬於它自己的一個全新獨立的 runningTotal 變數參考
// 與上面的常數無關
let incrementBySix = makeIncrementer(forIncrement: 6)
print(incrementBySix())
print(incrementByTen())
print(incrementBySix())
// 指派給另一個常數
let alsoIncrementByTen = incrementByTen
// 仍然是對原本的 runningTotal 操作
print(alsoIncrementByTen()) // 50

// 參數為一個閉包的函式 參數前面標註 @noescape
func someFunctionWithNoescapeClosure(
    closure: () -> Void) {
    // 而這個閉包的生命週期只在這個函式內
    closure()
}

// 宣告一個函式之外的變數 是一個陣列 陣列成員的型別為閉包 () -> Void
var completionHandlers: [() -> Void] = []

// 接著定義一個函式 參數為一個閉包 型別與上面陣列成員的型別一樣
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    // 這個函式將閉包加入一個函式之外的陣列變數中
    completionHandlers.append(completionHandler)
}

// 定義一個類別
class SomeClass {
    var x = 10
    func doSomething() {
        // 使用到前面定義的兩個函式 都使用了尾隨閉包來讓語法更為簡潔
        // 傳入當參數的閉包 內部都是將實體的屬性指派為新的值
        someFunctionWithEscapingClosure { self.x = 100 }
        // 可以看到這個標註 @noescape 的參數的閉包
        // 其內可以隱式的參考 self
        someFunctionWithNoescapeClosure { x = 200 }
    }
}

// 生成一個實體
let instance = SomeClass()
// 呼叫其內的方法
instance.doSomething()
// 接著那兩個前面定義的函式都會被呼叫到 所以最後實體的屬性 x 為 200
print("here : \(instance.x)")

// 首先宣告一個有五個成員的陣列
var customersInLine = ["Albee","Alex","Eddie","Zack","Kevin"]
// 印出：5
print(customersInLine.count)
// 接著宣告一個閉包 會移除掉陣列的第一個成員
let customerProvider = { customersInLine.remove(at: 0) }
// 這時仍然是印出：5
print(customersInLine.count)
// 直到這個閉包被呼叫時 才會執行
// 印出：開始移除 Albee ！
print("開始移除 \(customerProvider()) ！")
// 這時就只剩下 4 個成員了
print(customersInLine.count)
// 這時 customersInLine 為 ["Alex", "Eddie", "Zack", "Kevin"]
// 定義一個閉包作為參數的函式
func serveCustomer(customerProvider: () -> String) {
    // 函式內部會呼叫這個閉包
    print("開始移除 \(customerProvider()) ！")
}

// 呼叫函式時 [移除陣列第一個成員]這個動作被當做閉包的內容
// 閉包被當做參數傳入函式
// 這時才會移除陣列第一個成員
serveCustomer( customerProvider: { customersInLine.remove(at: 0) } )

// 這時 customersInLine 為 ["Eddie", "Zack", "Kevin"]
// 這個函式的參數前面標註了 @autoclosure
// 表示這參數可以是一個自動閉包的簡化寫法
func serveCustomer( customerProvider: @autoclosure () -> String) {
    print("開始移除 \(customerProvider()) ！")
}

// 因為函式的參數有標註 @autoclosure 這個參數可以不用大括號 {}
// 而僅僅只需要[移除第一個成員]這個表達式
// 而這個表達式會返回[被移除的成員的值]
serveCustomer(customerProvider: customersInLine.remove(at: 0))

// 這時 customersInLine 為 ["Zack", "Kevin"]
// 宣告另一個變數 為一個陣列 其內成員的型別為 () -> String
var customerProviders: [() -> String] = []
// 定義一個函式 參數標註 @autoclosure(escaping)
// 表示參數是一個可逃逸自動閉包
func collectCustomerProviders( customerProvider: @autoclosure @escaping () -> String) {
    // 函式內部的動作是將當做參數的這個閉包 再加入新的陣列中
    // 因為可逃逸 所以不會出錯
    customerProviders.append(customerProvider)
}

// 呼叫兩次函式
// 會將 customersInLine 剩餘的兩個成員都移除並轉加入新的陣列中
collectCustomerProviders(customerProvider: customersInLine.remove(at: 0))
collectCustomerProviders(customerProvider: customersInLine.remove(at: 0))

// 印出：獲得了 2 個成員
print("獲得了 \(customerProviders.count) 個成員")
// 最後將這兩個成員也從新陣列中移除
for customerProvider in customerProviders {
    print("開始移除 \(customerProvider()) ！")
}

print(customersInLine.count)