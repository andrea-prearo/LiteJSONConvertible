#LiteJSONConvertible

A minimalistic approach to JSON parsing

1. [Features](#features)
2. [Requirements](#requirements)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Notes](#notes)

## Features
- Gereric protocol with associated type
- Generic functions
- Functional composition

## Requirements
- iOS 8.0 or newer
- Swift 2.2 or newer
- CocoaPods 0.38 or newer

## Installation
Add the following line to your [`Podfile`](http://guides.cocoapods.org/using/the-podfile.html) to be able to install `LiteJSONConvertible` using [CocoaPods](https://cocoapods.org/):  
```ruby
pod 'LiteJSONConvertible', '~> 0.0.5'
```
You also need to make sure you're opting into using frameworks and targetin iOS8 or newer:
```ruby
use_frameworks!

platform :ios, '8.0'
```

## Usage

## Array of primitive types

#### String
```json
["item1", "item2", "item3", "item4"]
```

```swift
// Retrieve the JSON content as NSData
if let json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) {
    let items = json.map(String.decode)
}
```

#### Bool
```json
[true, false, true, false]
```

```swift
// Retrieve the JSON content as NSData
if let json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [JSON] {
    let items = json.map(Bool.decode)
}
```

#### Int
```json
[1001, 1002, 1003, 1004]
```

```swift
// Retrieve the JSON content as NSData
if let json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [JSON] {
    let items = json.map(Int.decode)
}
```

#### Float
```json
[1001.1, 1002.2, 1003.3, 1004.4]
```

```swift
// Retrieve the JSON content as NSData
if let json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [JSON] {
    let items = json.map(Float.decode)
}
```

#### Double
```json
[1001.1, 1002.2, 1003.3, 1004.4]
```

```swift
// Retrieve the JSON content as NSData
if let json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [JSON] {
    let items = json.map(Double.decode)
}
```


## Complex JSON content

Given a specific JSON content

```json
{
    "locations": [{
         "label": "Home",
         "data": {
             "address": "6925 Felicity Coves",
             "city": "East Davin",
             "state": "Washington",
             "country": "USA",
             "zipCode": "22998-1456"
         }
    },
    {
        "label": "Work",
        "data": {
            "address": "0506 Gretchen River",
            "city": "Huntington Beach",
            "state": "Connecticut",
            "country": "USA",
            "zipCode": "61182-9561"
        }
    }]
}
```

define the appropriate classes/structs to parse it:

```swift
import LiteJSONConvertible

struct LocationData {
    
    let address: String?
    let city: String?
    let state: String?
    let country: String?
    let zipCode: String?
    
    init(address: String?,
        city: String?,
        state: String?,
        country: String?,
        zipCode: String?) {
        self.address = address
        self.city = city
        self.state = state
        self.country = country
        self.zipCode = zipCode
    }
    
}

extension LocationData: JSONDecodable {
    
    static func decode(json: JSON) -> LocationData? {
        return LocationData(
            address: json <| "address",
            city: json <| "city",
            state: json <| "state",
            country: json <| "country",
            zipCode: json <| "zipCode")
    }
    
}

struct Location {
    
    let label: String?
    let data: LocationData?
    
    init(label: String?,
        data: LocationData?) {
        self.label = label
        self.data = data
    }
    
}

extension Location: JSONDecodable {
    
    static func decode(json: JSON) -> Location? {
        return Location(
            label: json <| "label",
            data: json <| "data" >>> LocationData.decode)
    }
    
}
```

Then, simply retrieve the JSON content as NSData (Web Service or file) and parse it:
```swift
// Retrieve the JSON content as NSData
if let json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) {
    let locations = json <|| "locations" >>> Location.decode
}
```

## Notes
This library is just an experiment on minimalistic JSON parsing using generic protocols. The basic ideas behind this approach are borrowed from the following articles:  
- [Parsing JSON in Swift](http://chris.eidhof.nl/posts/json-parsing-in-swift.html)
- [Efficient JSON in Swift with Functional Concepts and Generics](https://robots.thoughtbot.com/efficient-json-in-swift-with-functional-concepts-and-generics)
- [Real World JSON Parsing with Swift](https://robots.thoughtbot.com/real-world-json-parsing-with-swift)
