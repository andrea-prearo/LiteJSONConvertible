//
//  JSON.swift
//  LiteJSONConvertible
//
//  Created by Prearo, Andrea on 4/16/16.
//
//

import Foundation

public typealias JSON = [String: AnyObject]

public func parseString(input: JSON, key: String) -> String? {
    return input[key] >>>= { $0 as? String }
}

func parseNumber(input: JSON, key: String) -> NSNumber? {
    return input[key] >>>= { $0 as? NSNumber }
}

public func parseBool(input: JSON, key: String) -> Bool? {
    return parseNumber(input, key: key).map { $0.boolValue }
}

public func parseInt(input: JSON, key: String) -> Int? {
    return parseNumber(input, key: key).map { $0.integerValue }
}

public func parseFloat(input: JSON, key: String) -> Float? {
    return parseNumber(input, key: key).map { $0.floatValue }
}

public func parseDouble(input: JSON, key: String) -> Double? {
    return parseNumber(input, key: key).map { $0.doubleValue }
}
