//
//  UserViewController + UITableView.swift
//  SWiOSChallenge
//
//  Created by Bernan Cordero on 3/23/20.
//  Copyright © 2020 Bernan. All rights reserved.
//

import Foundation
import UIKit

// Searchbar
extension UserViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // raise search when there is more than 3 characters
        if searchText.count > 0 {
            isSearching = true
            userResultSearched = userResult.filter({
                $0.name.last.prefix(searchText.count) == searchText
            })
            isSearching = true
            userTableView.reloadData()
        }

        // reset searching if there is no text in the searchbar
        if searchText.count == 0 {
            isSearching = false
            userTableView.reloadData()
        }
    }
}

// TableView
extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return userResultSearched.count
        } else {
            return userResult.count
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userResult = !isSearching ? self.userResult[indexPath.row] : userResultSearched[indexPath.row]

        let userCell = tableView.dequeueReusableCell(withIdentifier: Constants.USER_CELL_IDENTIFIER, for: indexPath) as! UserCell

        userCell.accessoryType = .disclosureIndicator
        userCell.initialize(result: userResult)
        return userCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userResult = self.userResult[indexPath.row]
        let detailController = storyboard?.instantiateViewController(withIdentifier: Constants.USER_DETAILS_VC_IDENTIFIER) as! UserDetailViewController
        detailController.userResult = userResult

        show(detailController, sender: nil)
    }
}

// ViewDidScroll
extension UserViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if (offsetY > contentHeight - scrollView.frame.height) && !isFetchingMore {
            if !isSearching {
                fetchUsers(page: page + 1)
            }
        }
    }
}
