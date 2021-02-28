//
//  FoursquareApi.swift
//  demoProj
//
//  Created by Ronak Shahstri on 2021-02-27.
//

import Foundation

protocol ApiProtocol {
    var uri: String { get }
    var queryParams: [String: String] {get set}
    var pathParams: [String: String] {get set}
}

class FoursquareApi: ApiProtocol {
    var pathParams: [String: String] = [String: String]()
    
    static let baseUrl = "https://api.foursquare.com/v2/"
    static let client_id = "NZSECKDSFUYTLAS310ES5ZH0JA4ZIX2XRUMWZUGV2KFT1DGO"
    static let client_secret = "2N2MFKKVJ2FIXA0J5H1OF2FDAKQ4IYNSYEMFGOPRAERWKXCA"
    static let v = "20200326"
    static let defaultQueries = [
        FoursquareApi.queryParamsStrings.client_id.rawValue: FoursquareApi.client_id,
        FoursquareApi.queryParamsStrings.client_secret.rawValue: FoursquareApi.client_secret,
        FoursquareApi.queryParamsStrings.v.rawValue: FoursquareApi.v
    ]
    
    var uri: String {
        fatalError("API uri Has to be overridden.")
    }
    
    var queryParams: [String: String] = [
        FoursquareApi.queryParamsStrings.client_id.rawValue: FoursquareApi.client_id,
        FoursquareApi.queryParamsStrings.client_secret.rawValue: FoursquareApi.client_secret,
        FoursquareApi.queryParamsStrings.v.rawValue: FoursquareApi.v
    ]
    
    enum queryParamsStrings: String {
        case client_id
        case client_secret
        case v
        case ll
        case query
        case limit
    }
    
    enum PathParamsStrings: String {
        case vanueId = "{{vanue_id}}"
    }
}
