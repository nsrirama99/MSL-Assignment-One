//
//  TableViewController.swift
//  MSL-Assignment-One
//
//  Created by UbiComp on 9/9/21.
//

import UIKit

class TableViewController: UITableViewController {

    lazy var dataModel = {
        return DataModel.sharedInstance()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section == 0) {
            return dataModel.numberOfChars()
        } else if(section == 1) {
            return dataModel.numberOfStages()
        } else {
            return dataModel.numberOfMusic()
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        if(indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Characters", for: indexPath)
            
            if let name = self.dataModel.getCharName(for : indexPath.row) as? String {
                cell.textLabel!.text = name
            }
            
            return cell
        } else if(indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Stages", for: indexPath)
            
            if let name = self.dataModel.getStageName(for : indexPath.row) as? String {
                cell.textLabel!.text = name
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Both", for: indexPath)
            
            if let name = self.dataModel.getMusicName(for : indexPath.row) as? String {
                cell.textLabel!.text = name
            }
            
            return cell
        }
        // Configure the cell...

        //return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let vc = segue.destination as? CharacterViewController,
           let cell = sender as? UITableViewCell,
           let name = cell.textLabel?.text {
                vc.displayImageName = name
                vc.row = tableView.indexPathForSelectedRow!.row
        }
        
        if let vc = segue.destination as? SegmentViewController,
           let cell = sender as? UITableViewCell,
           let name = cell.textLabel?.text {
                vc.displayImageName = name
        }
        
    }
    

}
