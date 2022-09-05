//
//  ListViewController.swift
//  Demo
//
//  Created by admin on 30/08/2022.
//

import UIKit
import SwiftUI
import CoreMIDI
class ListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var btAddNew: UIButton!
    var dem = 0
    private var fruit = [Fruit]()
    let userDefault = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setuptableView()
        bindata()
        setupBtaddNew()
      
    }
    private func setuptableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        //tableView.separatorStyle = .none
    }
    private func bindata(){
        let f1 = Fruit(name: "Mango")
        let f2 = Fruit(name: "Banana")
        let f3 = Fruit(name: "Coconout")
        fruit.append(f1)
        fruit.append(f2)
        fruit.append(f3)
        tableView.reloadData()
    }
    private func setupBtaddNew(){
        btAddNew.addTarget(self, action: #selector(tapOnadd), for: .touchUpInside)
    }
    @objc func tapOnadd(){
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "update") as? UpdateViewController else {return}
        vc.modalPresentationStyle = .overFullScreen
        // Save Data to userdefault
        vc.delegate = self
        present(vc, animated: true)
    }
}

extension ListViewController : UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = userDefault.array(forKey: Fruit_KEY)
        return fruit.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListCell
        cell.lbtext.text = fruit[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "editScreen") as! EditViewController
        vc.fruit = fruit[indexPath.row]
        vc.delegate = self
        vc.index = indexPath.row
        
        present(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        fruit.swapAt(sourceIndexPath.row, destinationIndexPath.row)
//        let itemMove = fruit[sourceIndexPath.row]
//        fruit.remove(at: sourceIndexPath.row)
//        fruit.insert(itemMove, at: destinationIndexPath.row)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            fruit.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let delete = UIContextualAction(style: .destructive, title: "Delete") { action, sourceView, completionHandler in
//            self.fruit.remove(at: indexPath.row)
//            tableView.reloadData()
//            completionHandler(true)
//        }
//        let swipeAction = UISwipeActionsConfiguration(actions: [delete])
//        swipeAction.performsFirstActionWithFullSwipe = false
//        return swipeAction
//    }
    @IBAction func didtapSort(){
        if tableView.isEditing {
            tableView.isEditing = false
        }
        else{
            tableView.isEditing = true
        }
    }
}
extension ListViewController: UpdateDelegate{
    func addNewfruit(newFruit: Fruit) {
        fruit.append(newFruit)
        tableView.reloadData()
        //print(newFruit.name)
    }
}
extension ListViewController: EditDelegate{
    func editfruit(edit: Fruit, dem: Any) {
        self.fruit[dem as! Int] = edit
        tableView.reloadData()
    }
}
