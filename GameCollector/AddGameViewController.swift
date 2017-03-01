//
//  AddGameViewController.swift
//  GameCollector
//
//  Created by Apple on 3/1/17.
//  Copyright © 2017 itsviplove. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate  {
    
    var imagePicker = UIImagePickerController()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }

    @IBAction func photsTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
    present(imagePicker, animated: true, completion: nil)
        
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        GamePhoto.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    @IBOutlet weak var GamePhoto: UIImageView!
    
    

    @IBOutlet weak var gameTextfield: UITextField!
    
    
    @IBAction func addGameButton(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let game = Collect(context: context)
        game.game = gameTextfield.text
        game.images = UIImagePNGRepresentation(GamePhoto.image!) as NSData?
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
        
    }
}
