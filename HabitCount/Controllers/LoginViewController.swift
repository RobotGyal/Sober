//
//  LoginViewController.swift
//  HabitCount
//
//  Created by Mohammed Drame on 3/22/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(welcomeBacklabel)
        welcomeBacklabelConstrain()
    }
    
    // Todo ...
    // 1. Create welcome back label
    
    // 2. Create bounce Title label
    
    // 3. Create logo imageView
    
    // 4. Create stackview for email and password field
    
    // 5. Create stackview constraing
    
    // 6. create textfield
    
    // 7. add textfields to stackview
    
    // 8. create forgot password button
    
    // 9. create log in button
    
    // 10. stackview for singup label and sign up button
    
    // 11. create stackview constrain
    
    // 12. signup label and button and add to stackview
    
    lazy var welcomeBacklabel: UILabel = {
        let welcomeBacklabel = UILabel(frame: .zero)
        welcomeBacklabel.text = "Welcome Back"
        return welcomeBacklabel
    }()
    
    func welcomeBacklabelConstrain() {
        NSLayoutConstraint.activate([
            welcomeBacklabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            welcomeBacklabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeBacklabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -self.view.frame.size.height / 5),
            welcomeBacklabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    

}
