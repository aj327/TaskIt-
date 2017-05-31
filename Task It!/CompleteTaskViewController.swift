//
//  CompleteTaskViewController.swift
//  Task It!
//
//  Created by Aaditya Jain on 5/31/17.
//  Copyright © 2017 Aaditya Jain. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    
    var task = Task()
    var previousVC = ViewController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if task.taskImportance {
            taskLabel.text! = "❗️ \(task.name)"
        }else{
            taskLabel.text! = task.name
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func completeTap(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.taskTableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
    
   
}
