// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let vanueDetailResponseModel = try? newJSONDecoder().decode(VanueDetailResponseModel.self, from: jsonData)

import Foundation

// MARK: - VanueDetailResponseModel
struct VanueSearchResponseModel: Codable {
    let meta: Meta
    let response: Response
}

// MARK: - Meta
struct Meta: Codable {
    let code: Int
    let requestID: String
    
    enum CodingKeys: String, CodingKey {
        case code
        case requestID = "requestId"
    }
}

// MARK: - Response
struct Response: Codable {
    let venues: [Venue]
}

// MARK: - Venue
struct Venue: Codable {
    let id, name: String
    let location: Location
    let categories: [Category]
    let referralID: ReferralID
    let hasPerk: Bool
    let venuePage: VenuePage?
    
    enum CodingKeys: String, CodingKey {
        case id, name, location, categories
        case referralID = "referralId"
        case hasPerk, venuePage
    }
}

// MARK: - Category
struct Category: Codable {
    let id: ID
    let name: Name
    let pluralName: PluralName
    let shortName: Name
    let icon: Icon
    let primary: Bool
}

// MARK: - Icon
struct Icon: Codable {
    let iconPrefix: String
    let suffix: Suffix
    
    enum CodingKeys: String, CodingKey {
        case iconPrefix = "prefix"
        case suffix
    }
}

enum Suffix: String, Codable {
    case png = ".png"
}

enum ID: String, Codable {
    case the4Bf58Dd8D48988D1E0931735 = "4bf58dd8d48988d1e0931735"
}

enum Name: String, Codable {
    case coffeeShop = "Coffee Shop"
}

enum PluralName: String, Codable {
    case coffeeShops = "Coffee Shops"
}

// MARK: - Location
struct Location: Codable {
    let address: String
    let crossStreet: String?
    let lat, lng: Double
    let labeledLatLngs: [LabeledLatLng]
    let distance: Int
    let postalCode: String
    let cc: Cc
    let neighborhood: String?
    let city: City
    let state: State
    let country: Country
    let formattedAddress: [String]
}

enum Cc: String, Codable {
    case us = "US"
}

enum City: String, Codable {
    case sanFrancisco = "San Francisco"
}

enum Country: String, Codable {
    case unitedStates = "United States"
}

// MARK: - LabeledLatLng
struct LabeledLatLng: Codable {
    let label: Label
    let lat, lng: Double
}

enum Label: String, Codable {
    case display = "display"
    case entrance = "entrance"
}

enum State: String, Codable {
    case ca = "CA"
}

enum ReferralID: String, Codable {
    case v1614706119 = "v-1614706119"
}

// MARK: - VenuePage
struct VenuePage: Codable {
    let id: String
}
