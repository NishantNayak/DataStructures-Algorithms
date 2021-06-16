// Convert sorted linked list to BST

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

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


func sortedListToBST(_ head: ListNode?) -> TreeNode? {
    var root: TreeNode? = nil
    var mid = head
    var beforeMid = head
    var afterMid = mid?.next
    var last = head
    var advanceCount = 0
    
    if head == nil {
        return root
    }
    
    while last != nil && last?.next != nil {
        last = last?.next?.next
        beforeMid = mid
        mid = mid?.next
        afterMid = mid?.next
        advanceCount = advanceCount + 1
    }
    root = TreeNode.init(mid?.val ?? 0)
    beforeMid?.next = nil
    mid?.next = nil
    if advanceCount == 0 {
        root?.left = sortedListToBST(nil)
    } else {
        root?.left = sortedListToBST(head)
    }
    root?.right = sortedListToBST(afterMid)
    
    return root
}
