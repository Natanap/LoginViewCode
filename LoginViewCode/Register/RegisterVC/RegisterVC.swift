//
//  RegisterViewController.swift
//  LoginViewCode
//
//  Created by Natanael Alves Pereira on 05/03/22.
//

import UIKit

class RegisterVC: UIViewController {

    var registerScrenn: RegisterScrenn?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScrenn = RegisterScrenn()
        self.view = self.registerScrenn
    }

}
