
import UIKit

let array = [7, 2, 6, 3, 9]
var count = 0
func mergeSort(_ array: [Int]) -> [Int] {
    print("count: 💀 \(count)")
    count += 1

    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    print("\n\narra⛔️: \(array)")

    let left = mergeSort(Array(array[0..<middleIndex]))
    let right = mergeSort(Array(array[middleIndex..<array.count]))
    print("left😶: \(left)")
    print("right😶: \(right)")
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [Int] = []
    print("orderedArray🙀: \(orderedArray)")
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        print("👁leftElement: \(leftElement) rightElement:\(rightElement)")

        if leftElement < rightElement {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else {
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    print("orderedArray🙀: \(orderedArray)")
    while leftIndex < left.count {
        print("WHILE LEFT 📛 leftIndex: \(leftIndex) < left.count: \(left.count)    appending: \(left[leftIndex])  to \(orderedArray)")
        orderedArray.append(left[leftIndex])
        leftIndex += 1
        print("WHILE LEFT 📛 leftIndex: \(leftIndex) < left.count: \(left.count)  ")
        print("orderedArray 📛: \(orderedArray)")
    }
    while rightIndex < right.count {
        print("WHILE RIGHT 📛 rightIndex: \(rightIndex) < right.count: \(right.count)    appending: \(right[rightIndex])  to \(orderedArray)")
        orderedArray.append(right[rightIndex])
        rightIndex += 1
        print("WHILE RIGHT 📛 rightIndex: \(rightIndex) < right.count: \(right.count) ")
        print("orderedArray 📛: \(orderedArray)")
    }
    print("FIN 🚀: \(orderedArray)\n")
    return orderedArray
}

mergeSort(array)
