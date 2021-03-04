//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Виталий on 04.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(userName)!"
    }
    
    @IBAction func logOutButtonPressed() {
        dismiss(animated: true)
    }
}
