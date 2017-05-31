//
//  CreateTaskViewController.swift
//  Task It!
//
//  Created by Aaditya Jain on 5/30/17.
//  Copyright © 2017 Aaditya Jain. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    
    
    
    @IBOutlet weak var taskName: UITextField!
    
    @IBOutlet weak var importanceSwitch: UISwitch!
    
    
    // connection to previous VC
    
    var previousVC = ViewController()
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func addTaskTapped(_ sender: Any) {
        // create a task with task from outlet info
        
        let task = Task()
        task.name = taskName.text!
        task.taskImportance = importanceSwitch.isOn
        
    
        // add new task to array of tasks in previous view controller
        previousVC.tasks.append(task)
        previousVC.taskTableView.reloadData()
        
        // pop view controller so you go back to view of tasks after adding a task
        navigationController!.popViewController(animated: true)
    }
    
    
    
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
