import Foundation

class JokesFactory: JokesFactoryProtocol {
    private let jokesLoader: JokesLoading
    weak var delegate: JokesFactoryDelegate?
    
    private var jokes: JokeModel?
    
    init(jokesLoader: JokesLoading, delegate: JokesFactoryDelegate?) {
        self.jokesLoader = jokesLoader
        self.delegate = delegate
    }
    
    
    func showNextJoke() {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.delegate?.didRecieveJoke(joke: jokes)
            }
        }
    }
    
    func loadData() {
        jokesLoader.loadJokes { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case .success(let getJoke):
                    self.jokes = getJoke
                    self.delegate?.didLoadDataFromServer() // сообщаем, что данные загрузились
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

