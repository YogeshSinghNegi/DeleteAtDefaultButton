//
//  CustomTableViewClassVC.swift
//  DeleteAtDefaultButton
//
//  Created by appinventiv on 24/08/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

//=============================================================//
//MARK: CustomTableViewClassVC Class
//=============================================================//

class CustomTableViewClassVC: UIViewController {
    
//=============================================================//
//MARK: Stored Property
//=============================================================//

    var nameArray = ["Yogesh","Arvind","Sajal","Vinay","Akshay","Negi","Kartik","Aman","Kumar","Verma"]
    
//=============================================================//
//MARK: Defining IBOutlets
//=============================================================//
    
    @IBOutlet weak var customTableView: UITableView!
    
    
//=============================================================//
//MARK: View Methods
//=============================================================//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customTableView.delegate = self
        self.customTableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//=============================================================//
//MARK: CustomTableViewClassVC Class Extension
//=============================================================//

extension CustomTableViewClassVC: UITableViewDelegate,UITableViewDataSource{
    
//=============================================================//
//MARK: Setting Number Of Cells
//=============================================================//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nameArray.count
    }
    
//=============================================================//
//MARK: Setting the Cell
//=============================================================//
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellForRowClass_ID") as? CellForRowClass else { fatalError("Cell Failed to load") }
        
        cell.nameLabel.text = self.nameArray[indexPath.row]
        
        return cell
    }
    
//=============================================================//
//MARK: Setting Height Of the Cell
//=============================================================//
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//=============================================================//
//MARK: Deleting Cell
//=============================================================//
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            self.nameArray.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
    }
  
}

//=============================================================//
//MARK: Class for Cell Label
//=============================================================//

class CellForRowClass: UITableViewCell{
    
//=============================================================//
//MARK: TableView IBOutlet
//=============================================================//
    
    @IBOutlet weak var nameLabel: UILabel!
    
}

