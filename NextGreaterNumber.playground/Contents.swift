func nextPermutation(_ nums: inout [Int]) {
    if nums.count == 1 {
        return
    }
    var lastNumber = nums[nums.count-1]
    var indexOfInterest = -1
    var greaterNumberAvailable = false
    for i in (0..<nums.count-1).reversed() {
        if lastNumber > nums[i] {
            indexOfInterest = i
            greaterNumberAvailable = true
            break
        } else {
            lastNumber = nums[i]
        }
    }

    if !greaterNumberAvailable {
        nums.sort(by: <)
        return
    }

    var arrayToSort = nums[indexOfInterest+1...nums.count-1]
    arrayToSort.sort(by: <)
    nums.replaceSubrange(indexOfInterest+1...nums.count-1, with: arrayToSort)

    let temp = nums[indexOfInterest]
    for i in indexOfInterest+1...nums.count-1 {
        if temp < nums[i] {
            nums[indexOfInterest] = nums[i]
            nums[i] = temp
            break
        }
    }
}


var value = [2,3,1]
nextPermutation(&value)
print(value)
