//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

/// `FiniteSequence` wraps another sequence and allows only `maxCount` values
/// to be returned from the sequence before it starts returning `nil`.
///
/// Example:
/// ´´´
/// for i in FiniteSequence(FibonacciSequence(length: 10), maxCount: 10) {
///     print(i)
/// }
/// ´´´
public struct FiniteSequence<T: Sequence & IteratorProtocol>: Sequence, IteratorProtocol {
    
    private var sequence: T
    private let maxCount: Int
    private var count: Int

    public init(_ sequence: T, maxCount: Int) {
        self.sequence = sequence
        self.maxCount = maxCount
        count = 0
    }
    
    public mutating func next() -> T.Element? {
        guard count < maxCount else {
            return nil
        }
        guard let nextValue = sequence.next() else {
            return nil
        }
        count += 1
        return nextValue
    }
}
