func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
    let edgesCount = edges.count
    var visitedEdges = Array.init(repeating: false, count: edgesCount)
    var maxProbability = 0.0
    var mutableEdges = edges

    for i in 0..<edgesCount {
        if mutableEdges[i][1] == start {
            let temp = mutableEdges[i][0]
            mutableEdges[i][0] = mutableEdges[i][1]
            mutableEdges[i][1] = temp
        }
    }

    for i in 0..<edgesCount {
        if mutableEdges[i][0] != start {
            continue
        }

        var edgeStack: [([Int], Double)] = []
        var product = succProb[i]
        edgeStack.append((mutableEdges[i], product))

        visitedEdges[i] = true

        while !edgeStack.isEmpty {
            let edge = edgeStack.last!
            let stackCount = edgeStack.count
            product = edge.1
            if edge.0[1] == end {
                if maxProbability < product {
                    maxProbability = product
                }
            }
            for j in 0..<edgesCount {
                if (mutableEdges[j][0] == edge.0[1]) && !visitedEdges[j] {
                    product = product * succProb[j]
                    edgeStack.append((mutableEdges[j], product))
                    visitedEdges[j] = true
                    break
                }
            }
            if edgeStack.count == stackCount {
                print(edgeStack)
                edgeStack.remove(at: edgeStack.count-1)
            }
        }

    }

    return maxProbability
}
