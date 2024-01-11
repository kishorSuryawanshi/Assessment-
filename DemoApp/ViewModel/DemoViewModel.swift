//
//  DemoViewModel.swift
//  DemoApp
//
//  Created by Kishor on 11/01/24.
//

import Foundation

//Singleton because employeeData needs to be accessible and shared by both VCs.
class DemoViewModel {
    static let shared = DemoViewModel()
    private init() {}
    private var employeeData: [Employee] = []
    
    //MARK: - UI Binding
    var handleOnSuccess: (()->())?
    var handleOnFailure:(()->())?
    
    func uploadDataOnServer(userName: String) {
        let body = preparePostBody(name: userName)
        APIHelper.shared.uploadData(postParam: body){ response in
            if let resp = response, let data = resp.data {
                self.employeeData = data
                self.handleOnSuccess?()
            } else {
                self.handleOnFailure?()
            }
        }
    }
    
    private func preparePostBody(name: String) -> RequestModel {
        let requestModel = RequestModel(appKey: "GMMS", tokenId: "ASD45FG67HJ89KL", userName: name, projectId: "R.0030005,R.0030005.001")
        return requestModel
    }
    
    func getEmployeeData() -> [Employee] {
        return employeeData
    }
}

/*
 "appKey": "GMMS",
    "tokenId": "ASD45FG67HJ89KL",
    "userName": "singhkhusbl",
    "projectid": "E.0010402.1"
 */
