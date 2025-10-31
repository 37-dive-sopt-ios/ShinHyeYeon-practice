//
//  Font+.swift
//  seminar_01
//
//  Created by 신혜연 on 10/14/25.
//

import UIKit

extension UIFont {
    static let pretendardBold: UIFont = UIFont(name: "Pretendard-Bold", size: 18) ?? .boldSystemFont(ofSize: 18)
    static let pretendardRegular: UIFont = UIFont(name: "Pretendard-Regular", size: 14) ?? .systemFont(ofSize: 14)
    static let pretendardSemiBold: UIFont = UIFont(name: "Pretendard-SemiBold", size: 14) ?? .systemFont(ofSize: 14, weight: .semibold)
    static let pretendardExtraBold: UIFont = UIFont(name: "Pretendard-ExtraBold", size: 25) ?? .systemFont(ofSize: 25, weight: .heavy)
}
