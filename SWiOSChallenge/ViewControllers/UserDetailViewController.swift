//
//  UserDetailViewController.swift
//  SWiOSChallenge
//
//  Created by Bernan Cordero on 3/23/20.
//  Copyright © 2020 Bernan. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    @IBOutlet var picture: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var address: UILabel!

    var userResult: UserResult?

    override func viewDidLoad() {
        super.viewDidLoad()
        onLoadInfo()
    }

    fileprivate func onLoadInfo() {
        if let userResult = userResult {
            // set picture
            let pictureURL = URL(string: userResult.picture.large)
            picture.sd_setImage(with: pictureURL, completed: nil)
            
            // set name and address
            name?.text = "\(userResult.name.last), \(userResult.name.first)"
            address?.text = "\(userResult.location.street.number) \(userResult.location.street.name), \(userResult.location.city)"
        }
    }
}
