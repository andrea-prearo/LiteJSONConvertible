//
//  Operators.swift
//  LiteJSONConvertible
//
//  Created by Prearo, Andrea on 4/9/16.
//
//

import Foundation

// Functional operators code from:
// http://chris.eidhof.nl/posts/json-parsing-in-swift.html

infix operator >>>= {}

public func >>>= <T,U>(optional : T?, f : T -> U?) -> U? {
    return flatten(optional.map(f))
}

public func flatten<T>(x: T??) -> T? {
    if let y = x { return y }
    return nil
}
