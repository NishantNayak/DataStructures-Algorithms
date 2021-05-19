public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
 

func flatten(_ root: TreeNode?) {

    if root == nil {
        return
    }
    flatten(root?.left)
    flatten(root?.right)
    if root?.left != nil {
        let tempRight = root?.right
        root?.right = root?.left
        root?.left = nil

        var rightRef = root?.right
        while rightRef?.right != nil {
            rightRef = rightRef?.right
        }
        rightRef?.right = tempRight
    }
}
