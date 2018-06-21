import UIKit

var words = ["cc", "cb", "bb", "ac"]
var ordering1 = ["c", "b", "a"] // true
var ordering2 = ["b", "c", "a"] // false

//func isCorrectOrder(words: [String], order: [String]) -> Bool {
//    guard let lettersCount = words.first?.count else { return false }
//    var letterIndex = 0
//    var orderIndex = 0
//    repeat {
//        for i in 0..<words.count {
//            var currentWord = Array(words[i])
//            let currentLetter = "\(currentWord[letterIndex])"
//            var currentOrderLetter = "\(order[orderIndex])"
//
//            print("Letter: \(currentLetter)  -->Order: \(currentOrderLetter)")
//
//            if currentLetter != currentOrderLetter {
//                for _ in orderIndex..<order.count-1 {
//                    orderIndex += 1
//                    currentOrderLetter = "\(order[orderIndex])"
//
//                    print("Mismatch: \(currentLetter) \(currentOrderLetter)")
//
//                    if currentLetter == currentOrderLetter {
//                        break
//                    } else if orderIndex == (order.count-1) { // if last order and no match = return false
//                        return false
//                    } else {
//                        continue
//                    }
//                }
//            }
//            if i == words.count - 1 {
//                letterIndex += 1
//                print("next\n")
//            }
//        }
//    } while letterIndex < lettersCount
//    return true
//}
func isCorrectOrder(words: [String], order: [String]) -> Bool {
    guard let lettersCount = words.first?.count else { return false }
    var orderIndex = 0
    
    for i in 0..<lettersCount {
        for j in 0..<words.count {
            var currentWord = Array(words[j])
            let currentLetter = "\(currentWord[i])"
            var currentOrderLetter = "\(order[orderIndex])"
            
            print("Letter: \(currentLetter)  -->Order: \(currentOrderLetter)")
            
            if currentLetter != currentOrderLetter {
                for _ in orderIndex..<order.count-1 {
                    orderIndex += 1
                    currentOrderLetter = "\(order[orderIndex])"
                    
                    print("Mismatch: \(currentLetter) \(currentOrderLetter)")
                    
                    if currentLetter == currentOrderLetter {
                        break
                    } else if orderIndex == (order.count-1) { // if last order and no match = return false
                        return false
                    } else {
                        continue
                    }
                }
            }
            if j == words.count - 1 {
                print("next\n")
            }
        }
    }
    return true
}

isCorrectOrder(words: words, order: ordering1)
isCorrectOrder(words: words, order: ordering2)
// c c b a - c b b c
