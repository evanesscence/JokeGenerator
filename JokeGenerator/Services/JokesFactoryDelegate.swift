import Foundation

protocol JokesFactoryDelegate: AnyObject {
    func didRecieveJoke(joke: JokeModel?)
}
