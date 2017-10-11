//
//  InitialViewController.swift
//  RealmExample
//
//  Created by Pavan Kumar C on 11/10/17.
//  Copyright © 2017 Tarkalabs. All rights reserved.
//

import UIKit

enum Type : String{
  case Set1 = "SET1", Set2 = "SET2", Set3 = "SET3"
}

class InitialViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func set1Clicked(_ sender: UIButton) {
    navigateToTableView(str: Type.Set1.rawValue)
  }
  
  @IBAction func set2Clicked(_ sender: UIButton) {
    navigateToTableView(str: Type.Set2.rawValue)
  }
  
  @IBAction func set3Clicked(_ sender: UIButton) {
    navigateToTableView(str: Type.Set3.rawValue)
  }
  
  private func navigateToTableView(str:String) {
    let setController = SetTableViewController.storyboardInstance()
    setController.type = str
    self.navigationController?.pushViewController(setController, animated: true)
  }
  
}
