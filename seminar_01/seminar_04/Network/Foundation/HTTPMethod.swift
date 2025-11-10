//
//  HTTPMethod.swift
//  seminar_01
//
//  Created by 신혜연 on 11/8/25.
//

import Foundation

/// HTTP 메서드 (Moya의 Method와 동일!)
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
