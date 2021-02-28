

import SwiftyJSON
import Foundation

struct VenueDetailsResponseModel {
    var id: String
    var likeCount: Int
    var imageUrl: String
    init(json: JSON) {
        id = json["id"].string ?? ""
        likeCount = json["likes"]["count"].int ?? 0
        let preFfix = json["photos"]["groups"][0]["items"][0]["prefix"].string ?? ""
        let suFfix = json["photos"]["groups"][0]["items"][0]["suffix"].string ?? ""
        imageUrl = String(format: "%@75x75%@", preFfix,suFfix)
    }
}
