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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        taskTableView.dataSource = self
        taskTableView.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        taskTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.taskImportance {
            cell.textLabel?.text = "❗️ \(task.name!)"
        }else{
            cell.textLabel?.text = task.name!
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    
    
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    
    func getTasks() {
        //function gets everything out of core data and puts it into an array
        // use context to take things out
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        } catch{
            print("Oops we have an error here")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "selectTaskSegue"{
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
        }
        
    }
    
    
    
    
    

   

}

