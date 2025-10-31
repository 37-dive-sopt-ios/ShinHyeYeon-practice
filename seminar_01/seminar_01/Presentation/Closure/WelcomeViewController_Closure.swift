//
//  WelcomeViewController_Closure.swift
//  seminar_01
//
//  Created by 신혜연 on 10/18/25.
//

import UIKit

final class WelcomeViewController_Closure: UIViewController {
    
    var name: String?
    var completionHandler: ((String) -> Void)?
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 120, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "logo2")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 120, y: 248, width: 170, height: 100))
        label.text = "???님 \n반가워요!"
        label.font = .pretendardExtraBold
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private var goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 36, y: 379, width: 335, height: 58))
        button.backgroundColor = .danggeunOrange
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .pretendardBold
        button.layer.cornerRadius = 6
        return button
    }()
    
    private var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 36, y: 451, width: 335, height: 58))
        button.backgroundColor = UIColor.danggeunGray
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(.danggeunTextGray, for: .normal)
        button.titleLabel?.font = .pretendardBold
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
        bindId()
    }
    
    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            //            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func bindId() {
        guard let name = self.name else { return }
        self.welcomeLabel.text = "\(name.isEmpty ? "혜연" : name)님 \n반가워요!"
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        let nickname = name ?? "알 수 없는 사용자"
        
        completionHandler?("\(nickname)님이 다시 로그인 버튼을 눌렀어요!") // completionHandler가 옵셔널이라서 ?를 붙임
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // 메서드를 이용하는 방법
    func setLabelText(name: String?) {
        self.name = name
    }
}
