import XCTest
@testable import SequenceKit

final class SequenceKitTests: XCTestCase {
    
    func testFibonacciSequence() {
        for value in FibonacciSequence<Int>(length: 10) {
            print(value)
        }
    }
    
    func testFiniteSequence() {
        for value in FiniteSequence(FibonacciSequence<Double>(), maxCount: 10) {
            print(value)
        }
    }
    
    func testClampedSequence() {
        var sequence = ClampedSequence(FibonacciSequence<Int>(), range: 2...20)
        for _ in 1...10 {
            let value = sequence.next()!
            print(value)
        }
    }
    
    func testFiniteClampedSequence() {
        for value in FiniteSequence(ClampedSequence(FibonacciSequence<Double>(), range: 2...20), maxCount: 20) {
            print(value)
        }
    }
    
    func testJitteredSequence() {
        for value in FiniteSequence(JitteredSequence(FibonacciSequence<Double>(), intervalInPercent: 2), maxCount: 20) {
            print(value)
        }
    }
    
    func testExponentialSequence() {
        for value in ExponentialSequence(base: 2, startExponent: 0, length: 10) {
            print(value)
        }
    }

    static var allTests = [
        ("testFibonacci", testFibonacciSequence),
        ("testFiniteSequence", testFiniteSequence),
        ("testClampedSequence", testClampedSequence),
        ("testFiniteClampedSequence", testClampedSequence),
        ("testJitteredSequence", testJitteredSequence),
    ]
}
