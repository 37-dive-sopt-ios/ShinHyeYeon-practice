//
//  DanggeunLoginViewController.swift
//  seminar_01
//
//  Created by 신혜연 on 10/12/25.
//

import UIKit

class DanggeunLoginViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 80, y: 163, width: 240, height: 60))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    lazy var idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 30, y: 284, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.backgroundColor = UIColor.danggeunGray
        textField.layer.cornerRadius = 3
        // 텍스트 필드 좌우 패딩 추가
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.rightViewMode = .always
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 30, y: 343, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.backgroundColor = UIColor.danggeunGray
        textField.layer.cornerRadius = 3
        // 텍스트 필드 좌우 패딩 추가
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.rightViewMode = .always
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 430, width: 335, height: 52))
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = UIColor.danggeunOrange
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUI()
    }
    
    private func setUI() {
        let components = [
            titleLabel,
            idTextField,
            passwordTextField,
            loginButton
        ]
        
        components.forEach { view.addSubview($0) }
    }
    
    @objc
    private func loginButtonDidTap() {
        presentToWelcomeVC()
//        pushToWelcomeVC()
    }
    
    // 모달
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
//        welcomeVC.modalPresentationStyle = .fullScreen
//        welcomeVC.name = idTextField.text
        
        // 메서드 이용 방법
        welcomeVC.setLabelText(name: idTextField.text)
        self.present(welcomeVC, animated: true)
    }
    
    // 네비게이션
    private func pushToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
}

#Preview {
    DanggeunLoginViewController()
}
