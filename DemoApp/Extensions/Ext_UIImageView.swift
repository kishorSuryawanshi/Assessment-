//
//  Ext_UIImageView.swift
//  DemoApp
//
//  Created by Kishor on 10/01/24.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImg(url: String) {
        guard let url = URL(string: url) else {
            self.image = UIImage(named: "empIcon")
            return
        }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let imgData = data, error == nil else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imgData)
            }
        }.resume()
    }
}
