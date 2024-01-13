import UIKit

class ViewController: UIViewController, JokesFactoryDelegate {
    
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
    private var jokesFactory: JokesFactoryProtocol?
    private var currentJoke: JokeModel?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews(views: [jokeIdStack, jokeTypeStack, jokeSetupStack, refreshButton, showButton])
        
        jokesFactory = JokesFactory(delegate: self)
        jokesFactory?.showNextJoke()
    }
    
    // MARK: - JokesFactoryDelegate
    func didRecieveJoke(joke: JokeModel?) {
        guard let joke = joke else {
            return
        }
        
        currentJoke = joke
        DispatchQueue.main.async { [weak self] in
            self?.showJoke(model: joke)
        }
    }
    
    // MARK: - IB Actions
    @IBAction private func refreshButton(_ sender: Any) {
        jokesFactory?.showNextJoke()
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
        let punchlineAlert = AlertModel(
            title: "Puncline",
            message: joke.punchline,
            buttonText: "OK") { [weak self] in
                guard let self = self else {
                    return
                }
                self.jokesFactory?.showNextJoke()
            }
        
        let alert = Alert()
        alert.delegate = self
        alert.showAlert(with: punchlineAlert)
    }
    
}

