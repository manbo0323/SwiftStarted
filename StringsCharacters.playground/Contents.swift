//: Playground - noun: a place where people can play

import UIKit

// 這兩個是一樣的意思
var emptyString = ""
var anotherEmptyString = String()

for character in "Dog!".characters {
    print(character)
}

let str = "Hello"
let secondStr = ", world ."
var anotherStr = str + secondStr
// 印出：Hello, world .
print(anotherStr)

anotherStr += " Have a nice day ."
// 印出：Hello, world . Have a nice day .
print(anotherStr)

let str1 = "Sunday"
var anotherStr1 = "It is \(str1) ."
// 印出：It is Sunday .
print(anotherStr1)

// 表達式也可以
// 印出：I have 13 cars .
print("I have \(1 + 2 * 6) cars .")

// 印出 "Imagination is more important than knowledge" - Einstein
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
print(wiseWords)
let dollarSign = "\u{24}"        // $,  Unicode 純量 U+0024
print(dollarSign)
let blackHeart = "\u{2665}"      // ♥,  Unicode 純量 U+2665
print(blackHeart)

let str2 = "What a lovely day !"
// 印出字元數量：19
print(str2.characters.count)
extension String {
    var length: Int { return characters.count    }  // Swift 2.0
}
print(str2.length)

let str3 = "It is Sunday ."
let str4 = "It is Sunday ."
let str5 = "It is Saturday ."

// 兩個字串相同 所以成立
print("str3 == str4 --> \(str3 == str4)")

// str4 有前綴字串 It is 所以成立
print("str4.hasPrefix(\"It is\") --> \(str4.hasPrefix("It is"))")

// str5 沒有後綴字串 Sunday . 所以不成立
print("str5.hasSuffix(\"Sunday .\") --> \(str5.hasSuffix("Sunday ."))")

