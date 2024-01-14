import Foundation
import UIKit

class Alert {
    weak var delegate: UIViewController?
    
    func showAlert(in delegate: UIViewController?, with punchline: AlertModel) {
        let alert = UIAlertController(title: punchline.title, message: punchline.message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: punchline.buttonText, style: .default) { _ in 
            punchline.completion()
        }
        
        alert.addAction(action)
        delegate?.present(alert, animated: true, completion: nil)
    }
}
