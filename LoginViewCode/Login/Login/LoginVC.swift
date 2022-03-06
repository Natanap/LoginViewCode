//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Natanael Alves Pereira on 21/02/22.
//

import UIKit

class LoginVC: UIViewController {
    
    var loginScreen:LoginScreen?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension LoginVC:LoginScreenProtocol{
    func actionLoginButton() {
        print("Deu certo")
    }
    
    func actionRegisterButton() {
        print("Deu certo")
        // CHAMANDO A OUTRA TELA
        let vc:RegisterVC = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBegin")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEnd")
        self.loginScreen?.validaTextFields()
    }
    
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

