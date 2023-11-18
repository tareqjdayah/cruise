
import Foundation

class HomeViewModel {

    func fetchCruiseList() -> [CruiseModel] {
        // Dummy data for demonstration purposes:
        return [
            CruiseModel(name: "Bahamas Cruise", description: "Description for Bahamas Cruise", price: "79", type: .Bahamas, ship: "Ship A", nights: "3", visitingPlaces: "Place A, Place B", ports: "Port A, Port B"),
            CruiseModel(name: "Caribbean Cruise", description: "Description for Caribbean Cruise", price: "89", type: .Caribbean, ship: "Ship B", nights: "5", visitingPlaces: "Place C, Place D", ports: "Port C, Port D"),
            CruiseModel(name: "Cuba Cruise", description: "Description for Cuba Cruise", price: "99", type: .Cuba, ship: "Ship C", nights: "7", visitingPlaces: "Place E, Place F", ports: "Port E, Port F"),
            CruiseModel(name: "Sampler Cruise", description: "Description for Sampler Cruise", price: "109", type: .Sampler, ship: "Ship D", nights: "2", visitingPlaces: "Place G, Place H", ports: "Port G, Port H"),
            CruiseModel(name: "Star Cruise", description: "Description for Star Cruise", price: "119", type: .Star, ship: "Ship E", nights: "6", visitingPlaces: "Place I, Place J", ports: "Port I, Port J")
        ]
    }


    
    func fetchCruises(forType type: String) -> [CruiseModel] {
          // Mockup filtering logic
        return fetchCruiseList().filter { $0.type.rawValue == type }
      }
}
