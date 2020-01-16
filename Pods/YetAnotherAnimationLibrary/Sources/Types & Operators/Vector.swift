// The MIT License (MIT)
//
// Copyright (c) 2016 Luke Zhao <me@lkzhao.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import simd

public typealias Vector1 = Double
public typealias Vector2 = SIMD2<Double>
public typealias Vector3 = SIMD2<Double>
public typealias Vector4 = SIMD2<Double>

public protocol VectorType: ExpressibleByArrayLiteral {
    init()

    static var zero: Self { get }
    // for looping all values one by one, not used internally
    static var rawValueCount: Int { get }
    subscript(index: Int) -> Double { get set }

    // arithmetic
    static func + (lhs: Self, rhs: Self) -> Self
    static func - (lhs: Self, rhs: Self) -> Self
    static func * (lhs: Self, rhs: Self) -> Self
    static func / (lhs: Self, rhs: Self) -> Self
    static func * (lhs: Double, rhs: Self) -> Self
    static func * (lhs: Self, rhs: Double) -> Self
    static func / (lhs: Self, rhs: Double) -> Self
    func distance(between: Self) -> Double
}

// implements VectorConvertible, so that all VectorType conform to VectorConvertible
extension VectorType {
    public typealias Vector = Self
    public static func from(vector: Self) -> Self {
        return vector
    }
    public var vector: Self {
        return self
    }
}

extension Double: VectorType, VectorConvertible {
    public static var zero = 0.0
    public static var rawValueCount: Int { return 1 }
    public subscript(x: Int) -> Double {
        get { return self }
        set { self = newValue }
    }
    public init(arrayLiteral elements: Double...) {
        self = elements[0]
    }
    public func distance(between: Double) -> Double {
        return abs(self - between)
    }
}

extension double2: VectorType, VectorConvertible {
    public static var zero = SIMD2<Double>()
    public static var rawValueCount: Int { return 2 }
    public func distance(between: SIMD2<Double>) -> Double {
        return simd.distance(self, between)
    }
}

extension double3: VectorType, VectorConvertible {
    public static var zero = SIMD3<Double>()
    public static var rawValueCount: Int { return 3 }
    public func distance(between: SIMD3<Double>) -> Double {
        return simd.distance(self, between)
    }
}

extension double4: VectorType, VectorConvertible {
    public static var zero = SIMD4<Double>()
    public static var rawValueCount: Int { return 4 }
    public func distance(between: SIMD4<Double>) -> Double {
        return simd.distance(self, between)
    }
}
