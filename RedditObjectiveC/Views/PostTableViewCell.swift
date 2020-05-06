//
//  PostTableViewCell.swift
//  RedditObjectiveC
//
//  Created by Bryce Bradshaw on 5/6/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postUpsLabel: UILabel!
    @IBOutlet weak var postCommentsLabel: UILabel!
    
    // MARK: - Properties
    var post: WBBPost? {
        didSet {
            updateViews()
    }
    }

    // MARK: - Methods
    func updateViews() {
        guard let post = post else { return }
        postTitleLabel.text = post.title
        postUpsLabel.text = "\(post.ups)👍"
        postCommentsLabel.text = "\(post.commentCount) 💬"
    }
}
