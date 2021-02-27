//
//  CoffeePlacesTableViewModel.swift
//  demoProj
//
//  Created by Ronak Shahstri on 2021-02-27.
//

import Foundation

typealias SuccessViewModel = (_ vanues: [Venue]) -> Void

struct Address {
    var addressLine1: String
    var addressLine2: String
    var city: String
}

class CoffeePlacesViewModel {
    var listVanues: [Venue]?
    
    func fetchVanues(success: @escaping SuccessViewModel, failure: @escaping Failure) {
        let queries: [String: String] = [
                FoursquareApi.queryParamsStrings.ll.rawValue: "37.77518694034222, -122.39788356139775",
                FoursquareApi.queryParamsStrings.query.rawValue: "coffee",
                FoursquareApi.queryParamsStrings.limit.rawValue: "15"]
        VanueSearchApi(queryParams: queries).fetchData(){ [weak self] (vanues) in
            guard let strongSelf = self else { return }
            strongSelf.listVanues = vanues
            success(vanues)
        } failure: { (error) in
            print(error)
            failure(error)
        }
    }
    
    func getFullAddress(addressArray: [String]) -> String {
        return addressArray.reduce("") { (val1, val2) -> String in
            String(format: "%@\n%@", val1, val2)
        }
    }
    
}


