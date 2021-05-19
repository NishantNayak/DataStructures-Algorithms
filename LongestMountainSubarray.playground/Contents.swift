enum SequenceType:Int {
    case Increase = 0
    case Decrease
    case Same
}

func longestMountain(_ arr: [Int]) -> Int {
    let count = arr.count
    if (count < 3) {
        return 0
    }
    var i = 1
    var result: [(SequenceType,Int)] = []
    while i<count {
        while(i<count && arr[i]>arr[i-1]){
            if !result.isEmpty {
                let last = result[result.count-1]
                if last.0 != SequenceType.Increase {
                    result.append((SequenceType.Increase,i-1))
                }
            } else {
                result.append((SequenceType.Increase,i-1))
            }
            i = i+1
        }

        while (i<count && arr[i]==arr[i-1]) {
            if !result.isEmpty {
                let last = result[result.count-1]
                if last.0 != SequenceType.Same {
                    result.append((SequenceType.Same,i-1))
                }
            } else {
                result.append((SequenceType.Same,i))
            }
            i = i+1
        }

        while (i<count && arr[i]<arr[i-1]) {
            if !result.isEmpty {
                let last = result[result.count-1]
                if last.0 != SequenceType.Decrease {
                    result.append((SequenceType.Decrease,i-1))
                }
            } else {
                result.append((SequenceType.Decrease,i))
            }
            i = i+1
        }
    }
    
    var answer = 0
    for i in 1..<result.count {
        if result[i].0 == SequenceType.Decrease && result[i-1].0 == SequenceType.Increase {
            var sum = 0
            if i == result.count-1 {
                sum = count-result[i-1].1
            } else {
                sum = result[i+1].1-result[i-1].1+1
            }
            if answer < sum {
                answer = sum
            }
        }
    }
    
    return answer
}

print(longestMountain([0,0,1,0,0,1,1,1,1,1]))
