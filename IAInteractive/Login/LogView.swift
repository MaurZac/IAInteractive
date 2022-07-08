//
//  LogView.swift
//  IAInteractive
//
//  Created by Mauricio Zarate on 06/07/22.
//  
//

import Foundation
import UIKit

class LogView: UIViewController {

    // MARK: Properties
    var presenter: LogPresenterProtocol?
    var datResView = LogEntity(error_description: "")

    private let userTField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor = UIColor(red: 28/255, green: 40/255, blue: 51/255, alpha: 1)
        tf.textColor = .green
        tf.textAlignment = .center
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.autocorrectionType = .no
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(white: 1, alpha: 0.5)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    private let passTField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor =  UIColor(red: 28/255, green: 40/255, blue: 51/255, alpha: 1)
        tf.textColor = .green
        tf.textAlignment = .center
        tf.isSecureTextEntry = true
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.autocorrectionType = .no
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(white: 1, alpha: 0.5)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    private let loginBtn: UIButton = {
        let button = UIButton()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Log in", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), ]))
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.cornerRadius = 15
         button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 28/255, green: 40/255, blue: 51/255, alpha: 1).cgColor
        button.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        return button
    }()
    
   private  let lblError: UILabel = {
        let lblError = UILabel()
        lblError.font = UIFont.systemFont(ofSize: 12)
        lblError.textColor = .red
        lblError.translatesAutoresizingMaskIntoConstraints = false
        lblError.numberOfLines = 4
        lblError.lineBreakMode = .byWordWrapping
        lblError.sizeToFit()
        lblError.textAlignment = .center
        return lblError
    }()
    
    @objc func goToLogin(){
        presenter?.getToken()
        //presenter?.showNewView()
    }
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupViewContraints()
    }
    
    func setupViewContraints(){
        view.backgroundColor = .systemGray6
        view.addSubview(userTField)
        view.addSubview(passTField)
        view.addSubview(loginBtn)
        view.addSubview(lblError)
        
        userTField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        userTField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        userTField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userTField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userTField.translatesAutoresizingMaskIntoConstraints = false
        
        passTField.topAnchor.constraint(equalTo: userTField.bottomAnchor, constant: 10).isActive = true
        passTField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        passTField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        passTField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passTField.translatesAutoresizingMaskIntoConstraints = false
        
        loginBtn.topAnchor.constraint(equalTo: passTField.bottomAnchor, constant: 30).isActive = true
        loginBtn.widthAnchor.constraint(equalToConstant: 180).isActive = true
        loginBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        
    
        lblError.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 30).isActive = true
        lblError.widthAnchor.constraint(equalToConstant: 260).isActive = true
        lblError.heightAnchor.constraint(equalToConstant: 40).isActive = true
        lblError.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lblError.translatesAutoresizingMaskIntoConstraints = false
  
    }
    
}

extension LogView: LogViewProtocol {
    func presenterPushDataView(received: LogEntity) {
        self.datResView = received
        DispatchQueue.main.async {  [self] in
            lblError.text = datResView.error_description
        }
    }
    
    // TODO: implement view output methods
}
