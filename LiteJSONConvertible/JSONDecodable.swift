//
//  JSONDecodable.swift
//  LiteJSONConvertible
//
//  Created by Prearo, Andrea on 4/5/16.
//
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
