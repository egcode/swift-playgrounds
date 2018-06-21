
import Foundation

protocol IteratorProtocol {
    associatedtype Element
    mutating func next() -> Element?
}

struct StackIterator<T>: IteratorProtocol {
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}


//protocol Sequence {
//    associatedtype Iterator: IteratorProtocol
//    func makeIterator() -> Iterator
//}



//struct Stack<Element>:Sequence {
struct Stack<Element> {

    var items = [Element]()
    
    mutating func push(_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    func map<U>(_ f: (Element) -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }
    
//    //Sequence
//    func makeIterator() -> StackIterator<Element> {
//        return StackIterator(stack: self)
//    }
    
}

//-----------------------------------------------------------
// Associated Type Protocol


print("\n------------- associatedtype ---------------------")
var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

var myStackIterator = StackIterator(stack: myStack)
while let value = myStackIterator.next() {
    print("got \(value)")
}


//for value in myStack {
//    print("For-in loop: got \(value)")
//}


//var intStack = Stack<Int>()
//intStack.push(1)
//intStack.push(2)
//
//print(intStack.pop())
//print(intStack.pop())
//print(intStack.pop())
//
//
//var strStack = Stack<String>()
//strStack.push("one")
//strStack.push("two")
//strStack = strStack.map( {$0 + " zalupa"} )
//
//print(strStack.pop())
//print(strStack.pop())

//-----------------------------------------------------------
//Type Constraints
func checkIfEqual<T: Equatable>(_ first: T, _ second: T) -> Bool {
    return first == second
}
print("\n------------- checkIfEqual ---------------------")
print(checkIfEqual(1, 1))
print(checkIfEqual("a string", "a string"))
print(checkIfEqual("a string", "a string adfsdf"))
print("----------------------------------")



func checkIfDescriptionMatch<T:CustomStringConvertible, U: CustomStringConvertible> (_ first: T, _ second: U) -> Bool {
    return first.description == second.description
}
print("\n------------- checkIfDescriptionMatch ---------------------")
print(checkIfDescriptionMatch(Int(2), Int(2)))
print(checkIfDescriptionMatch("ff", "ffa"))
print(checkIfDescriptionMatch(1, 1.0))
print("----------------------------------")
















