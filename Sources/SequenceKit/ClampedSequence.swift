//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

/// Clamps the values returned by the wrapped sequence to range.
///
/// Example:
/// ´´´
/// for i in ClampedSequence(FibonacciSequence(length: 10), range: 1...20) {
///     print(i)
/// }
/// ´´´
public struct ClampedSequence<T: Sequence & IteratorProtocol>: Sequence, IteratorProtocol where T.Element: Comparable {
    
    private var sequence: T
    private var range: ClosedRange<T.Element>
    
    public init(_ sequence: T, range: ClosedRange<T.Element>) {
        self.sequence = sequence
        self.range = range
    }
    
    public mutating func next() -> T.Element? {
        guard let nextValue = sequence.next() else {
            return nil
        }
        if nextValue < range.lowerBound {
            return range.lowerBound
        } else if nextValue > range.upperBound {
            return range.upperBound
        } else {
            return nextValue
        }
    }
}

