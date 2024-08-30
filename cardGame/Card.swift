import Foundation

struct Card {
    let value: Int
    let suit: String
    
    var imageName: String {
        let paddedValue = String(format: "%02d", value)
        return "\(paddedValue)_of_\(suit)"
    }
    
    init(value: Int, suit: String) {
        self.value = value
        self.suit = suit
    }
    
    static func getValue(from cardName: String) -> Int {
        let components = cardName.split(separator: "_")
        if let valueString = components.first,
           let value = Int(valueString) {
            return value
        }
        return 0
    }
    
    static func createImageName(value: Int, suit: String) -> String {
        let paddedValue = String(format: "%02d", value)
        return "\(paddedValue)_of_\(suit)"
    }
}
