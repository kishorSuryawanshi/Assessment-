//
//  RequestModel.swift
//  DemoApp
//
//  Created by Kishor on 11/01/24.
//

import Foundation

struct RequestModel: Codable {
    let appKey: String?
    let tokenId: String?
    let userName: String?
    let projectId: String?
    
    enum CodingKeys: String, CodingKey {
        case projectId = "projectid"
        case appKey, tokenId, userName
    }
}
