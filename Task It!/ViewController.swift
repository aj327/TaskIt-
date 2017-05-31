//
//  ViewController.swift
//  Task It!
// second try boi

//
//  Created by Aaditya Jain on 5/30/17.
//  Copyright © 2017 Aaditya Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var taskTableView: UITableView!
    
    var tasks : [Task] = []
    var selectedIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = createTasks()
        
        
        taskTableView.dataSource = self
        taskTableView.delegate = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.taskImportance {
            cell.textLabel?.text = "❗️ \(task.name)"
        }else{
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    
    func createTasks() -> [Task]{
        
        let task1 = Task()
        task1.name = "Do laundry"
        task1.taskImportance = false
        
        let task2 = Task()
        task2.taskImportance = true
        task2.name = "Call home"
        
        let task3 = Task()
        task3.name = "Study for Econ Test"
        task3.taskImportance = true
        
        return [task1, task2, task3]
        
    }

    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        }
        
        if segue.identifier == "selectTaskSegue"{
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
        
    }
    
    
    
    
    

   

}

