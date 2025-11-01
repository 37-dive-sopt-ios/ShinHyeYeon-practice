//
//  UIView+.swift
//  seminar_01
//
//  Created by 신혜연 on 11/1/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
