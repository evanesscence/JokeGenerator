import Foundation

class JokesFactory: JokesFactoryProtocol {
    private let jokesLoader: JokesLoader
    weak var delegate: JokesFactoryDelegate?
    
    private var jokes: [JokeModel] = []
    
    init(jokesLoader: JokesLoader, delegate: JokesFactoryDelegate?) {
        self.jokesLoader = jokesLoader
        self.delegate = delegate
    }
    
    func showNextJoke() {
        guard let index = (0..<jokes.count).randomElement() else {
            delegate?.didRecieveJoke(joke: nil)
            return
        }
        
        let joke = jokes[index]
        delegate?.didRecieveJoke(joke: joke)
    }
    
    func loadData() {
        jokesLoader.loadJokes { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let joke):
                self.jokes = [joke]
                self.delegate?.didLoadDataFromServer()
            case .failure(let error):
                self.delegate?.didFailToLoadData(with: error)
            }
        }
    }
}
