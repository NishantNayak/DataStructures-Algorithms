func findCircleNum(_ isConnected: [[Int]]) -> Int {
    let numberOfNodes = isConnected[0].count
    var visitedArray = Array.init(repeating: false, count: numberOfNodes)
    var resultCount = 0

    for i in 0..<numberOfNodes {
        if visitedArray[i] {
            continue
        }

        var nodeQueue: [Int] = []
        nodeQueue.append(i)

        while !nodeQueue.isEmpty {
            let node = nodeQueue.remove(at: 0)
            visitedArray[node] = true
            for j in 0..<numberOfNodes {
                if (isConnected[node][j] == 1 && node != j && !visitedArray[j]) {
                    nodeQueue.append(j)
                }
            }
        }
        resultCount = resultCount + 1
    }
    return resultCount
}

print(findCircleNum([[1,0,0],[0,1,0],[0,0,1]]))
