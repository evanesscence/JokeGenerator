import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet private var jokeIdStack: UIStackView!
    @IBOutlet private var jokeTypeStack: UIStackView!
    @IBOutlet private var jokeSetupStack: UIStackView!
    
    @IBOutlet private var jokeId: UILabel!
    @IBOutlet private var jokeType: UILabel!
    @IBOutlet private var jokeSetup: UILabel!
    
    @IBOutlet private var refreshButton: UIButton!
    @IBOutlet private var showButton: UIButton!
    
    // MARK: Private properties
    private var currentJokeIndex = 0
    
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
            punchline: "Because they arrr!")
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews(views: [jokeIdStack, jokeTypeStack, jokeSetupStack, refreshButton, showButton])
        
        let someJoke = jokes[currentJokeIndex]
        showJoke(model: someJoke)
    }
    
    // MARK: - IB Actions
    @IBAction private func refreshButton(_ sender: Any) {
        currentJokeIndex += 1
    }
    
    
    @IBAction private func showButton(_ sender: Any) {
        showPunchline(from: jokes[currentJokeIndex])
    }

    // MARK: Private functions
    private func setViews(views: [UIView]) {
        views.forEach {
            $0.layer.cornerRadius = 8
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.rBlack.cgColor
        }
    }
    
    private func showJoke(model: JokeModel) {
        jokeId.text = model.jokeId
        jokeType.text = model.type
        jokeSetup.text = model.setup
    }
    
    private func showPunchline(from joke: JokeModel) {
        let alert = UIAlertController(
        title: "Punchline",
        message: joke.punchline,
        preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.currentJokeIndex += 1
            
            let newJoke = self.jokes[self.currentJokeIndex]
            self.showJoke(model: newJoke)
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

