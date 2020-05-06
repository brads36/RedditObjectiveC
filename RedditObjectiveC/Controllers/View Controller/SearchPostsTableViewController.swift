//
//  SearchPostsTableViewController.swift
//  RedditObjectiveC
//
//  Created by Bryce Bradshaw on 5/6/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

import UIKit

class SearchPostsTableViewController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    var posts: [WBBPost] = [] {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as?
            PostTableViewCell else { return UITableViewCell() }

        let post = posts[indexPath.row]
        
        cell.post = post
        
        return cell
    }
} // End Of Class

extension SearchPostsTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        
        WBBPostController.sharedInstance().searchForPost(withSearchTerm: searchTerm) { (posts, error) in
            self.posts = posts
        }
    }
}
