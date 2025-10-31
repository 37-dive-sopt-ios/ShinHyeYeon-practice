//
//  LoginViewController_SnapKit.swift
//  seminar_01
//
//  Created by 신혜연 on 10/18/25.
//

import UIKit
import SnapKit

class LoginViewController_SnapKit: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.font = .pretendardBold
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.backgroundColor = UIColor.danggeunGray
        textField.layer.cornerRadius = 3
        // 텍스트 필드 좌우 패딩 추가
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightViewMode = .never
        textField.textColor = .danggeunOrange
        textField.font = .pretendardSemiBold
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.backgroundColor = UIColor.danggeunGray
        textField.layer.cornerRadius = 3
        // 텍스트 필드 좌우 패딩 추가
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightViewMode = .never
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        textField.textColor = .danggeunOrange
        textField.font = .pretendardSemiBold
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowRadius = 4
        button.titleLabel?.font = .pretendardBold
        button.backgroundColor = UIColor.danggeunOrange
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let autoLoginSwitch: UISwitch = {
        let switchView = UISwitch()
        switchView.thumbTintColor = .danggeunOrange
        switchView.onTintColor = .darkGray
        switchView.addTarget(self, action: #selector(autoLoginDidTap), for: .valueChanged)
        return switchView
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "자동로그인"
        label.font = .pretendardRegular
        label.textColor = .danggeunTextGray
        label.textAlignment = .left
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [
            titleLabel,
            idTextField,
            passwordTextField,
            loginButton,
            loginLabel
        ].forEach { view.addSubview($0) }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(163)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(72)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(58)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(58)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        loginButton.snp.makeConstraints{
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(58)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    @objc
    private func autoLoginDidTap(_ sender: UISwitch) {
        if sender.isOn {
            loginLabel.textColor = .gray
        } else {
            loginLabel.textColor = .danggeunTextGray
        }
    }
    
    @objc
    private func loginButtonDidTap() {
        presentToWelcomeVC()
//        pushToWelcomeVC()
    }
    
    // 모달
    private func presentToWelcomeVC() {
        self.view.endEditing(true)
        
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
    LoginViewController_SnapKit()
}
