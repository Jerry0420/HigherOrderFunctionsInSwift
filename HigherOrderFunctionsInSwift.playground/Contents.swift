//: Playground - noun: a place where people can play

import UIKit

//Higher-order functions is Functions that can accept other functions as parameters.

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
//將array降一個維度，initial value放入初始值，第一個變數為initial value，第二個變數為array內的element （回傳的型別與初始值型別相同，與element的型別無關）
//Combines all items in a collection to create a single value.

let sum1 = numberArray.reduce("666") { (initial, number) -> String in
    return initial + "\(number)"
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

let twoDimIntArray = [[1,2,3],[4,5,6]]
let oneDimIntArray = twoDimIntArray.reduce([]) { $0 + $1}
print(oneDimIntArray)

//FlatMap -> 用於降array維度，回傳 element 有 optional/nil 的 array。
//若要使用於一維array上，必定要使用compactMap
//參數為array
let twoDimAnyArray = [[1,2,[3,7,8]],[4,5,6]]
let flattedTwoArray = twoDimAnyArray.flatMap {$0}
print(flattedTwoArray)

let twoDimIntOptionalArray = [[1,2,3], [2,3,nil]]
let flattenTwoDimArray = twoDimIntOptionalArray.flatMap { $0 }
print(flattenTwoDimArray)

//compactMap -> 不會降維度，用於回傳 element 沒有 optional/nil 的 array
//故若要使用於一維array上，必定要使用compactMap
//Returns an array containing the non-nil results
let oneDimIntArrayWithNil = [1,2,nil , 3, nil]
let realStringArray = oneDimIntArrayWithNil.compactMap {$0}
print(realStringArray)

//compactMap不會降維度
let twoDimStringArrayWithNil = [["a"],["b"],nil]
let nonNilArray = twoDimStringArrayWithNil.compactMap({$0})
print(nonNilArray) //只會將nil的 element拿掉，仍為2維array

//numberArray = [1,2,3,4,5,6,7,8,9,10]
let flatMappedNumber = numberArray.compactMap {$0}
print(flatMappedNumber)

let possibleNumbers = ["1", "2", "three", "///4///", "5"]
let flatMappedPossibleNumbers: [Int] = possibleNumbers.compactMap { str in Int(str) }
print(flatMappedPossibleNumbers)

let mappedPossibleNumbers: [Int?] = possibleNumbers.map { str in Int(str) }
print(mappedPossibleNumbers)

//flatMap V.S. compactMap 比較
let twoDimStringArray1 = [["a"],["b"],[nil, 1]]
let nonNilArray1 = twoDimStringArray1.flatMap({$0})
print(nonNilArray1) //降維

let twoDimStringArray2 = [["a"],["b"],[nil, 1]]
let nonNilArray2 = twoDimStringArray2.compactMap({$0})
print(nonNilArray2) //此[nil]，非為nil element，不會被拿掉


//combo
//twoDimStringArrayWithNil = [["a"],["b"],nil]
let nonNilArrayOneDim = twoDimStringArrayWithNil.compactMap({$0}).flatMap({$0}) //先把nil拿掉，再降維度
print(nonNilArrayOneDim)

//twoArray = [[1,2,[3,7,8]],[4,5,6]]
let comboResult = twoDimAnyArray.flatMap{$0}.map{"@@\($0)"}
print(comboResult)
