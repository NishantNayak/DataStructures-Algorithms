import UIKit

func findAnagramGroups(words:[String]) {
    
    var checkMap: [[Character:Int]:[String]] = [:]
    
    for word in words {
        var dict:[Character:Int] = [:]
        for char in word {
            if dict.keys.contains(char){
                dict[char] = dict[char]! + 1
            } else {
                dict[char] = 0
            }
        }
        
        if checkMap.keys.contains(dict) {
            checkMap[dict]?.append(word)
        } else {
            checkMap[dict] = []
            checkMap[dict]?.append(word)
        }
        
    }
    
    for (_, value) in checkMap {
        print("\(value)")
    }
}

findAnagramGroups(words: ["eat","tea","tan","ate","nat","bat"])
