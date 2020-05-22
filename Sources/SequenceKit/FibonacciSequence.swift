//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

/// Example:
/// ´´´
/// for i in FibonacciSequence(length: 5) {
///     print(i)
/// }
/// ´´´
public struct FibonacciSequence<Value: InitializableFromInt>: Sequence, IteratorProtocol {
    
    public private(set) var iteration: Int = 0
    public private(set) var currentValue: Int = 0
    public private(set) var nextValue: Int = 1
    
    private let shouldEnd: (FibonacciSequence) -> Bool
    
    public init(length: Int = .max) {
        self.init() {
            return $0.iteration == length
        }
    }
    
    public init(until condition: @escaping (FibonacciSequence) -> Bool) {
        shouldEnd = condition
    }
    
    public mutating func next() -> Value? {
        if shouldEnd(self) {
            return nil
        } else {
            let sum = currentValue + nextValue
            currentValue = nextValue
            nextValue = sum
            iteration += 1
            return Value(currentValue)
        }
    }
}

public protocol InitializableFromInt {
    init(_ value: Int)
}

extension Int: InitializableFromInt {
}

extension Float: InitializableFromInt {
}

extension Double: InitializableFromInt {
}
