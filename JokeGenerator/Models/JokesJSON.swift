import Foundation

struct JokesJSON: Codable {
    let type: String
    let setup: String
    let punchline: String
    let id: String
}
