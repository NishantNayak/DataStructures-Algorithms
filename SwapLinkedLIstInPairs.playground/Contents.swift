public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


func swapPairs(_ head: ListNode?) -> ListNode? {

    if head == nil {
        return nil
    }

    var current = head
    var prev: ListNode? = nil
    var next: ListNode? = nil

    for _ in 0...1 {
        if current == nil {
            return prev
        }
        next = current?.next
        current?.next = prev
        prev = current
        current = next
    }

    head?.next = swapPairs(current)

    return prev
}
