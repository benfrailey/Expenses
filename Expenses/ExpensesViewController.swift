////
////  ExpensesViewController.swift
////  Expenses
////
////  Created by Tech Innovator on 11/30/17.
////  Copyright © 2017 Tech Innovator. All rights reserved.
////
//
//import UIKit
//
//class ExpensesViewController: UIViewController {
//
//    @IBOutlet weak var expensesTableView: UITableView!
//
//    let dateFormatter = DateFormatter()
//
//    var category: Category?
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        dateFormatter.timeStyle = .long
//        dateFormatter.dateStyle = .long
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        self.expensesTableView.reloadData()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    @IBAction func addNewExpense(_ sender: Any) {
//        performSegue(withIdentifier: "showExpense", sender: self)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let destination = segue.destination as? SingleExpenseViewController else {
//            return
//        }
//        destination.category = category
//    }
//}
//
//extension ExpensesViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(category?.expenses?.count ?? 0)
//        return category?.expenses?.count ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = expensesTableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
//
//        if let expense = category?.expenses?[indexPath.row]{
//            cell.textLabel?.text = expense.name
//
//
//            if let date = expense.date{
//            cell.detailTextLabel?.text = dateFormatter.string(from: date)
//            }
//        }
//        return cell
//    }
//}
//
//extension ExpensesViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "showExpense", sender: self)
//    }
//}

//
//  CategoriesViewController.swift
//  ExpensesCoreData
//
//  Created by Shawn Moore on 11/9/17.
//  Copyright © 2017 Shawn Moore. All rights reserved.
//

import UIKit
import CoreData

class ExpensesViewController: UIViewController {
    
    @IBOutlet weak var expensesTableView: UITableView!
    
    var expenses: [Expense] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Expense> = Expense.fetchRequest()
        
        do{
            expenses = try managedContext.fetch(fetchRequest)
            
            expensesTableView.reloadData()
        } catch {
            print("Could not fetch")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SingleExpenseViewController,
            let selectedRow = self.expensesTableView.indexPathForSelectedRow?.row else {
                return
        }
        
        destination.expense = expenses[selectedRow]
    }
}

extension expensesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = expensesTableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath)
        let Expense = expenses[indexPath.row]
        
        cell.textLabel?.text = Expense.title
        return cell
    }
}
