//
//  CoffeePlacesTableViewModel.swift
//  demoProj
//
//  Created by Ronak Shahstri on 2021-02-27.
//

import Foundation
import UIKit

typealias SuccessViewModel = (_ vanues: [VenueViewModel]) -> Void

struct Address {
    var addressLine1: String
    var addressLine2: String
    var city: String
}

struct VenueViewModel {
    var id: String
    var venue: Venue
    var likes: Int?
    var imageUrl: String?
}

protocol CoffeePlacesViewModelDelegate {
    func viewModelUpdated(indexPath: IndexPath)
}

class CoffeePlacesViewModel {
    var listVanues: [VenueViewModel] = [VenueViewModel]()
    var delegate: CoffeePlacesViewModelDelegate?
    
    //This is the demo of one method (completion handeler) to communicate between ViewController and ViewModel.
    func fetchVanues(success: @escaping SuccessViewModel, failure: @escaping Failure) {
        let queries: [String: String] = [
                FoursquareApi.queryParamsStrings.ll.rawValue: "37.77518694034222, -122.39788356139775",
                FoursquareApi.queryParamsStrings.query.rawValue: "coffee",
                FoursquareApi.queryParamsStrings.limit.rawValue: "15"]
        VanueSearchApi(queryParams: queries).fetchData(){ [weak self] (vanues) in
            guard let strongSelf = self else { return }
            strongSelf.listVanues = strongSelf.generateVenueViewModels(vanues)
            //Details call.
            for (index, item) in strongSelf.listVanues.enumerated() {
                strongSelf.fetchVanueDetails(vanueId: item.id) {[weak self] _ in
                    guard let strongSelf = self else { return }
                    strongSelf.delegate?.viewModelUpdated(indexPath: IndexPath(row: index, section: 0))
                } failure: { (error) in
                    print(error)
                }
            }
            success(strongSelf.listVanues)
        } failure: { (error) in
            print(error)
            failure(error)
        }
    }
    
    func generateVenueViewModels(_ venues: [Venue]) -> [VenueViewModel] {
        var listViewModel = [VenueViewModel]()
        for item in venues {
            listViewModel.append(VenueViewModel(id: item.id,
                                                venue: item,
                                                likes: nil,
                                                imageUrl: nil))
        }
        return listViewModel
    }
    
    func fetchVanueDetails(vanueId: String, success: @escaping SuccessViewModel, failure: @escaping Failure) {
        VanueDetailsApi(vanueId: vanueId).fetchVenueDetails { [weak self] (vanue) in
            guard let strongSelf = self else { return }
            if let index = strongSelf.findIndex(vanue.id) {
                strongSelf.listVanues[index].likes = vanue.likeCount
                strongSelf.listVanues[index].imageUrl = vanue.imageUrl
            }
            success(strongSelf.listVanues)
        } failure: { (error) in
            print(error)
            failure(error)
        }
    }
    
    private func findIndex(_ id: String) -> Int? {
        for (index,item) in listVanues.enumerated() {
            if (item.id == id) {
                return index
            }
        }
        return nil
    }
    
    func getDetailsOfVanue(_ vanueId: String) -> String {
        var details = ""
        if let venueViewModel = self.listVanues.filter({$0.id == vanueId}).first {
            let fullAddress = Utility.reduceString(array: venueViewModel.venue.location.formattedAddress)
            details.append(fullAddress)
            if let likes = venueViewModel.likes {
                details.append(String(format: "\nLiked by: %@", String(likes)))
            }
        }
        return details
    }
    
    func getThumbImageUrl(_ vanueId: String) -> String {
        if let venueViewModel = self.listVanues.filter({$0.id == vanueId}).first {
            if let imageUrl = venueViewModel.imageUrl {
                return imageUrl
            }
        }
        return ""
    }
}


