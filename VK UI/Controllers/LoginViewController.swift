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
    @IBOutlet weak var loadingView: UIView!
    
    var eyeSlashed = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        self.view.addGestureRecognizer(tapRecognizer)
        
        castomizeView()
        setLoadingView()
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        // Получаем текст логина
        let login = loginInput.text!
        // Получаем текст-пароль
        let password = passwordInput.text!

        // Проверяем, верны ли они
        if login == "admin" && password == "123456" {
            print("успешная авторизация")
            animateLoading()
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { _ in
                self.performSegue(withIdentifier: "toTabbar", sender: nil)
            })
    
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
        let alert = UIAlertController(title: "Error", message: "Login or password entered incorrectly", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func castomizeView() {
        loginView.layer.cornerRadius = 10
        loginView.layer.borderWidth = 1
        loginView.layer.borderColor = UIColor(red: 0.23, green: 0.24, blue: 0.24, alpha: 1.00).cgColor
        
        loginInput.attributedPlaceholder = NSAttributedString(string: "Phone or email", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.45, green: 0.46, blue: 0.47, alpha: 1.00)])
        passwordInput.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.45, green: 0.46, blue: 0.47, alpha: 1.00)])
        
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
    
    func animateLoading() {
        loadingView.isHidden = false
        
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0.1
        animation.toValue = 1
        animation.duration = 1
        animation.repeatDuration = 5
        animation.autoreverses = true
        
        loadingView.subviews[1].layer.add(animation, forKey: nil)
        animation.beginTime = CACurrentMediaTime() + 0.3
        loadingView.subviews[0].layer.add(animation, forKey: nil)
        animation.beginTime = CACurrentMediaTime() + 0.6
        loadingView.subviews[2].layer.add(animation, forKey: nil)
        
    }
    
    func setLoadingView() {
        loadingView.backgroundColor = .clear
        let dot2 = UIView()
        loadingView.addSubview(dot2)
        dot2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dot2.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            dot2.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor),
            dot2.widthAnchor.constraint(equalToConstant: 20),
            dot2.heightAnchor.constraint(equalToConstant: 20)
        ])
        dot2.clipsToBounds = true
        dot2.backgroundColor = .black
        dot2.layoutIfNeeded()
        dot2.layer.cornerRadius = dot2.bounds.height / 2
        
        let dot1 = UIView()
        loadingView.addSubview(dot1)
        dot1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dot1.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor, constant: -30),
            dot1.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor),
            dot1.widthAnchor.constraint(equalToConstant: 20),
            dot1.heightAnchor.constraint(equalToConstant: 20)
        ])
        dot1.clipsToBounds = true
        dot1.backgroundColor = .black
        dot1.layoutIfNeeded()
        dot1.layer.cornerRadius = dot1.bounds.height / 2
        
        let dot3 = UIView()
        loadingView.addSubview(dot3)
        dot3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dot3.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor, constant: 30),
            dot3.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor),
            dot3.widthAnchor.constraint(equalToConstant: 20),
            dot3.heightAnchor.constraint(equalToConstant: 20)
        ])
        dot3.clipsToBounds = true
        dot3.backgroundColor = .black
        dot3.layoutIfNeeded()
        dot3.layer.cornerRadius = dot3.bounds.height / 2
    }
}

