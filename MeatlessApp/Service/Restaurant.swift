import Foundation

// STORY 1: Implement the Restaurant and MenuItem models.
struct Restaurant: Decodable {
    let name: String
    let distance: String
    let status: String
    let openDays: String
    let image: String
    let menu: Array<MenuItem>
}

struct MenuItem: Decodable {
    let name: String
    let price: Double
    let image: String
}
