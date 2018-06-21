/*
 left child node can be found at index  2i + 1
 right child node can be found at index 2i + 2
 */
import UIKit
import PlaygroundSupport
UIImage(named: "leftRightFormula.png")

struct Heap<Element> {
    var elements : [Element]
    let priorityFunction : (Element, Element) -> Bool // returns true if the first has a higher priority than the second.
    
    var isEmpty : Bool {
        return elements.isEmpty
    }
    var count : Int {
        return elements.count
    }
    // init
    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) { // 1 // 2
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }

    mutating func enqueue(_ element: Element) {//enqueues a new element to the last position in the heap, and then sift it up.
        elements.append(element)
        siftUp(elementAtIndex: count - 1)
    }
    mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index),
            isHigherPriority(at: index, than: parent)
            else { return }
        swapElement(at: index, with: parent)
        siftUp(elementAtIndex: parent)
    }
    mutating func dequeue() -> Element? {
        guard !isEmpty
            else { return nil }
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            siftDown(elementAtIndex: 0)
        }
        return element
    }
    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        if index == childIndex {
            return
        }
        swapElement(at: index, with: childIndex)
        siftDown(elementAtIndex: childIndex)
    }

    func peek() -> Element? {
        return elements.first
    }
    func isRoot(_ index: Int) -> Bool {
        return (index == 0)
    }
    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    /////
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex)
            else { return parentIndex }
        return childIndex
    }
    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex
            else { return }
        elements.swapAt(firstIndex, secondIndex)
    }
    /////
}

var heap = Heap(elements: [3, 1, 2, 8, 5, 0, 34, ], priorityFunction: >)
print(heap.elements)

