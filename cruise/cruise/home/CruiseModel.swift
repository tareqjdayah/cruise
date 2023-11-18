

import Foundation

struct CruiseModel : Decodable {
    let name : String
    let description : String
    let price : String
    let type: CruiseType
    
    let ship: String
    let nights: String
    let visitingPlaces: String
    let ports: String
}

enum CruiseType: String, Decodable {
    case Bahamas
    case Caribbean
    case Cuba
    case Sampler
    case Star
}
