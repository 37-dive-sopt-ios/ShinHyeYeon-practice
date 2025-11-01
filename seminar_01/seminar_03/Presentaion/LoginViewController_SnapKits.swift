//
//  LoginViewController_SnapKit.swift
//  seminar_01
//
//  Created by 신혜연 on 11/1/25.
//

import UIKit
import SnapKit

final class LoginViewController_SnapKits: UIViewController {
    
    private let rootView = LoginView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setAddTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func loginButtonDidTap() {
        pushToWelcomeVC()
    }
    
    // MARK: - Private Methods
    private func pushToWelcomeVC() {
//        let welcomeViewController = WelcomeViewController_MVC()
//        welcomeViewController.id = loginView.idTextField.text
//        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}

#Preview {
    LoginViewController_SnapKits()
}
