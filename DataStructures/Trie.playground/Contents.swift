//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
UIImage(named: "trie.png")

class TrieNode<T: Hashable> {
    var value: T?
    weak var parent: TrieNode?
    var children: [T: TrieNode] = [:]
    
    var isTerminating = false

    init(value: T? = nil, parent: TrieNode? = nil) {
        self.value = value
        self.parent = parent
    }
    
    func add(child: T) {
        // Make sure the child does not already exist in the dictionary of children. If it does, return.
        guard children[child] == nil else { return }
        
        // Create a new node for the new value, and add it to the children dictionary of the current node.
        children[child] = TrieNode(value: child, parent: self)
    }

}

class Trie {
    typealias Node = TrieNode<Character>
    fileprivate let root: Node
    
    init() {
        root = Node()
    }
    
    func insert(word: String) {
        guard !word.isEmpty else { return }
        var currentNode = root
        
        //  A word in the Trie is represented by a chain of nodes, where each node represents a character of the word (Ex: c -> u -> t -> e for “cute”). Since you’ll be inserting character by character, turning the word into an array will easily allow you to keep track of the characters during insertion.
        let characters = Array(word.lowercased().characters)
        var currentIndex = 0
        
        while currentIndex < characters.count {
            //  Get ahold of the character you need to insert into the Trie.
            let character = characters[currentIndex]
            
            // Check if the character you're trying to insert exists within the current node's children dictionary. If it exists, you'll simply move the currentNode reference to the next node. There's no need to insert the character because it's already there!
            if let child = currentNode.children[character] {
                currentNode = child
            } else {
                // If execution proceeds to the else block, it means the character needs to be inserted. You'll add the character into the current children dictionary. Afterwards, you'll move the currentNode reference to the new node.

                currentNode.add(child: character)
                currentNode = currentNode.children[character]!
            }
            
            // Add 1 to the currentIndex property to keep track of the next character you need to insert.
            currentIndex += 1
            
        }
        
        if currentIndex == characters.count {
            currentNode.isTerminating = true
        }
    }
    
    func contains(word: String) -> Bool {
        guard !word.isEmpty else { return false }
        var currentNode = root
        
        let characters = Array(word.lowercased().characters)
        var currentIndex = 0
        
        // You create a while loop with the condition that the currentIndex hasn't reached the end of the word. You also try to bind the children dictionary's value into a child property.
        while currentIndex < characters.count, let child = currentNode.children[characters[currentIndex]] {
            
            // If the while loop succeeds, you move currentIndex and currentNode to look for the next matching letter.
            currentIndex += 1
            currentNode = child
        }
        
        if currentIndex == characters.count && currentNode.isTerminating {
            return true
        } else {
            return false
        }
    }
}



let trie = Trie()

trie.insert(word: "cute")
trie.contains(word: "cute") // true

trie.contains(word: "cut") // false
trie.insert(word: "cut")

trie.insert(word: "cat")
trie.contains(word: "cat") // true
trie.contains(word: "cute") // true
