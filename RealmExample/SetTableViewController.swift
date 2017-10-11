//
//  SetTableViewController.swift
//  RealmExample
//
//  Created by Pavan Kumar C on 11/10/17.
//  Copyright © 2017 Tarkalabs. All rights reserved.
//

import UIKit
import RealmSwift

class SetTableViewController: UITableViewController {
  
  var type: String? = nil
  var set1Items : Results<Set1Item>?
  var set2Items : Results<Set2Item>?
  var set3Items : Results<Set3Item>?
  var realm = try! Realm()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    set1Items = realm.objects(Set1Item.self)
    set2Items = realm.objects(Set2Item.self)
    set3Items = realm.objects(Set3Item.self)
    
    self.tableView.reloadData()
    
    let addEntryBarBtn = UIBarButtonItem(title: "ADD", style: .done, target: self, action: #selector(addEntry))
    self.navigationController?.topViewController?.navigationItem.rightBarButtonItem = addEntryBarBtn
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.tableView.reloadData()
    self.title = type
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if type == Type.Set1.rawValue {
        return set1Items?.count ?? 0
    } else if type == Type.Set2.rawValue {
      return set2Items?.count ?? 0
    } else if type == Type.Set3.rawValue {
      return set3Items?.count ?? 0
    }
    return 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "SetCell", for: indexPath) as! SetCell
    cell.selectionStyle = UITableViewCellSelectionStyle.none
    var setSrt = ""
    
    if type == Type.Set1.rawValue, let set1 = set1Items?[indexPath.row] {
      setSrt = "\(set1.name), \(set1.age), \(set1.company)"
    } else if type == Type.Set2.rawValue, let set2 = set2Items?[indexPath.row] {
      setSrt = "\(set2.name), \(set2.age), \(set2.company)"
    } else if type == Type.Set3.rawValue, let set3 = set3Items?[indexPath.row] {
      setSrt = "\(set3.name), \(set3.age), \(set3.company)"
    }
    
    cell.textLabel?.text = setSrt
    return cell
  }
  
  static func storyboardInstance() -> SetTableViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: "SetTableViewController") as! SetTableViewController
  }
  
  @objc private func addEntry () {
    let addCntrl = AddViewController.storyboardInstance()
    addCntrl.type = type
    self.navigationController?.pushViewController(addCntrl, animated: true)
  }
  
}
