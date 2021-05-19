func validMountainArray(_ arr: [Int]) -> Bool {
    let count = arr.count

    if (count < 3) {
        return false
    }

    var i = 1

    while(i<count && arr[i]>arr[i-1]){
        i = i+1
    }

    let breakPosition = i

    while (i<count && arr[i]==arr[i-1]) {
        return false
    }

    while (i<count && arr[i]<arr[i-1]) {
        i = i+1
    }

    return i == count && breakPosition>0 && breakPosition<count
}

print(validMountainArray([0,3,2,1]))
