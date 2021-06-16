func maxProduct(_ nums: [Int]) -> Int {
    var minVal = nums[0]
    var maxVal = nums[0]

    var maxProduct = nums[0];
    for i in 1..<nums.count {

        if (nums[i] < 0) {
            swap(&maxVal, &minVal)
        }

        maxVal = max(nums[i], maxVal * nums[i])
        minVal = min(nums[i], minVal * nums[i])

        maxProduct = max(maxProduct, maxVal)
    }

        // Return maximum product found in array.
        return maxProduct;
}

print(maxProduct([2,3,-2,4,-8]))
