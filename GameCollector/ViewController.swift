//
//  ViewController.swift
//  GameCollector
//
//  Created by Apple on 3/1/17.
//  Copyright © 2017 itsviplove. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var games : [Collect] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
           games = try context.fetch(Collect.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let game1 = games[indexPath.row]
        cell.textLabel!.text = game1.game
        cell.imageView?.image = UIImage(data: game1.images! as Data)
        return cell
    }
    
    
    

}

