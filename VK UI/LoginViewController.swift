//
//  ViewController.swift
//  VK UI
//
//  Created by Анастасия Лосикова on 06.01.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet var loginView: UIView!
    @IBOutlet weak var passwordEye: UIButton!
    
    var eyeSlashed = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        self.view.addGestureRecognizer(tapRecognizer)
        
        castomizeView()
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        // Получаем текст логина
        let login = loginInput.text!
        // Получаем текст-пароль
        let password = passwordInput.text!
        
        // Проверяем, верны ли они
        if login == "admin" && password == "123456" {
            print("успешная авторизация")
            performSegue(withIdentifier: "toTabbar", sender: nil)
        } else {
            loginError()
            print("неуспешная авторизация")
        }
    }

    @IBAction func loginChanged(_ sender: Any) {
        inputCheck()
    }
    
    @IBAction func passwordChanged(_ sender: Any) {
        inputCheck()
    }
    
    @IBAction func passwordClicked(_ sender: Any) {
        passwordEye.isHidden = false
        passwordInput.isSecureTextEntry = true
    }
    
    @IBAction func eyeClicked(_ sender: Any) {
        if eyeSlashed {
            passwordEye.setImage(UIImage(systemName: "eye"), for: .normal)
            passwordInput.isSecureTextEntry = false
            eyeSlashed = false
        } else {
            passwordEye.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            passwordInput.isSecureTextEntry = true
            eyeSlashed = true
        }
    }
    
    @IBAction func passwordEditionDidEnd(_ sender: Any) {
        passwordEye.isHidden = true
        passwordInput.isSecureTextEntry = true
        passwordEye.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeSlashed = true
    }
    
}

private extension LoginViewController {
    @objc func tapFunction() {
        self.view.endEditing(true)
    }
    
    func loginError() {
        let alert = UIAlertController(title: "Ошибка", message: "Логин или пароль введены неверно", preferredStyle: .alert)
        let action = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func castomizeView() {
        loginView.layer.cornerRadius = 10
        loginView.layer.borderWidth = 1
        loginView.layer.borderColor = UIColor(red: 0.23, green: 0.24, blue: 0.24, alpha: 1.00).cgColor
        
        loginInput.attributedPlaceholder = NSAttributedString(string: "Email или телефон", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.45, green: 0.46, blue: 0.47, alpha: 1.00)])
        passwordInput.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.45, green: 0.46, blue: 0.47, alpha: 1.00)])
        
        loginButton.layer.cornerRadius = 10
        loginButton.isEnabled = false
        passwordEye.isHidden = true
    }
    
    func inputCheck() {
        if loginInput.text != "" && passwordInput.text != "" {
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
        }
    }
}

