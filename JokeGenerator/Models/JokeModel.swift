import Foundation

struct JokeModel: Codable {
    let jokeId: String
    let type: String
    let setup: String
    let punchline: String
}
