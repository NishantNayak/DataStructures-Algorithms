func maxArea(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count-1
    var maxContainer = 0

    while left < right {
        let liquidCount = getMaxLiquid(height: height, left: left, right: right)
        if maxContainer < liquidCount {
            maxContainer = liquidCount
        }
        if height[left] <= height[right] {
            left = left + 1
        } else {
            right = right - 1
        }
    }
    return maxContainer
}

func getMaxLiquid(height: [Int], left: Int, right: Int) -> Int {
    if height[left] <= height[right] {
        return (right-left)*height[left]
    } else {
        return (right-left)*height[right]
    }
}

print(maxArea([1,2,1]))
