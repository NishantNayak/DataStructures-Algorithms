
func findMedianOfSortedArrays(input1: [Int], input2: [Int]) -> Double? {
    
    let input1Size = input1.count
    let input2Size = input2.count
    
    if input1Size > input2Size {
        findMedianOfSortedArrays(input1: input2, input2: input1)
    }
    
    var low = 0
    var high = input1Size
    
    while low <= high {
        let input1PartionIndex = (low + high)/2
        let input2PartionIndex = (input1Size + input2Size + 1)/2 - input1PartionIndex
        
        let input1LeftMax = input1PartionIndex == 0 ? Int.min : input1[input1PartionIndex - 1]
        let input1RightMin = input1PartionIndex == input1Size ? Int.max : input1[input1PartionIndex]
        
        let input2LeftMax = input2PartionIndex == 0 ? Int.min : input2[input2PartionIndex - 1]
        let input2RightMin = input2PartionIndex == input2Size ? Int.max : input2[input2PartionIndex]
        
        if input1LeftMax < input2RightMin && input2LeftMax < input1RightMin {
            if (input1Size + input2Size) % 2 == 0 {
                return Double(max(input1LeftMax, input2LeftMax) + min(input1RightMin, input2RightMin))/2
            }
            else {
                return Double(max(input1LeftMax, input2LeftMax))
            }
        }
        else if input1LeftMax > input2RightMin {
            high = input1PartionIndex - 1
        }
        else {
            low = input1PartionIndex + 1
        }
    }
    return nil
}


//print(findMedianOfSortedArrays(input1: [1, 2, 3, 4], input2: [5, 6, 7, 8]))
//print(findMedianOfSortedArrays(input1: [1, 3, 8, 9, 15], input2: [7, 11, 18, 19, 21, 25]))
print(findMedianOfSortedArrays(input1: [7, 11, 18, 19, 21, 25], input2: [1, 3, 8, 9, 15]))
