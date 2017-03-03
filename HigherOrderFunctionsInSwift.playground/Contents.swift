//: Playground - noun: a place where people can play

import UIKit

//Higher-order functions is Functions that can accept other functions as parameters.

//map
//放入要組成的array的element（回傳的型別不用與原本element的型別同）
//Loops over a collection and applies the same operation to each element in the collection.

let numberArray = [1,2,3,4,5,6,7,8,9,10]

let twoTimesArray1 = numberArray.map { (number: Int) -> Int in
    return number*2
}
print(twoTimesArray1)

let twoTimesArray2 = numberArray.map({$0*2})
print(twoTimesArray2)

let twoTimesArray3 = numberArray.map { (number) -> String in
    return "Q \(number*2)"
}
print(twoTimesArray3)


//filter
//回傳符合條件的結果, 條件為bool(原先array的型別不能改變)
//放入判斷式
//Loops over a collection and returns an array that contains elements that meet a condition.


let greaterThanSevenArray1 = numberArray.filter { (number) -> Bool in
    return number >= 7
}
print(greaterThanSevenArray1)

let greaterThanSevenArray2 = numberArray.filter{$0 >= 7}
print(greaterThanSevenArray2)



//reduce
//將array降一個維度，initial value放入初始值，第一個變數為initial value，第二個變數為array內的element （回傳的型別要與原本element的型別同）
//Combines all items in a collection to create a single value.

let sum1 = numberArray.reduce(0) { (initial, number) -> Int in
    return initial + number
}
print(sum1)

let sum2 = numberArray.reduce(0, {$0 + $1})
print(sum2)

let sum3 = numberArray.reduce(100, +)
print(sum3)

let textArray = ["a", "b", "c"]
let result = textArray.reduce("qqq") { (first, char) -> String in
    return first + char
}
print(result)

let twoDimArray = [[1,2,3],[4,5,6]]
let oneDimArray = twoDimArray.reduce([]) { $0 + $1}
print(oneDimArray)

//FlatMap
//When implemented on sequences : Flattens a collection of collections.
//沒nil版本
//參數為array
let twoArray = [[1,2,[3,7,8]],[4,5,6]]

let flattedTwoArray = twoArray.flatMap{$0}
print(flattedTwoArray)

let flatMappedNumber = numberArray.flatMap {$0}
print(flatMappedNumber)

let mappedNumber = numberArray.map { Array(repeating: $0, count: $0) }
print(mappedNumber)


//element或return有nil版本
//Returns an array containing the non-nil results
let arrayWithNil = ["a","b",nil , "c", nil]
let realStringArray = arrayWithNil.flatMap{$0}
print(realStringArray)

let possibleNumbers = ["1", "2", "three", "///4///", "5"]

let flatMappedPossibleNumbers: [Int] = possibleNumbers.flatMap { str in Int(str) }
print(flatMappedPossibleNumbers)

let mappedPossibleNumbers: [Int?] = possibleNumbers.map { str in Int(str) }
print(mappedPossibleNumbers)

let twoArrayWithNil = [["a"],["b"],nil]
let nonNilArray = twoArrayWithNil.flatMap({$0})
print(nonNilArray) //仍為2維array

//combo

let nonNilArrayOneDim = twoArrayWithNil.flatMap({$0}).flatMap({$0}) //先把nil拿掉，再降維度
print(nonNilArrayOneDim)

let comboResult = twoArray.flatMap{$0}.map{"@@\($0)"}
print(comboResult)
