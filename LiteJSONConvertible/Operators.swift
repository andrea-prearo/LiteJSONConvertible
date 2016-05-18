//
//  Operators.swift
//  LiteJSONConvertible
//
//  Created by Andrea Prearo on 4/9/16.
//  Copyright © 2016 Andrea Prearo
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

// Decoding Operators
// https://robots.thoughtbot.com/real-world-json-parsing-with-swift

infix operator <|  { associativity left precedence 150 }
infix operator <||  { associativity left precedence 150 }

public func <|<T>(json: JSON, key: String) -> T? {
    return json[key] >>> JSONParse
}

public func <||<T>(json: JSON, key: String) -> [T]? {
    return json <| key
}
