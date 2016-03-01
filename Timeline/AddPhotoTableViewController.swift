//
//  AddPhotoTableViewController.swift
//  Timeline
//
//  Created by Pierre on 2/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class AddPhotoTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    
    
    var image: UIImage?
    var caption: String?
    

    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var captionTextField: UITextField!

    
    
    //MARK: ACTIONS
    @IBAction func addPhotoButtonTapped(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alert = UIAlertController(title: "Select photo", message: nil, preferredStyle: .ActionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            alert.addAction(UIAlertAction(title: "Camera Roll", style: .Default, handler: { (_) -> Void in
                imagePicker.sourceType = .PhotoLibrary
                self.presentViewController(alert, animated: true, completion: nil)
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func submitButtonTapped(sender: AnyObject) {
        if let images = image {
            PostController.addPost(images, caption: self.caption, completion: { (success, post) -> Void in
                if post != nil {
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    let failedAlert = UIAlertController(title: "Failed!", message: "Image failed to post. Please try again.", preferredStyle: .Alert)
                    failedAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                    self.presentViewController(failedAlert, animated: true, completion: nil)
                }
            })
        }
    }
    
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    //MARK: IMAGE PICKER DELEGATE
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.image = image
        
        addPhotoButton.setTitle("", forState: .Normal)
        addPhotoButton.setBackgroundImage(image, forState: .Normal)
    }
    
    
    //MARK: TEXT FIELD DELEGATE
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        caption = captionTextField.text
        captionTextField.resignFirstResponder()
        return true
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

   
   

}
