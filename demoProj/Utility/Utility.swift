//
//  Utility.swift
//  demoProj
//
//  Created by Ronak Shahstri on 2021-02-27.
//

import Foundation

struct Utility {
    static func reduceString(array: [String]) -> String {
        return array.reduce("") { (val1, val2) -> String in
            String(format: "%@\n%@", val1, val2)
        }
    }
}
