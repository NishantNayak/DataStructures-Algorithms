class TreeNode {
    var value: Int?
    var left: TreeNode?
    var right: TreeNode?
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

class TreeComputation {
    
    func insert(root: TreeNode?, value: Int) -> TreeNode {
        if (root == nil) {
            return TreeNode(value: value)
        }
            
        if (value < (root?.value)!) {
            root?.left = insert(root: root?.left, value: value);
        }
            
        if (value > (root?.value)!) {
            root?.right = insert(root: root?.right, value: value);
        }
        return root!;
    }

    func findKthElement(root: TreeNode?, k: inout Int) -> TreeNode? {
        
        if (root == nil) {
            return nil
        }
        
        let left = findKthElement(root: root?.left, k: &k)
        
        if (left != nil) {
            return left
        }
        k = k-1
        if k == 0 {
            return root
        }
        
        return findKthElement(root: root?.right, k: &k)
    }
}


func test() -> Int {
    var root: TreeNode? = nil
    let treeComputation = TreeComputation()
    let keys = [ 20, 8, 22, 4, 12, 10, 14 ]
 
    for key in keys {
        root = treeComputation.insert(root: root, value: key)
    }
 
    var k = 3
    return (treeComputation.findKthElement(root: root, k: &k)?.value)!
}

print(test())
