//: Playground - noun: a place where people can play

import UIKit

for index in 1...3 {
    print(index)
}

let base = 2
var total = 1
for _ in 1...3 {
    total *= base
}

// 因為循環了三次 所以乘了三次 印出：8
print(total)

let arr = ["Apple", "Book", "Cat"]
for n in arr {
    print(n)
}

let dict = ["Apple":12, "Book":3, "Cat":5]
for (key, value) in dict {
    print("\(key) : \(value)")
}

var n = 2
while(n < 20) {
    n *= 2
}
// 印出：32
print(n)

var m = 512
repeat {
    m *= 2
} while(m < 100)
// 因為不論如何 都會先執行一次程式 所以 m 會先乘一次 2 為 1024
// 接著檢查條件表達式 會返回 false 即結束這個循環
print(m)

let someNumber = 2
if(someNumber == 2) {
    print("It is 2 .")
}

let number = 10
if(number > 20) {
    print ("Number is larger than 20 .")
} else {
    print ("Number is smaller than 20 or equal to 20 .")
}

let number2 = 100
if(number2 < 20) {
    print ("數字小於 20")
} else if(number2 < 200) {
    print ("數字不小於 20，但小於 200")
} else if(number2 < 1000) {
    print ("數字不小於 200，但小於 1000")
} else {
    print ("數字不小於 1000")
}

let number3 = 10
if(number3 > 50) {
    print("number3 > 50")
} else if number3 > 200 {
    print("number3 > 200")
}

// 字串內容是純整數 所以經過轉換後會是一個整數
let str = "123"
if var number = Int(str) {
    print("字串 \"\(str)\" 轉換成一個整數 \(number)")
} else {
    print("字串 \"\(str)\" 不是一個整數")
}

// 如果字串內容不是整數 轉換後會返回 nil
let str2 = "It is a string ."
if let number = Int(str2) {
    print("字串 \"\(str2)\" 轉換成一個整數 \(number)")
} else {
    print("字串 \"\(str2)\" 不是一個整數")
}

let number4 = 2
switch number4 {
case 1, 2, 3:
    print("It is 2 .")
default:
    print("沒有比對到")
}


let number5 = 1200
var str3: String?
switch number5 {
case 0...10:
    str3 = "幾"
case 11...100:
    str3 = "很多"
case 101...1000:
    str3 = "非常多"
default:
    str3 = "超級多"
}

// 因為 120 在 101...1000 這個區間內
// 印出：我有非常多顆蘋果
print("我有\(str3!)顆蘋果")

let somePoint = (0, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) 在原點")
case (_, 0):
    print("(\(somePoint.0), 0) 在 X 軸上")
case (0, _):
    print("(0, \(somePoint.1)) 在 Y 軸上")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) 在方形內")
default:
    print("(\(somePoint.0), \(somePoint.1)) 在方形外")
}

let onePoint = (2, 0)
switch onePoint {
case (let x, 0):
    print("在 X 軸上, x 的值為 \(x)")
case (0, let y):
    print("在 Y 軸上, y 的值為 \(y)")
case let (x, y):
    print("(\(x), \(y)) 不在 X 軸也不在 Y 軸上")
}

let number6 = 20
switch number6 {
case 1...100 where number6 == 50:
    print("在 1...100 區間內 且值為 50")
case 1...100 where number6 == 20:
    print("在 1...100 區間內 且值為 20")
default:
    print("沒有比對到")
}

for n in 1...10 {
    // n 除以 2 的餘數為零時(即 n 為偶數時)
    if n % 2 == 0 {
        // 停止本次循環 重新開始此流程的下個循環
        continue
    }
    print(n)
}
// 因為當 n 為偶數時 都會走到 continue 即立即停止本次循環
// 所以會被依序印出的只有 1, 3, 5, 7, 9

for n in 1...10 {
    // n 大於 2 時
    if(n > 2) {
        // 立即停止這個循環流程
        break
    }
    print(n)
}
// 當迴圈進行到第三圈時 因為 n 為 3 已經大於 2 了
// 即會進到 break 同時立即停止這個循環流程
// 所以這邊只會印出 1, 2

let number7 = 5
var str4 = ""
switch number7 {
case 2,3,5,7,11,13,17,19:
    str4 += "It is a prime number. "
    fallthrough
case 100,200:
    str4 += "Fallthrough once. "
    fallthrough
default:
    str4 += "Fallthrough twice."
}

// 印出：
// It is a prime number. Fallthrough once. Fallthrough twice.
print(str4)
// 雖然只比對到第一個 case 但兩個 case 都有使用 fallthrough
// 加上fallthrough後進入到的下一個case，不會對其條件做比對，而是直接執行其內的程式。
// 所以最後 str4 是將所有字串相加

var number8 = 1
gameLoop:
    while(number8 < 10) {
        switch number8 {
        case 1...4:
            number8 += 1
        case 5:
            number8 *= 10
            // break 標註為 gameLoop 的 while 迴圈
            break gameLoop
        default:
            number8 += 1
        }
    }
// 印出：50
print(number8)
// 在 1...4 區間內時 會將 number8 加 1
// 直到 n==5 時 會乘以 10 並結束 while 循環
// 因為有將 while 加上名為 gameLoop 的標籤
// 所以可以很明白的了解 case 5 中的 break 是要結束 while
// 因此這個 while 其實只循環 5 次即結束


// 建立一個名叫 post() 的函式
// 需要傳入一個型別為 [String: String] 的字典
func post(article: [String: String]) {
    // 首先取得傳入字典中 鍵為 title 的值 並指派給一個常數
    guard let insideTitle = article["title"] else {
        // 如果沒有鍵為 title 的值 這裡面的程式就會被執行
        // 函式中的 return 表示會直接結束這個函式
        print("沒有title")
        return
    }
    
    // 上面的 insideTitle 如果有正確的被指派值 則會繼續進行到這裡
    print("標題是 \(insideTitle) ，")
    
    // 接著取得傳入字典中 鍵為 content 的值 並指派給一個常數
    guard let insideContent = article["content"] else {
        // 如果沒有鍵為 content 的值 這裡面的程式就會被執行
        print("但是沒有內容。")
        return
    }
    
    // 上面的 insideContent 如果有正確的被指派值 則會繼續進行到這裡
    print("內容為 \(insideContent)。")
}

post(article: ["title": "Article_1"])
// 印出：標題是 Article_1 ，
// 印出：但是沒有內容。

post(article: ["title":"Article_2","content":"Article_2_full_content"])
// 印出：標題是 Article_2 ，
// 印出：內容為 Article_2_full_content。

var age = -25
assert(age < 0, "年齡必須大於零")


