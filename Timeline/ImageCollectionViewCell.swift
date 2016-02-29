//
//  ImageCollectionViewCell.swift
//  Timeline
//
//  Created by Pierre on 2/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    func updateImageWithIdentifier(identifier: String) {
        ImageController.imageForIdentifier(identifier) { (image) -> Void in
            if let image = image {
                self.imageView.image = image
            }
        }
        
    }
    
    
}
