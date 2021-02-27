//
//  CoffeePlacesTableViewModel.swift
//  demoProj
//
//  Created by Ronak Shahstri on 2021-02-27.
//

import Foundation

struct Address {
    var addressLine1: String
    var addressLine2: String
    var city: String
}

class CoffeePlacesViewModel {
    var listVanues = [Venue]()
    
    func fetchVanues() {
        let queries: [String: String] = [
                FoursquareApi.queryParamsStrings.ll.rawValue: "37.77518694034222, -122.39788356139775",
                FoursquareApi.queryParamsStrings.query.rawValue: "coffee",
                FoursquareApi.queryParamsStrings.limit.rawValue: "15"]
        VanueSearchApi.fetchData(api: VanueSearchApi(queryParams: queries)) { (vanues) in
            self.listVanues = vanues
        } failure: { (error) in
            print(error)
        }
    }
    
}


