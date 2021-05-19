    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var current = head
        var prev: ListNode? = nil
        var next: ListNode? = nil
        var count = 0
        var traverseNode = head


        if (current != nil) {
            for _ in 0..<k {
                if traverseNode == nil {
                    break
                }
                count = count + 1
                traverseNode = traverseNode?.next
            }
            if (count < k) {
                return current
            }
            for _ in 0..<k {
                if current == nil {
                    break
                }
                next = current?.next
                current?.next = prev
                prev = current
                current = next
            }

            head?.next = reverseKGroup(current, k)
        }
        return prev
    }
