//
//  APIHelper.swift
//  DemoApp
//
//  Created by Kishor on 11/01/24.
//

import Foundation

public class APIHelper {
    public static let shared = APIHelper()
    private init(){}
    
    func uploadData(postParam: RequestModel, completion: @escaping (_ result: ResponseModel?) -> ()) {
        guard let url = URL(string: "https://uat-gmms2-web.akuat.birlasoft.com/dm/dmpendingrequestlist") else { return }
                
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONEncoder().encode(postParam)
            request.addValue("text/plain", forHTTPHeaderField: "content-type")
        } catch let error{
            print(error.localizedDescription)
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let jsonData = data, error == nil {
                do {
                    let response = try JSONDecoder().decode(ResponseModel.self, from: jsonData)
                    print(response)
                    completion(response)
                } catch let error {
                    print(error.localizedDescription)
                    completion(nil)
                }
            }
        }.resume()
        
    }
}
