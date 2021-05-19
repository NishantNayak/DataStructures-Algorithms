func firstMissingPositive(_ nums: [Int]) -> Int {
        var numArray = nums
        if numArray.count == 0 {
            return 1
        }
        let numCount = numArray.count
        for i in 0..<numCount {
            if numArray[i] < 0 {
                numArray[i] = 0
            }
        }

        for i in 0..<numCount {
            let number = abs(numArray[i]) - 1
            if (number >= 0 && number < numCount) {
                if numArray[number] == 0 {
                    numArray[number] = -(number+1)
                } else if (numArray[number] > 0) {
                    numArray[number] = -numArray[number]
                }
            }
            print(numArray)
        }
        for i in 0..<numCount {
            if numArray[i] >= 0 {
                return i+1
            }
        }

        return numCount+1
    }


print(firstMissingPositive([2,1,1,0,3,0,4,3,2]))
