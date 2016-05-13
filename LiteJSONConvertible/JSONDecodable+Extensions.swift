//
//  Extensions.swift
//  LiteJSONConvertible
//
//  Created by Prearo, Andrea on 5/1/16.
//
//

import Foundation

extension String: JSONDecodable {

    public static func decode(json: JSON) -> String? {
        return json >>> JSONParse
    }
    
}

extension Bool: JSONDecodable {
    
    public static func decode(json: JSON) -> Bool? {
        return json >>> JSONParse
    }
    
}

extension Int: JSONDecodable {
    
    public static func decode(json: JSON) -> Int? {
        return json >>> JSONParse
    }
    
}

extension Float: JSONDecodable {
    
    public static func decode(json: JSON) -> Float? {
        return json >>> JSONParse
    }
    
}

extension Double: JSONDecodable {
    
    public static func decode(json: JSON) -> Double? {
        return json >>> JSONParse
    }
    
}
