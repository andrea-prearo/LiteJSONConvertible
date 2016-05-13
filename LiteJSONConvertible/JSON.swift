//
//  JSON.swift
//  LiteJSONConvertible
//
//  Created by Prearo, Andrea on 4/16/16.
//
//

import Foundation

public typealias JSON = AnyObject

public func JSONParse<T>(object: JSON?) -> T? {
    return object as? T
}

public func JSONArray(object: JSON?) -> [JSON]? {
    return object as? [JSON]
}
