func findMaxLength(_ nums: [Int]) -> Int {
    //Dictionary which stores the difference as key and the (position, result till that position) as the value
    var sumDict: [Int:(Int,Int)] = [:]
    let numsCount = nums.count
    var result = 0
    var zeroCount = 0
    var oneCount = 0
    
    sumDict[0] = (-1,0)
    
    for i in 0..<numsCount {
        if nums[i] == 0 {
            zeroCount = zeroCount + 1
        } else {
            oneCount = oneCount + 1
        }
        
        let difference = oneCount - zeroCount
        if sumDict.keys.contains(difference) {
            sumDict[difference] = (i,sumDict[difference]!.1 + (i - sumDict[difference]!.0))
            if result < sumDict[difference]!.1 {
                result = sumDict[difference]!.1
            }
        } else {
            sumDict[difference] = (i,0)
        }
    }
    return result
}
