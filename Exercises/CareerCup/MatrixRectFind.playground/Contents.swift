import UIKit
/*
     Give a matrix, for example
     1 0 0 1 0
     0 0 1 0 1
     0 0 0 1 0
     1 0 1 0 1
     Find if there is a rectangle in the matrix, all four corners are 1
     For the example,  there is only one rectangle, that is
     1 0 1
     0 1 0
     1 0 1
 */
let arr1 = "1 0 0 1 0".split(separator: " ").map {Int($0)!}
let arr2 = "0 0 1 0 1".split(separator: " ").map {Int($0)!}
let arr3 = "0 0 0 1 0".split(separator: " ").map {Int($0)!}
let arr4 = "1 0 1 0 1".split(separator: " ").map {Int($0)!}

let matrix: [[Int]] = [arr1, arr2, arr3, arr4]
print("Matrix: \(matrix)")
print("-----------------\n")

var matrixesFound = 0

var currentRow = 0
for row in matrix {
    print(row)
    currentRow += 1
    var currentColumn = 0
    for _ in 0..<row.count {
        
        let topLeft = (currentRow-1<0) ? 0 : (currentColumn-1<0 ? 0 : matrix[currentRow-1][currentColumn-1])
        let topRight = (currentRow-1<0) ? 0 : (currentColumn+1>row.count-1 ? 0 : matrix[currentRow-1][currentColumn+1])

        let bottomLeft = (currentRow+1>matrix.count-1) ? 0 : (currentColumn-1<0 ? 0 : matrix[currentRow+1][currentColumn-1])
        let bottomRight = (currentRow+1>matrix.count-1) ? 0 : (currentColumn+1>row.count-1 ? 0 : matrix[currentRow+1][currentColumn+1])

        if topLeft == 1 && topRight == 1 && bottomLeft == 1 && bottomRight == 1 {
            matrixesFound += 1
        }
        
        currentColumn += 1
    }
}
print("\n--->Matrixes found: \(matrixesFound)")
