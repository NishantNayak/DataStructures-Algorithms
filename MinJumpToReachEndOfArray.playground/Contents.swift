func jump(_ nums: [Int]) -> Int {
    let arrayCount = nums.count
    var jumpCount = Array(repeating: 0, count: arrayCount)

    for j in 0..<arrayCount {
        for i in 0..<j {
            if (nums[i] >= j-i) {
                if (jumpCount[j] == 0 || jumpCount[j] > (jumpCount[i] + 1)) {
                    jumpCount[j] = jumpCount[i] + 1
                }
            }
        }
    }

    return jumpCount[arrayCount-1]
}

print(jump([2,3,0,1,4]))
