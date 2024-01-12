import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet private var jokeId: UIStackView!
    @IBOutlet private var jokeType: UIStackView!
    @IBOutlet private var jokeSetup: UIStackView!
    @IBOutlet private var refreshButton: UIButton!
    @IBOutlet private var showButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews(views: [jokeId, jokeType, jokeSetup, refreshButton, showButton])
    }
    
    @IBAction func refreshButton(_ sender: Any) {
    }
    
    
    @IBAction func showButton(_ sender: Any) {
    }

    // MARK: Private functions
    private func setViews(views: [UIView]) {
        views.forEach {
            $0.layer.cornerRadius = 8
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.rBlack.cgColor
        }
    }
    
    
}

