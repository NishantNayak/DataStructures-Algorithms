func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
    let edgesCount = edges.count
    var distArray = Array.init(repeating: 0.0, count: n)
    var visitedArray = Array.init(repeating: false, count: n)
    var graph = Array.init(repeating: Array.init(repeating: 0.0, count: n), count: n)

    for i in 0..<edgesCount {
        graph[edges[i][0]][edges[i][1]] = succProb[i]
        graph[edges[i][1]][edges[i][0]] = succProb[i]
    }

    distArray[start] = 1.0

    for _ in 0..<n-1 {

        let minVertex = getMax(distArray: distArray, visitedArray: visitedArray)

        visitedArray[minVertex] = true

        for j in 0..<n {

            if (!visitedArray[j] && graph[minVertex][j] != 0.0  && distArray[minVertex] != 0.0 && (distArray[minVertex] * graph[minVertex][j]) > distArray[j]) {
                distArray[j] = distArray[minVertex] * graph[minVertex][j]
            }
        }

    }

    return distArray[end]
}

func getMax(distArray: [Double], visitedArray: [Bool]) -> Int {
    var min = -Double.infinity
    var minIndex = -1

    for i in 0..<distArray.count {
        if distArray[i] > min && !visitedArray[i] {
            min = distArray[i]
            minIndex = i
        }
    }

    return minIndex
}


print(maxProbability(3, [[0,1],[1,2],[0,2]], [0.5,0.5,0.2], 0, 2))
print(maxProbability(3, [[0,1]], [0.5], 0, 2))
print(maxProbability(5, [[2,3],[1,2],[3,4],[1,3],[1,4],[0,1],[2,4],[0,4],[0,2]], [0.06,0.26,0.49,0.25,0.2,0.64,0.23,0.21,0.77], 0, 3))
print(maxProbability(5, [[1,4],[2,4],[0,4],[0,3],[0,2],[2,3]], [0.37,0.17,0.93,0.23,0.39,0.04], 3, 4))
print(maxProbability(10, [[0,3],[1,7],[1,2],[0,9]], [0.31,0.9,0.86,0.36], 2, 3))
