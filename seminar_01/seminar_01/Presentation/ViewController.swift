//
//  ViewController.swift
//  seminar_01
//
//  Created by 신혜연 on 10/12/25.
//

import UIKit
 
class ViewController: UIViewController {
    
    private var redView: UIView = {
        var view = UIView(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(redView)
        print("frame: \(self.redView.frame)\nbounds: \(self.redView.bounds)")
    }
}
