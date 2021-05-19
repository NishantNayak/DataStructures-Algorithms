public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}



    func SortedMerge(a: ListNode?, b: ListNode?) -> ListNode? {
        var result: ListNode? = nil

        if (a == nil && b == nil) {
            return nil
        } else if (a == nil) {
            return b
        }
        else if (b == nil) {
            return a
        }

        if (a!.val <= b!.val) {
            result = a
            result!.next = SortedMerge(a: a!.next, b: b)
        }
        else {
            result = b
            result!.next = SortedMerge(a: a, b: b!.next)
        }

        return result
    }
