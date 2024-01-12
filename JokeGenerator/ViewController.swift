//
//  ViewController.swift
//  JokeGenerator
//
//  Created by Karina ❦ on 11.01.2024.
//

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
        // Do any additional setup after loading the view.
    }

    private func setViews(views: [UIView]) {
        views.forEach {
            $0.layer.cornerRadius = 8
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.rBlack.cgColor
        }
    }
}

