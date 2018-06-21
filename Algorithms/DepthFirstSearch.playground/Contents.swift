//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
UIImage(named: "sampleGraph.png")


func depthFirstSearch(from start: Vertex<String>, to end: Vertex<String>, graph: AdjacencyList<String>) -> Stack<Vertex<String>> {
    var visited = Set<Vertex<String>>() // 2
    var stack = Stack<Vertex<String>>() // 3
    
    stack.push(start)
    visited.insert(start)

    outer: while let vertex = stack.peek(), vertex != end { // The goal is to find a path from the start vertex to the end vertex. So while the stack is not empty, the path has not been found.
        
        guard let neighbors = graph.edges(from: vertex), neighbors.count > 0 else { // Check to see if the current vertex has any neighbors. If there are none, that means you reached a dead-end
            print("backtrack from \(vertex)")
            stack.pop()
            continue
        }
        
        for edge in neighbors { // If the vertex has any edges, you are going to loop through each edge.
            if !visited.contains(edge.destination) {
                visited.insert(edge.destination)
                stack.push(edge.destination)
                print(stack.description)
                continue outer
            }
        }
        
        print("backtrack from \(vertex)") // 4
        stack.pop()
    }

    
    return stack // 4
}



// Sample Graph
let adjacencyList = AdjacencyList<String>()

let s = adjacencyList.createVertex(data: "S")
let a = adjacencyList.createVertex(data: "A")
let b = adjacencyList.createVertex(data: "B")
let c = adjacencyList.createVertex(data: "C")
let d = adjacencyList.createVertex(data: "D")
let f = adjacencyList.createVertex(data: "F")
let g = adjacencyList.createVertex(data: "G")
let e = adjacencyList.createVertex(data: "E")

adjacencyList.add(.undirected, from: s, to: a)
adjacencyList.add(.undirected, from: a, to: b)
adjacencyList.add(.undirected, from: a, to: d)
adjacencyList.add(.undirected, from: a, to: c)
adjacencyList.add(.undirected, from: b, to: d)
adjacencyList.add(.undirected, from: d, to: g)
adjacencyList.add(.undirected, from: d, to: f)
adjacencyList.add(.undirected, from: f, to: e)

adjacencyList.description

//print("Back Stack: \(depthFirstSearch(from: s, to: e, graph: adjacencyList))")
print("Back Stack: \(depthFirstSearch(from: s, to: c, graph: adjacencyList))")


