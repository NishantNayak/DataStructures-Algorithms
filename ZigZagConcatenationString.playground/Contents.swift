func convert(_ s: String, _ numRows: Int) -> String {
    var resultArray = Array(repeating: "", count: numRows)
    var row = 0
    var column = 0
    for char in s {
        resultArray[row] = resultArray[row] + String(char)
        if (column%(numRows-1) == 0 && row < numRows-1) {
            row = row + 1
        } else {
            row = row - 1
            column = column + 1
        }
    }

    var result = ""

    for str in resultArray {
        result = result + str
    }

    return result
}

print(convert("PAYPALISHIRING", 3))
