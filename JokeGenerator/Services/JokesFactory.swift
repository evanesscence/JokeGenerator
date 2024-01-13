import Foundation

class JokesFactory {
    private let jokes: [JokeModel] = [
        JokeModel(
            jokeId: "148",
            type: "general",
            setup: "Is the pool safe for diving?",
            punchline: "It deep ends."),
        
        JokeModel(
            jokeId: "27",
            type: "general",
            setup: "Why are pirates called pirates?",
            punchline: "Because they arrr!"),
        
        JokeModel(
            jokeId: "355",
            type: "general",
            setup: "Why do pirates not know the alphabet?",
            punchline: "They always get stuck at \"C\"."),
        
        JokeModel(
            jokeId: "167",
            type: "general",
            setup: "What did the 0 say to the 8?",
            punchline: "ice belt.")
    ]
    
    
    func showNextJoke() -> JokeModel? {
        guard let index = (0..<jokes.count).randomElement() else {
            return nil
        }
        return jokes[index]
    }
}
