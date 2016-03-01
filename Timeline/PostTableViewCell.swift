//
//  PostTableViewCell.swift
//  Timeline
//
//  Created by Pierre on 2/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    
    
    
  

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    
    
    
    
    
    func updateWithPost(post: Post) {
        self.postImageView.image = nil
        
        self.likesLabel.text = "\(post.likes.count) likes"
        self.commentsLabel.text = "\(post.comments.count) comments"
        
        ImageController.imageForIdentifier(post.imageEndPoint) { (image) -> Void in
            if let image = image {
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.postImageView.image = image
                })
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
