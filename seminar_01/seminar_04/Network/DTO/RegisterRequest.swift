//
//  RegisterRequest.swift
//  seminar_01
//
//  Created by 신혜연 on 11/8/25.
//

import Foundation

struct RegisterRequest: Codable {
    let username: String
        let password: String
        let name: String
        let email: String
        let age: Int
}
