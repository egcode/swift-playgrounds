import Foundation

// read the integer n
let n = 3
// read the array
var arr = "3 2 1".components(separatedBy: " ").map{ Int($0)! }
print("Initial array: \(arr)")

var swapsCount = 0
for _ in 0..<n {
    for j in 0..<n-1 {
        if arr[j] > arr[j + 1] {
            arr.swapAt(j, j+1)
            swapsCount += 1
        }
    }
}

var f = 0
var l = 0
if let firstEl = arr.first, let lastEl = arr.last {
    f = firstEl
    l = lastEl
}
print("Array is sorted in \(swapsCount) swaps.")
print("First Element: \(f)")
print("Last Element: \(l)")
print("Sorted Array: \(arr)")
