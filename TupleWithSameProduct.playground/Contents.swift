func tupleSameProduct(_ nums: [Int]) -> Int {
    let numsCount = nums.count
    var productDictionary: [Int:Int] = [:]
    
    for i in 0..<numsCount-1 {
        for j in i+1..<numsCount {
            let product = nums[i] * nums[j]
            if productDictionary.keys.contains(product) {
                productDictionary[product] = productDictionary[product]! + 1
            } else {
                productDictionary[product] = 1
            }
        }
    }
    
    var result = 0
    
    for product in productDictionary {
        if product.value > 1 {
            result = result + (8 * (numbersSum(a: product.value-1)))
        }
    }
    return result
}

func numbersSum(a: Int) -> Int {

    return a == 1 ? a : a + numbersSum(a: a - 1)
}

print(tupleSameProduct([1,2,4,5,10]))
