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
    var alert:Alert?
    
    override func loadView() {
        self.registerScrenn = RegisterScrenn()
        self.view = self.registerScrenn
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScrenn?.configTextFieldDelegate(delegate: self)
        self.registerScrenn?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
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
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        
        guard let register = self.registerScrenn else{return}
        
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: {(result,error) in
            
            if error != nil{
                print("Error ao cadastarr")
            }else{
                print("Sucesso ao cadastarr")
            }
        })
    }
    
    
    
}
