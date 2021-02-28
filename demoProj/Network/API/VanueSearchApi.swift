//
//  VanueSearchApi.swift
//  demoProj
//
//  Created by Ronak Shahstri on 2021-02-27.
//

import Foundation

typealias SuccessResponseVanueList = (_ tsnResponseModel: [Venue]) -> Void

class VanueSearchApi: FoursquareApi {
    override var uri: String {
        if let path = EnvironmentConfig.FoursquareApiList[EnvironmentConfig.pathKey.vanueSearch] {
            return String(format: "%@%@", VanueSearchApi.baseUrl, path)
        } else {
            fatalError("path needs to be defined in FoursquareApis.plist file.")
        }
    }
    
    init(queryParams: [String: String]) {
        super.init()
        for (key, value) in queryParams {
            self.queryParams[key] = value
        }
    }
        
    func fetchData(success: @escaping SuccessResponseVanueList, failure: @escaping Failure) {
        ApiClient().execute(api: self, params: self.queryParams, success: { (data) in
            //This is first demo of using CODABLE protocol. 
            if let fullResponse = try? JSONDecoder().decode(VanueSearchResponseModel.self, from: data) {
                success(fullResponse.response.venues)
            }
        }) { (error) in
            print(error)
            //In the fallback scenario I will use local test data.
            //Actually Foursquare API was not consistance for me.
            //Response was ON/OFF for me. So I copied it in local JSON file.
            //And finish integration of the app with static data as my purpose was just to demo.
            if let testJsonData = self.readLocalTestData() {
                print("Using Local test data as fall back from failed web response.")
                if let fullResponse = try? JSONDecoder().decode(VanueSearchResponseModel.self, from: testJsonData) {
                    success(fullResponse.response.venues)
                }
            }
        }
    }
    
    func readLocalTestData() -> Data? {
        if let path = Bundle.main.path(forResource: "VanuesSearch", ofType: "json") {
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
