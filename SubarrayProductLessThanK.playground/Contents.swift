func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
    let numsCount = nums.count

    var i = 0
    var j = 0
    var product = 1
    var resultCount = 0

    while j < numsCount {

        product = product * nums[j]

        while i < j && product >= k {
            product = product/nums[i]
            i = i + 1
        }

        if product < k {
            let len = j - i + 1
            resultCount = resultCount + len
        }
        j = j + 1
    }

    return resultCount
}

print(numSubarrayProductLessThanK([10, 5, 2, 6], 100))
