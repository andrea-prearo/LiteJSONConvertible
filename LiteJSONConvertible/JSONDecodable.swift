//
//  JSONDecodable.swift
//  LiteJSONConvertible
//
//  Created by Andrea Prearo on 4/5/16.
//  Copyright © 2016 Andrea Prearo
//

import Foundation

public protocol JSONDecodable {
    typealias DecodableType
//    associatedtype DecodableType
    
    static func decode(json: JSON) -> DecodableType?
    static func decode(json: JSON?) -> DecodableType?
    static func decode(json: [JSON]) -> [DecodableType?]
    static func decode(json: [JSON]?) -> [DecodableType?]
}

public extension JSONDecodable {
    
    static func decode(json: JSON?) -> DecodableType? {
        guard let json = json else { return nil }
        return decode(json)
    }
    
    static func decode(json: [JSON]) -> [DecodableType?] {
        return json.map(decode)
    }
    
    static func decode(json: [JSON]?) -> [DecodableType?] {
        guard let json = json else { return [] }
        return decode(json)
    }
    
}
