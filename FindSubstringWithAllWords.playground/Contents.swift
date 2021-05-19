func findSubstring(_ s: String, _ words: [String]) -> [Int] {
    let wordSize = words[0].count
    let wordCharacters = words.count * wordSize
    let wordCount = words.count
    var wordDict: [String:Int] = [:]
    let stringCount = s.count
    var charArray = [String]()

    var result = [Int]()

    if wordCharacters > stringCount {
        return []
    }

    for word in words {
        if wordDict.keys.contains(word) {
            wordDict[word] = wordDict[word]! + 1
        } else {
            wordDict[word] = 1
        }
    }

    for char in s {
        charArray.append(String(char))
    }

    for i in 0...stringCount-wordCharacters {
        var tempWordDict = wordDict
        var j = i
        var count = wordCount
        while (j < (i + wordCharacters)) {
            var substring = ""
            for i in j..<j+wordSize {
                substring = substring + charArray[i]
            }

            if(!tempWordDict.keys.contains(substring) || tempWordDict[substring] == 0) {
                break
            } else {
                tempWordDict[substring] = tempWordDict[substring]! - 1
                count = count - 1
            }

            if count == 0 {
                result.append(i)
            }

            j = j + wordSize
        }
    }

    return result
}

print(findSubstring("wordgoodgoodgoodbestword", ["word","good","best","good"]))
