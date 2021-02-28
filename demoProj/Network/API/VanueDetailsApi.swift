//
//  VanueDetailsApi.swift
//  demoProj
//
//  Created by Ronak Shahstri on 2021-02-27.
//

import Foundation
import SwiftyJSON

typealias SuccessResponseVanue = (_ tsnResponseModel: VenueDetailsResponseModel) -> Void

class VanueDetailsApi: FoursquareApi {
    override var uri: String {
        if let path = EnvironmentConfig.FoursquareApiList[EnvironmentConfig.pathKey.vanueDetails] {
            var path = String(format: "%@%@", VanueSearchApi.baseUrl, path)
            path = path.replacingOccurrences(of: FoursquareApi.PathParamsStrings.vanueId.rawValue,
                                             with: self.vanueId)
            print(path)
            return path
        } else {
            fatalError("path needs to be defined in FoursquareApis.plist file.")
        }
    }
    
    var vanueId: String = ""
    
    init(vanueId: String) {
        super.init()
        self.vanueId = vanueId
    }
    
    func fetchVenueDetails(success: @escaping SuccessResponseVanue, failure: @escaping Failure) {
        ApiClient().execute(api: self, params: self.queryParams, success: { (data) in
            if let json = try? JSON(data: data) {
                let venue = json["response"]["venue"]
                let venueDetails = VenueDetailsResponseModel(json: venue)
                success(venueDetails)
            }
        }) { (error) in
            print(error)
            //In the fallback scenario I will use local test data.
            if let testJsonData = self.readLocalTestData() {
                print("Using Local test data as fall back from failed web response.")
                if let json = try? JSON(data: testJsonData) {
                    let venue = json["response"]["venue"]
                    let venueDetails = VenueDetailsResponseModel(json: venue)
                    success(venueDetails)
                }
            }
        }
    }
    
    func readLocalTestData() -> Data? {
        if let path = Bundle.main.path(forResource: "VanueDetails", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                fatalError("No local json file found for vanue search.")
            }
        }
        return nil
    }
}
