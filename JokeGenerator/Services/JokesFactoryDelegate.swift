import Foundation

protocol JokesFactoryDelegate: AnyObject {
    func didRecieveJoke(joke: JokeModel?)
    func didLoadDataFromServer()
    func didFailToLoadData(with error: Error)
}
