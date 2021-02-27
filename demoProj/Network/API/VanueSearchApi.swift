//
//  VanueSearchApi.swift
//  demoProj
//
//  Created by Ronak Shahstri on 2021-02-27.
//

import Foundation
import SwiftyJSON

typealias SuccessResponseModel = (_ tsnResponseModel: [Venue]) -> Void

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
        
    func fetchData(success: @escaping SuccessResponseModel, failure: @escaping Failure) {
        ApiClient().execute(api: self, params: self.queryParams, success: { (data) in
            if let fullResponse = try? JSONDecoder().decode(Welcome.self, from: data) {
                success(fullResponse.response.venues)
            }
        }) { (error) in
            print(error)
            //In the fallback scenario I will use local test data.
            if let testJsonData = VanueSearchApi.readLocalTestData() {
                print("Using Local test data as fall back from failed web response.")
                if let fullResponse = try? JSONDecoder().decode(Welcome.self, from: testJsonData) {
                    success(fullResponse.response.venues)
                }
            }
        }
    }
    
    static func readLocalTestData() -> Data? {
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
