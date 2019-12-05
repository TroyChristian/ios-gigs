//
//  GigsTableViewController.swift
//  gigs
//
//  Created by Lambda_School_Loaner_219 on 12/4/19.
//  Copyright © 2019 Lambda_School_Loaner_219. All rights reserved.
//

import UIKit

class GigsTableViewController: UITableViewController {
    let gigController = GigController()

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    override func viewDidAppear(_ animated:Bool){
        super.viewDidAppear(animated)
        if gigController.bearer == nil {
            performSegue(withIdentifier: "loginSegue", sender: self)
            
            
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)

        // Configure the cell...

        return cell
    }
    

 

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier {
        case "loginSegue":
            guard let loginVC = segue.destination as? LoginViewController else {return}
            loginVC.gigController = gigController
        default:
            break
        }
    }
    

}
