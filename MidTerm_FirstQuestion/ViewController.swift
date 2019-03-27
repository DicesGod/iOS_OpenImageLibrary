//
//  ViewController.swift
//  MidTerm_FirstQuestion
//
//  Created by Minh Le on 2019-03-27.
//  Copyright © 2019 Minh Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var UserName: UITextField!
    
   
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var test: UITextField!
    
    var UserPassword:[String:String] = [:]
    var imageList:[String: UIImage] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserName.delegate = self
        Password.delegate = self
    }
    
        func textFieldShouldReturn(_ textField:UITextField) -> Bool {
            UserName.resignFirstResponder()
            Password.resignFirstResponder()
            return true
        }
    
    @IBAction func EditingDidEnd(_ sender: Any) {
        var check = checkLogin(UserName.text!,Password.text!);
        if (check == false){
        selectImage(UITapGestureRecognizer.init())
//            test.text = ""
//            for (i,y) in UserPassword{
//                    test.text = i+""+y}
        }
        else{
            
//            test.text = ""
//            for (i,y) in UserPassword{
//                test.text = i+""+y}
            
            var getImage = UserName.text
            ImageView.image = imageList[getImage!]
//            for getImage in imageList.keys{
//                ImageView.image = imageList[getImage]
//            }

        
        }
    }
    
    func checkLogin(_ UserName:String,_ PassWord:String) -> Bool {
        var boolean = false
        for (i,x) in UserPassword{
            if (UserName == i && PassWord == x){
                boolean = true
                break
            }
        }
        
        return boolean;
    }
    
    @IBAction func selectImage(_ sender: UITapGestureRecognizer) {
        Password.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //Trigger when user selects an image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as?
            UIImage else{
                fatalError("Image cannot be loaded: \(info)")
        }
        ImageView.image = selectedImage //setImage(selectedImage)
        dismiss(animated: true, completion: nil)
//        imageList[UserName.text!] = selectedImage
//        UserPassword[UserName.text!] = Password.text
        imageList.updateValue(selectedImage, forKey: UserName.text!)
        UserPassword.updateValue(Password.text!, forKey: UserName.text!)
        UserName.becomeFirstResponder()
    }
}


