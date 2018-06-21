import UIKit

//var count = 0
//
//func quicksort<T: Comparable>(_ a: [T]) -> [T] {
//    guard a.count > 1 else { return a }
//
//    print("\ncount🎃: \(count)")
//    count += 1
//
//    let pivot = a[a.count/2]
//    let less = a.filter { $0 < pivot }
//    let equal = a.filter { $0 == pivot }
//    let greater = a.filter { $0 > pivot }
//    print("arra: \(a)  \nless: \(less) \nequal: \(equal)  \ngreater: \(greater)")
//
//    let fin = quicksort(less) + equal + quicksort(greater)
//    print("fin 🚀: \(fin)\n")
//    return fin
//}
//
//var list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
//quicksort(list)

/*
 a[low...i] contains all values <= pivot
 a[i+1...j-1] contains all values > pivot
 a[j...high-1] are values we haven't looked at yet
 a[high] is the pivot value
 
 [ values <= pivot | values > pivot | not looked at yet | pivot ]
 low           i   i+1        j-1   j          high-1   high
 
 */
////////////////
//func partitionLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
//    let pivot = a[high]
//
//    var i = low
//
//    for j in low..<high {
//        if a[j] <= pivot {
//            (a[i], a[j]) = (a[j], a[i])
//            i += 1
//        }
//    }
//    (a[i], a[high]) = (a[high], a[i])// After the loop is over, the pivot is still the last element in the array. So we swap it with the first element that is greater than the pivot
//    return i
//}
//func quicksortLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
//    if low < high {
//        let p = partitionLomuto(&a, low: low, high: high)
//        quicksortLomuto(&a, low: low, high: p - 1)
//        quicksortLomuto(&a, low: p + 1, high: high)
//    }
//}
//
//
//var list1 = [ 10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8 ]
//quicksortLomuto(&list1, low: 0, high: list1.count - 1)
//print("lomuto Sorted: \(list1)")


/*
 
 */
func partitionHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[low]
    var i = low - 1
    var j = high + 1

    print("\nInit  i: \(i) j: \(j) pivot \(pivot)\n")
    
    while true {
        repeat { j -= 1 } while a[j] > pivot
        repeat { i += 1 } while a[i] < pivot

        if i < j {
            print("i < j:  \(i) < \(j)")
            print("swap  \(a[i])  \(a[j])\n")
            a.swapAt(i, j)
        } else {
            print("FIN🚀: \(j)  a: \(a)")
            return j
        }
    }
}
func quicksortHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let p = partitionHoare(&a, low: low, high: high)
        quicksortHoare(&a, low: low, high: p)
        quicksortHoare(&a, low: p + 1, high: high)
    }
}
//var list2 = [ 8, 0, 3, 9, 2, 14, 10, 27, 1, 5, 8, -1, 26 ]
var list2 = [ 8, 22, 8, 5, 11, 6, 19 ]

quicksortHoare(&list2, low: 0, high: list2.count - 1)
//let p = partitionHoare(&list2, low: 0, high:  list2.count - 1)

