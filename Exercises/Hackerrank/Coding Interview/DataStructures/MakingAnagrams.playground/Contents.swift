//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

UIImage(named: "anagrams.png")
/*
 Print a single integer denoting the number of characters you must delete to make the two strings anagrams of each other.
 */
//var str1 = "cde"
//var str2 = "abc"
//Output: 4

var str1 = "hello"
var str2 = "billion"
//Output: 6

//var str1 = "aaa"
//var str2 = "a"
//Output: 2

//var str1 = "fsqoiaidfaukvngpsugszsnseskicpejjvytviya"
//var str2 = "ksmfgsxamduovigbasjchnoskolfwjhgetnmnkmcphqmpwnrrwtymjtwxget"
//Output: 42

print("First Length: \(str1.count)")
print("Second Length: \(str2.count)")

func getHashTableFromString(str: String) -> Dictionary<Character, Int> {
    var dic = Dictionary<Character, Int>()
    for char in str {
        if let c = dic[char] {
            dic[char] = c + 1
        } else {
            dic[char] = 1
        }
    }
    return dic
}

func mergedDictionaries() -> Dictionary<Character, Int> {
    let dic1 = getHashTableFromString(str: str1)
    var dic2 = getHashTableFromString(str: str2)

    for item in dic1 {
        if let v = dic2[item.key] {
            dic2[item.key] = max(v, item.value) - min(v, item.value)
        } else {
            dic2[item.key] = item.value
        }
    }
    return dic2
}

var mergedDictionary = mergedDictionaries()

var count = 0
for item in mergedDictionary {
    count += item.value
}

print("\n---------")
print("dict1: \(getHashTableFromString(str: str1)) count: \(getHashTableFromString(str: str1).count)")
print("dict2: \(getHashTableFromString(str: str2)) count: \(getHashTableFromString(str: str2).count)")
print("mergedDictionary: \(mergedDictionary) count: \(mergedDictionary.count)")
print("RESULT: \(count)")
print("\n---------")

