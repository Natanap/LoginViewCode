//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Natanael Alves Pereira on 21/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.loginLabel)
    
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

