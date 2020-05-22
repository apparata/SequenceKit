//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

/// Produces a sequence of exponentially increasing values given a base.
///
/// Example:
/// ´´´
/// for i in ExponentialSequence(length: 5) {
///     print(i)
/// }
/// ´´´
public struct ExponentialSequence: Sequence, IteratorProtocol {
    
    public private(set) var exponent: Int
    
    private let shouldEnd: (ExponentialSequence) -> Bool
    
    public init(base: Double = 2, startExponent: Int = 0, length: Int = .max) {
        self.init(base: base, startExponent: startExponent) {
            return $0.exponent == length
        }
    }
    
    public init(base: Double = 2,
                startExponent: Int = 0,
                until condition: @escaping (ExponentialSequence) -> Bool) {
        exponent = startExponent
        shouldEnd = condition
    }
    
    public mutating func next() -> Double? {
        if shouldEnd(self) {
            return nil
        } else {
            let nextValue = pow(2, Double(exponent))
            exponent += 1
            return nextValue
        }
    }
}

