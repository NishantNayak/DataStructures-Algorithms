func longestPalindrome(_ s: String) -> String {
    let strCount = s.count
    var tempArray = Array(repeating: Array(repeating: false, count: strCount), count: strCount)
    var maxLength = 1
    var start = 0
    var charArray: [Character] = []

    for char in s {
        charArray.append(char)
    }

    if s.isEmpty {
        return ""
    }

    for i in 0..<strCount {
        tempArray[i][i] = true
    }
    for i in 0..<strCount-1 {
        if (charArray[i] == charArray[i+1]) {
            tempArray[i][i+1] = true
            start = i
            maxLength = 2
        }
    }

    if s.count >= 3 {
        for i in 3...strCount {
            for j in 0..<strCount-i+1 {
                let k = j+i-1
                if (charArray[j] == charArray[k] && tempArray[j+1][k-1]) {
                    tempArray[j][k] = true
                    start = j
                    maxLength = i
                }
            }
        }
    }
    let resultStart = s.index(s.startIndex, offsetBy: start)
    let resultEnd = s.index(resultStart, offsetBy: maxLength)
    let range = resultStart..<resultEnd
    return String(s[range])
}

print(longestPalindrome("rrr"))
