//
//  LoginScreen.swift
//  LoginViewCode
//
//  Created by Natanael Alves Pereira on 22/02/22.
//

import UIKit

protocol LoginScreenProtocol:AnyObject{
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    
    private weak var delegate:LoginScreenProtocol?
    
    func delegate(delegate:LoginScreenProtocol?){
        self.delegate = delegate
    }

    lazy var loginLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        
        return label
    }()
    
    lazy var logoAppImageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite seu E-mail:"
        tf.textColor = .darkGray
        
        
        return tf
 
    }()
    
    
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.placeholder = "Digite sua senha:"
        tf.textColor = .darkGray
        
        
        return tf
 
    }()
    
    lazy var loginButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var registerButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("N??o tem conta? Cadastra-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        
        //Adicionado target para o button
        button.addTarget(self, action: #selector(self.tappedLoginregisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configBackGround()
        
        self.configLoginLabelConstraint()
        self.configlogoAppImageViewConstraint()
        self.configEmailTextFieldConstraint()
        self.configPasswordTextFieldConstraint()
        self.configLoginButtonConstraint()
        self.configRegisterButtonConstraint()

        
        self.setUpConstraints()
        self.configButtonEnable(false)
    }
    
    private func configBackGround(){
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue:104/255, alpha: 1.0)
    }
    
    private func configSuperView(){
        self.addSubview(self.loginLabel)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
        
    }
    
    public func configTextFieldDelegate(delegate:UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
        
    }
    
    
    @objc private func tappedLoginButton(){
        self.delegate?.actionLoginButton()
    }
    
    @objc private func tappedLoginregisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
    public func validaTextFields(){
        let email:String = self.emailTextField.text ?? ""
        let passaword:String = self.passwordTextField.text ?? ""
        
        //Verifica se os campos est??o vazios
        if !email.isEmpty && !passaword.isEmpty{
            self.configButtonEnable(true)
        }else{
            self.configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enable:Bool){
        //habilita o button
        if enable {
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true
        }else{
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginButton.isEnabled = false
        }
        
    }
    
    public func getEmail()-> String{
        return self.emailTextField.text ?? ""
        
    }
    
    public func getPassword()-> String{
        return self.passwordTextField.text ?? ""
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //equal to:
    //basear em um terminado elemento
    
    //constant:
    //me afastar/ aproximar do elemento referente (equalto)
    
    //equalToConstant
    //setando um valor fixo para um terminado elemento
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            // FORMA NATIVA
            
//            self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
//            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            // LOGO IMAGEM
//            self.logoAppImageView.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 20),
//            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
//            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
//            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 200),
        
//            self.emailTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 20),
//            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
//            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
//            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
//
//            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15),
//            self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.loginButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
//
//            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 15),
//            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
//
            
        ])
    }
    //FORMA SNAPKIT
    // offset = valor positivo
    //inset = valor negativo
    
    
    func setConstraints(){
        
    }
    func configLoginLabelConstraint(){
        self.loginLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func configlogoAppImageViewConstraint(){
        self.logoAppImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.loginLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
            make.height.equalTo(200)
        }
    }
    
    func configEmailTextFieldConstraint(){
        self.emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.logoAppImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    
    func configPasswordTextFieldConstraint(){
        self.passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(15)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
    
    func configLoginButtonConstraint(){
        self.loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(15)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
    
    func configRegisterButtonConstraint(){
        self.registerButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.loginButton.snp.bottom).offset(15)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
    
}

