//
//  NetworkManager.swift
//  SWiOSChallenge
//
//  Created by Bernan Cordero on 3/23/20.
//  Copyright © 2020 Bernan. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    func fetchUsers(page: Int = 1, completionHandler: @escaping (_ user: User) -> Void) {
        Alamofire.request("\(Constants.BASE_API_URL)&page=\(page)")
            .responseJSON(completionHandler: { responseData in
                if let data = responseData.data {
                    let userObject = try! JSONDecoder().decode(User.self, from: data)
                    completionHandler(userObject)
                }
            })
    }
}
