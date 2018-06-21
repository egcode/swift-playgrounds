//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
UIImage(named: "f1.png")

UIImage(named: "f2.png")

func fibonacci (n: Int) -> Int {
    // Write your code here.
    //if n >= 30 {    return 0   }
    
    if n == 0 || n == 1 {
        return n
    } else {
        return fibonacci(n: n - 1) + fibonacci(n: n - 2)
    }
    
}

// print the nth fibonacci number
print(fibonacci(n: 6))

