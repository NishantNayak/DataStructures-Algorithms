func longestValidParentheses(_ s: String) -> Int {
    var stack: [Int] = []
    stack.append(-1)
    var result = 0
    for (index, char) in s.enumerated() {
        if char == "(" {
            stack.append(index)
        } else {
            if !stack.isEmpty {
                stack.removeLast()
            }
        }

        if !stack.isEmpty {
            result = max(result, index - stack.last!)
        } else {
            stack.append(index)
        }
    }

    return result
}


print(longestValidParentheses(")()())()()("))
