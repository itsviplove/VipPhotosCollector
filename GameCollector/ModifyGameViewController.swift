//
//  ModifyGameViewController.swift
//  GameCollector
//
//  Created by Apple on 3/1/17.
//  Copyright © 2017 itsviplove. All rights reserved.
//

import UIKit

class ModifyGameViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    var game3 : Collect? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
        modifyGameImage.image = UIImage(data: game3?.images! as! Data)
        modifyTextField.text = game3?.game
    }


    @IBOutlet weak var modifyGameImage: UIImageView!
    
    
    @IBAction func updateGame(_ sender: Any) {
    
        game3?.game = modifyTextField.text
        game3?.images = UIImagePNGRepresentation(modifyGameImage.image!) as NSData?
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
        
                }
    @IBOutlet weak var modifyTextField: UITextField!
    
    @IBAction func photoTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    

    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)

        
    }
    
    @IBAction func deleteGame(_ sender: Any) {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(game3!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    navigationController?.popViewController(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        modifyGameImage.image = image
        imagePicker.dismiss(animated: true, completion: nil)
    }

    
}
