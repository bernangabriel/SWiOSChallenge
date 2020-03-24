//
//  UserCell.swift
//  SWiOSChallenge
//
//  Created by Bernan Cordero on 3/23/20.
//  Copyright © 2020 Bernan. All rights reserved.
//

import SDWebImage
import UIKit

class UserCell: UITableViewCell {
    @IBOutlet var name: UILabel!
    @IBOutlet var phone: UILabel!
    @IBOutlet var picture: UIImageView!

    func initialize(result: UserResult?) {
        if let result = result {
            name?.text = "\(result.name.last), \(result.name.first)"
            phone?.text = result.phone

            // set picture
            let pictureURL = URL(string: result.picture.thumbnail)
            picture?.sd_setImage(with: pictureURL, completed: nil)
            
            //rounded picture
            picture?.layer.cornerRadius = picture.frame.width / 2
            picture?.clipsToBounds = true
        }
    }
}
