//
//  UserViewController.swift
//  SWiOSChallenge
//
//  Created by Bernan Cordero on 3/23/20.
//  Copyright © 2020 Bernan. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet var userTableView: UITableView!
    @IBOutlet var userSearchbar: UISearchBar!

    let networkManager = NetworkManager()
    var userResult: [UserResult] = []
    var userResultSearched: [UserResult] = []

    var isSearching = false
    var isFetchingMore = false
    var page = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        // set delegate and tableview data source
        userTableView.delegate = self
        userTableView.dataSource = self
        userSearchbar.delegate = self

        // call initial fetch
        fetchUsers(page: page)
    }

    func fetchUsers(page: Int) {
        isFetchingMore = true
        self.page = page
        print("page: "  + String(page))
        networkManager.fetchUsers(completionHandler: { (user: User) in
            DispatchQueue.main.async {
                let _usersSorted = user.results.sorted(by: { $0.name.last < $1.name.last })
                self.appendUsersResult(users: _usersSorted)
            }
        })
    }

    fileprivate func appendUsersResult(users: [UserResult]) {
        if users.count > 0 {
            // merge array
            userResult += users

            // reload tableview
            userTableView.reloadData()
        }
        // set not fetching more
        isFetchingMore = false
    }
}
