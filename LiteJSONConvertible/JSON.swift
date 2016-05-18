//
//  JSON.swift
//  LiteJSONConvertible
//
//  Created by Andrea Prearo on 4/16/16.
//  Copyright © 2016 Andrea Prearo
//

import Foundation

public typealias JSON = AnyObject

public func JSONParse<T>(object: JSON?) -> T? {
    return object as? T
}
