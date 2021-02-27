//
//  EnvironmentConfig.swift
//  demoProj
//
//  Created by Ronak Shahstri on 2021-02-27.
//

import Foundation

struct EnvironmentConfig {
    struct pathKey {
        static var vanueSearch: String {return "search"}
    }
    
    static var FoursquareApiList:[String: String] {
        return NSDictionary(contentsOfFile: FoursquareApiFilePath) as? [String:String] ?? [:]
    }
    
    private static var FoursquareApiFilePath: String {
        return Bundle.main.path(forResource: "FoursquareApis", ofType: "plist")!
    }
}
