//
//  CoffeePlacesTableViewModel.swift
//  demoProj
//
//  Created by Ronak Shahstri on 2021-02-23.
//

import Foundation

struct Address {
    var addressLine1: String
    var addressLine2: String
    var city: String
}

struct Vanue {
    var title: String
    var likes: Int
    var address: Address
    var photoUrl: String
}

class CoffeePlacesViewModel {
    var listVanues: [Vanue]?
    
    func fetchVanues() {
        listVanues?.append(Vanue(title: "WonderCoffee", likes: 1080, address: Address(addressLine1: "35 my st", addressLine2: "near this", city: "SF"), photoUrl: ""))
        listVanues?.append(Vanue(title: "WonderCoffee2", likes: 1080, address: Address(addressLine1: "35 my st", addressLine2: "near this", city: "SF"), photoUrl: ""))
        listVanues?.append(Vanue(title: "WonderCoffee3", likes: 1080, address: Address(addressLine1: "35 my st", addressLine2: "near this", city: "SF"), photoUrl: ""))
    }
    
}


