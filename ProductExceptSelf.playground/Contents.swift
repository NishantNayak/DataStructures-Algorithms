func productExceptSelf(_ nums: [Int]) -> [Int] {
    
    let numsCount = nums.count
    var product = 1
    var resultArray: [Int] = Array.init(repeating: 0, count: numsCount)
    var zeroCount = 0
    
    for i in 0..<numsCount {
        if nums[i] != 0 {
            product = product * nums[i]
        } else {
            zeroCount = zeroCount + 1
        }
    }
    
    if zeroCount > 1 {
        return resultArray
    }
    
    for i in 0..<numsCount {
        if nums[i] == 0 {
            resultArray[i] = product
        } else if zeroCount == 0 {
            resultArray[i] = product/nums[i]
        }
    }
    
    return resultArray
}

print(productExceptSelf([-1,1,0,-3,3]))
