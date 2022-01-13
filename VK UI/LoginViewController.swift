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
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        // Получаем текст логина
        let login = loginInput.text!
        // Получаем текст-пароль
        let password = passwordInput.text!
        
        // Проверяем, верны ли они
        if login == "admin" && password == "123456" {
            print("успешная авторизация")
        } else {
            print("неуспешная авторизация")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func tapFunction() {
        self.view.endEditing(true)
    }
    


}

