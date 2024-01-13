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
    private var jokesFactory: JokesFactory = JokesFactory()
    private var currentJoke: JokeModel?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews(views: [jokeIdStack, jokeTypeStack, jokeSetupStack, refreshButton, showButton])
        
        guard let someJoke = jokesFactory.showNextJoke() else {
            return
        }
        
        currentJoke = someJoke
        showJoke(model: someJoke)
    }
    
    // MARK: - IB Actions
    @IBAction private func refreshButton(_ sender: Any) {
        
        guard let nextJoke = jokesFactory.showNextJoke() else {
            return
        }
        
        currentJoke = nextJoke
        self.showJoke(model: nextJoke)
    }
    
    
    @IBAction private func showButton(_ sender: Any) {
        guard let currentJoke = currentJoke else {
            return
        }
        
        showPunchline(from: currentJoke)
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
            guard let newJoke = self.jokesFactory.showNextJoke() else {
                return
            }
            
            self.currentJoke = newJoke
            self.showJoke(model: newJoke)
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}
