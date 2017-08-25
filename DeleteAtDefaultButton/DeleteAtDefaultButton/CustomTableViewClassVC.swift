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
//MARK: Stored Property - nameArray
//=============================================================//

    var nameArray = ["Yogesh","Arvind","Sajal","Vinay","Akshay","Negi","Kartik","Aman","Kumar","Verma"]
    
//=============================================================//
//MARK: Defining IBOutlets of TableView
//=============================================================//
    
    @IBOutlet weak var customTableView: UITableView!
    
//=============================================================//
//MARK: View Methods
//=============================================================//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "My Friends Zone"
        self.customTableView.delegate = self
        self.customTableView.dataSource = self
        
    }
    
//=============================================================//
//MARK: Dispose of any resources that can be recreated
//=============================================================//

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
//=============================================================//
//MARK: Defining IBAction of Custom Delete Button
//=============================================================//
    
    @IBAction func customDeleteBtnTapped(_ sender: UIButton) {
        
        guard let tableCell = getCell(button: sender) as? CellForRowClass else{fatalError()}
        guard let indexPath = self.customTableView.indexPath(for: tableCell) else {fatalError()}
        self.nameArray.remove(at: indexPath.row)
        customTableView.reloadData()
        
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
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == UITableViewCellEditingStyle.delete{
//            self.nameArray.remove(at: indexPath.row)
//            tableView.reloadData()
//
//        }
//    }
    
//=============================================================//
//MARK: User Define Method for Custom Delete Button On Swipe
//=============================================================//
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Custom Delete Button on Swipe
        let myDeleteButton = UITableViewRowAction(style: .default, title: "Delete", handler: {(action,indexPath) in
            self.nameArray.remove(at: indexPath.row)
            tableView.reloadData()
        })
        
        //Custom Change Name Button on Swipe
        let changeLabelName = UITableViewRowAction(style: .default, title: "Change_Name", handler: {(action,indexPath) in
            self.nameArray.remove(at: indexPath.row)
            self.nameArray.insert("AppInventiv", at: indexPath.row)
            tableView.reloadData()
        })
        
        return [changeLabelName,myDeleteButton]
    }
    
//=============================================================//
//MARK: User Define Method for Getting IndexPath
//=============================================================//

    func getCell(button: UIButton) -> UITableViewCell{
        var cell : UIView = button
        while !(cell is CellForRowClass) {
            if let super_view = cell.superview {
                cell = super_view
            }else{}
        }
        guard let tableCell = cell as? CellForRowClass else {fatalError()}
        return tableCell
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

