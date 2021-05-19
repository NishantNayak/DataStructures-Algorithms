public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}



func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
    var current = head
    var kthNode = head
    var kthLastNode = head
    var count = 1

    while current?.next != nil {
        if count < k {
            kthNode = kthNode?.next
        } else {
            kthLastNode = kthLastNode?.next
        }
        count = count + 1
        current = current?.next
    }

    let temp = kthNode!.val
    kthNode?.val = kthLastNode!.val
    kthLastNode?.val = temp

    return head
}
