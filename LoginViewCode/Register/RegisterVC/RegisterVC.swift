//
//  RegisterViewController.swift
//  LoginViewCode
//
//  Created by Natanael Alves Pereira on 05/03/22.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    var registerScrenn: RegisterScrenn?
    
    var auth:Auth?
    
    override func loadView() {
        self.registerScrenn = RegisterScrenn()
        self.view = self.registerScrenn
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScrenn?.configTextFieldDelegate(delegate: self)
        self.registerScrenn?.delegate(delegate: self)
        self.auth = Auth.auth()
    }

}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScrenn?.validaTextFields()
    }
    // Baixar o teclado 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}


extension RegisterVC: RegisterScrennProtocol{
    func actionBackButton() {
        print("Back Button !!")
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        self.auth?.createUser(withEmail: <#T##String#>, password: <#T##String#>, completion: <#T##((AuthDataResult?, Error?) -> Void)?##((AuthDataResult?, Error?) -> Void)?##(AuthDataResult?, Error?) -> Void#>)
    }
    
    
    
}
