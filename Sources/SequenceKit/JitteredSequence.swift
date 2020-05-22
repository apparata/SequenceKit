//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

/// Jitters the values returned by wrapped sequence where the jitter interval
/// is based on a percentage of the magnitude of the value.
///
/// Example:
/// ´´´
/// for i in JitteredSequence(FibonacciSequence(length: 10), intervalInPercent: 25.0) {
///     print(i)
/// }
/// ´´´
public struct JitteredSequence<T: IteratorProtocol>: Sequence, IteratorProtocol where T.Element == Double {
    
    private var sequence: T
    private var interval: Double
    
    public init(_ sequence: T, intervalInPercent: Double) {
        self.sequence = sequence
        self.interval = intervalInPercent / 100.0
    }
    
    public mutating func next() -> Double? {
        guard let nextValue = sequence.next() else {
            return nil
        }
        return jittered(value: nextValue)
    }
    
    private func jittered(value: Double) -> Double {
        return value * (1 + interval * (Double.random(in: 0..<1) * 2.0 - 1.0))
    }
}
