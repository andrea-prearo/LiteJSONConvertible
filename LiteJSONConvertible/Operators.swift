//
//  Operators.swift
//  LiteJSONConvertible
//
//  Created by Prearo, Andrea on 4/9/16.
//
//

import Foundation

// Functional operators code from:
// https://robots.thoughtbot.com/efficient-json-in-swift-with-functional-concepts-and-generics

infix operator >>> { associativity left precedence 150 } // Swift version of bind (>>=)

public func >>><T,U>(t: T?, f: T -> U?) -> U? {
    if let x = t {
        return f(x)
    } else {
        return .None
    }
}
