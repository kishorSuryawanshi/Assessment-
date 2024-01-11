//
//  ResponseModel.swift
//  DemoApp
//
//  Created by Kishor on 11/01/24.
//

import Foundation

struct ResponseModel: Codable {
    let statusCode: Int?
    let data: [Employee]?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "statuscode"
        case data, message
    }
}

struct Employee: Codable {
    let visaRequesterName: String?
    let employeeId: String?
    let imageUrl: String?
}


/*
 {"statuscode":200,"data":[],"message":"Access token is valid
 */

/*
 {
          "country":"Algeria",
          "serviceDeskId":1,
          "sbu":"null",
          "visaCategory":"NA",
          "serviceDesk":"Pune",
          "employeeId":"155167",
          "visaSubType":"NA",
          "userName":"SINGHKHUSBL",
          "visaRequesterName":"Singh Khusboo Lallan",
          "createdOn":"2023-10-18",
          "countryId":56,
          "visaType":"Business Visa",
          "visaTypeId":1,
          "requestId":6000,
          "visaSubTypeId":12,
          "imageUrl":"https://cdoprodblob.blob.core.windows.net/engagement/singhkhusbl.jpg",
          "visaCategoryId":1,
          "projectId":"R.0030005.001"
       }
 */
