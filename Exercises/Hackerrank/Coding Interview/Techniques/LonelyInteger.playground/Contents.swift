
//Given array of Integers, find and print the unique element.

/*
 Sample input1:
 3
 1 1 2
 Output1: 2
 */
/*
 Sample input2:
 5
 0 0 1 7 1
 Output2: 7
 */

import Foundation

//var str1 = "3"
//var str2 = "1 1 2"
// Output: 2

var str1 = "5"
var str2 = "0 0 1 7 1"
// Output: 2


let arrCount = Int(str1)!
let arr = str2.split(separator: " ").map {Int($0)!}

func arrToHashTable(arr: [Int]) -> Dictionary<String, Int> {
    var dict = Dictionary<String, Int>()
    for digit in arr {
        if let v = dict["\(digit)"] {
            dict["\(digit)"] = v + 1
        } else {
            dict["\(digit)"] = 1
        }
    }
    return dict
}

func getLonelyDigit(dict: Dictionary<String, Int>) -> String {
    for item in dictOfArr {
        if item.value == 1 {
            return item.key
        }
    }
    return ""
}
var dictOfArr = arrToHashTable(arr: arr)
print("\(getLonelyDigit(dict: dictOfArr))")
