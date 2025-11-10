//
//  BaseResponse.swift
//  seminar_01
//
//  Created by 신혜연 on 11/8/25.
//

import Foundation

/// 서버 파트장이 준 API 의 공통 응답 형식
/// 보통 BaseResponse 라고 합니다.
public struct BaseResponse<T: Decodable>: Decodable { // response로 받는 것은 무조건 디코딩
    public let success: Bool
    public let code: String?
    public let message: String?
    public let data: T?
}

/// 응답 데이터가 필요 없는 경우가 있을 거란 말이죠? 그걸 위한 Empty 타입입니다.
public struct EmptyResponse: Decodable { // 보통은 빈 structure로 받음
    public init() {}
}
