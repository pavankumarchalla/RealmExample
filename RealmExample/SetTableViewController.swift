//
//  SetTableViewController.swift
//  RealmExample
//
//  Created by Pavan Kumar C on 11/10/17.
//  Copyright © 2017 Tarkalabs. All rights reserved.
//

import UIKit

class SetTableViewController: UITableViewController {
  
  var type: String? = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let addEntryBarBtn = UIBarButtonItem(title: "ADD", style: .done, target: self, action: #selector(addEntry))
    self.navigationController?.topViewController?.navigationItem.rightBarButtonItem = addEntryBarBtn
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.title = type
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 0
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 0
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
