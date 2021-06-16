//Find K-diff Pairs in an Array

func findPairs(_ nums: [Int], _ k: Int) -> Int {
    let count = nums.count
    var numsDict:[Int:Int] = [:]
    var visitedDict:[Int:Int] = [:]
    var answer = 0
    
    for i in 0..<count {
        if numsDict.keys.contains(nums[i]) {
            numsDict[nums[i]] = numsDict[nums[i]]! + 1
        } else {
            numsDict[nums[i]] = 1
        }
    }
    
    for i in 0..<count {
        if k==0 {
            if (numsDict[nums[i]]! >= 2 && !visitedDict.keys.contains(nums[i])) {
                answer = answer + 1
                visitedDict[nums[i]] = 1
            }
        } else {
            if (numsDict.keys.contains(nums[i]+k) && !visitedDict.keys.contains(nums[i])) {
                answer = answer + 1
                visitedDict[nums[i]] = 1
            }
        }
    }
    
    return answer
}

print(findPairs([1,2,3,4,5], 1))
