import Foundation

protocol JokesLoading {
    func loadJokes(handler: @escaping (Result<JokeModel, Error>) -> Void)
}

struct JokesLoader: JokesLoading {
    private let networkClient = NetworkClient()
    
    // MARK: - URL
    private var jokesUrl: URL {
        guard let url = URL(string: "https://official-joke-api.appspot.com/jokes/random") else {
            preconditionFailure("Unable to construct jokeUrl")
        }
        return url
    }
    
    func loadJokes(handler: @escaping (Result<JokeModel, Error>) -> Void) {
        networkClient.fetch(url: jokesUrl) { result in
            switch result {
            case .success(let data):
                do {
                    let joke = try JSONDecoder().decode(JokeModel.self, from: data)
                    handler(.success(joke))
                } catch {
                    handler(.failure(error))
                }
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
