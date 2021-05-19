func threeSum(_ nums: [Int]) -> [[Int]] {
    var numDict: [Int:Int] = [:]
    var result = Set<[Int]>()

    var numsCopy = nums
    let numsCount = numsCopy.count
    numsCopy.sort()

    if numsCopy.isEmpty {
        return []
    }

    for i in 0..<numsCount {
        if numDict.keys.contains(numsCopy[i]) {
            numDict[numsCopy[i]] = numDict[numsCopy[i]]! + 1
        } else {
            numDict[numsCopy[i]] = 1
        }
    }

    for i in 0..<numsCount-1 {
        for j in i+1..<numsCount {
            let twoSum = numsCopy[i] + numsCopy[j]
            if numDict.keys.contains(-twoSum) {
                if(-twoSum == numsCopy[i] && -twoSum == numsCopy[j]) {
                    if (numDict[-twoSum]! < 3) {
                        continue
                    }
                } else if(-twoSum == numsCopy[i] || -twoSum == numsCopy[j]) {
                    if (numDict[-twoSum]! < 2) {
                        continue
                    }
                }
                var triplet: [Int] = []
                if (-twoSum < numsCopy[i] && -twoSum < numsCopy[j]) {
                    triplet = [-twoSum, numsCopy[i], numsCopy[j]]
                } else if (-twoSum > numsCopy[i] && -twoSum > numsCopy[j]) {
                    triplet = [numsCopy[i], numsCopy[j], -twoSum]
                } else {
                    triplet = [numsCopy[i], -twoSum, numsCopy[j]]
                }

                result.insert(triplet)
            }
        }
    }
    return Array(result)
}

print(threeSum([-1,0,1,2,-1,-4]))
