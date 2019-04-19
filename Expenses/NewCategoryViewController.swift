//
//  NewCategoryViewController.swift
//  Expenses
//
//  Created by Ben Frailey on 4/18/19.
//  Copyright © 2019 Tech Innovator. All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        titleTextField.resignFirstResponder()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
