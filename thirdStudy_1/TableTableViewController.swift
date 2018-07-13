//
//  TableTableViewController.swift
//  thirdStudy_1
//
//  Created by 김용철 on 2018. 7. 10..
//  Copyright © 2018년 김용철. All rights reserved.
//

import UIKit

class TableTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var memos:[NSDictionary] = []
    var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Memo List"
        navigationItem.rightBarButtonItem = self.editButtonItem
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddUserAlertController))
        loadMemoFromApi()
    }
    
    private func loadMemoFromApi() {
//        memos = [
//            [
//                "id": 1,
//                "name" : "John Doe"
//                ],
//            [
//                "id": 2,
//                "name": "Jane Doe"
//            ]
//        ]
//        memos.append("name")
    }
    
    @objc public func showAddUserAlertController() {
        let alertCtrl = UIAlertController(title: "메모추가", message: "메모를 추가해 주세요.", preferredStyle: .alert)
        
        // Add text field to alert controller
        alertCtrl.addTextField { (textField) in
            self.textField = textField
            self.textField.autocapitalizationType = .words
            self.textField.placeholder = "ex)일정"
        }
        
        // Add cancel button to alert controller
        alertCtrl.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        // "Add" button with callback
        alertCtrl.addAction(UIAlertAction(title: "추가", style: .default, handler: { action in
            if let name = self.textField.text, name != "" {
                self.memos.append(["id": self.memos.count, "name" :name])
                self.tableView.reloadData()
            }
        }))
        
        present(alertCtrl, animated: true, completion: nil)
    }
    
    @IBAction func createNewMemo(_ sender: Any) {
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
        
        cell.textLabel?.text = memos[indexPath.row]["name"] as! String?
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = memos[sourceIndexPath.row]
        memos.remove(at: sourceIndexPath.row)
        memos.insert(movedObject, at: destinationIndexPath.row)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.memos.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        NSLog("Row: \(row)")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "memoDescription") as! MemoDescriptionController;
        vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        self.present(vc, animated: true, completion: nil)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
