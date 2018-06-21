//: Playground - noun: a place where people can play

import UIKit

import Foundation
/*
 * Hacker rank input:
 var str1 = readLine()!
 var str2 = readLine()!
 let arr1 = str1.split(separator: " ").map {Int($0)!}
 let arr2 = str2.split(separator: " ").map {Int($0)!}
 */

//let str1 = "61 48"
//let str2 = "431 397 149 275 556 362 852 789 601 357 516 575 670 507 127 888 284 405 806 27 495 879 976 467 342 356 908 750 769 947 425 643 754 396 653 595 108 75 347 394 935 252 683 966 553 724 629 567 93 494 693 965 328 187 728 389 70 288 509 252 449"
let str1 = "5 1"//"5 4"
let str2 = "1 2 3 4 5"
let arr1 = str1.split(separator: " ").map {Int($0)!}
var arr2 = str2.split(separator: " ").map {Int($0)!}

let n = arr1.first! // array size
let d = arr1.last! // shift array by this number
print("n : \(n)")
print("d : \(d)")
print("arr.count : \(arr2.count)")
print("------------------------------\n")

enum Direction {
    case left
    case right
}

func rotateArray(direction: Direction, n: Int, d: Int, arr: [Int]) -> String {
    // Constraints
    if 1 >= n && n >= 1000000 {
        return ""
    }
    if 1 >= d && d >= n {
        return ""
    }
    for el in arr {
        if 1 >= el && el >= 10000000 {
            return ""
        }
    }
    //----------------------------
// //Brutal Force Loop O(n^2)
//    for _ in 1..<d+1 {
//        for j in 0..<arr.count-1 {
//            arr.swapAt(j+1, j)
//        }
//    }
    
    // Elegant 0(n)
    var newArr = [Int].init(repeating: 0, count: arr.count)
    switch direction {
    case .left:
        for j in 0..<arr.count {
            let newLocation:Int = (j + d) % arr.count;
            print("newLocation: \(newLocation)")
            newArr[j] = arr[newLocation];
        }
    case.right:
        for j in 0..<arr.count {
            var coef: Int = (j - d) // Adding this coeficient because '-1 % 5' gives us '-1' in swift, but should be '4'
            if coef < 0 { coef = arr.count + coef }
            let newLocation:Int = coef % arr.count;
            print("newLocation: \(newLocation)")
            newArr[j] = arr[newLocation];
        }
    }

    var outputString = "";
    for i in newArr {
        outputString += "\(i) "
    }
    print("------------------------------")

    print(outputString)
    return outputString
}

rotateArray(direction: .left, n: n, d: d, arr: arr2)

//let z = 4 % 5
//print("modulo:  \(z)")
/*
 first output: 5 1 2 3 4
 
 second:
 input:
 61 48
 431 397 149 275 556 362 852 789 601 357 516 575 670 507 127 888 284 405 806 27 495 879 976 467 342 356 908 750 769 947 425 643 754 396 653 595 108 75 347 394 935 252 683 966 553 724 629 567 93 494 693 965 328 187 728 389 70 288 509 252 449
 output:
 93 494 693 965 328 187 728 389 70 288 509 252 449 431 397 149 275 556 362 852 789 601 357 516 575 670 507 127 888 284 405 806 27 495 879 976 467 342 356 908 750 769 947 425 643 754 396 653 595 108 75 347 394 935 252 683 966 553 724 629 567
 */

/*
 EXPLANATION:
 
 # Initial assignments:
 # array = [1, 2, 3, 4]
 # length_of_array = array.length = 4
 # no_of_left_rotation = k = 2
 # new_arr = Arra.new(length_of_array)
 # new_arr: [nil, nil, nil, nil]
 
 # NOTE:
 # length_of_array.times do |i|
 # is equivalent to
 # for(i = 0; i < length_of_array; i++)
 
 # Algorithm to calculate new index and update new array for each index (i):
 # new_index = (i + no_of_left_rotation) % length_of_array
 # new_arr[i] = array[new_index]
 
 # LOOP1:
 # i = 0
 # new_index = (0 + 2) % 4 = 2
 # new_arr[i = 0] = array[new_index = 2] = 3
 # new_arr: [3, nil, nil, nil]
 
 # LOOP2:
 # i = 1
 # new_index = (1 + 2) % 4 = 3
 # new_arr[i = 1] = array[new_index = 3] = 4
 # new_arr: [3, 4, nil, nil]
 
 # LOOP3:
 # i = 2
 # new_index = (2 + 2) % 4 = 0
 # new_arr[i = 2] = array[new_index = 0] = 1
 # new_arr: [3, 4, 1, nil]
 
 # LOOP4:
 # i = 3
 # new_index = (3 + 2) % 4 = 1
 # new_arr[i = 3] = array[new_index = 1] = 2
 # new_arr: [3, 4, 1, 2]
 
 # After final loop our new roated array is [3, 4, 1, 2]
 # You can return the output:
 # new_arr.join(' ') => 3 4 1 2
 
 */
