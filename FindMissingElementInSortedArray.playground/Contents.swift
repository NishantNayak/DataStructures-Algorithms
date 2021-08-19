func findMissingElementInSortedArray(arr: [Int], left: Int, right: Int, isValid: Bool) -> Int {
    let mid = (right - left)/2
    if left > right {
        if !isValid {
            return left+1
        } else {
            return 0
        }
    }
    
    var result = 0
    if left+mid+1 == arr[left+mid] {
        result = findMissingElementInSortedArray(arr: arr, left: left+mid+1, right: right, isValid: isValid)
    } else {
        result = findMissingElementInSortedArray(arr: arr, left: left, right: left+mid-1, isValid: false)
    }
    return result
}

print(findMissingElementInSortedArray(arr: [1, 2, 3, 4, 6], left: 0, right: 4, isValid: true))

