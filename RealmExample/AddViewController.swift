//
//  AddViewController.swift
//  RealmExample
//
//  Created by Pavan Kumar C on 11/10/17.
//  Copyright © 2017 Tarkalabs. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var nameTxtField: UITextField!
  @IBOutlet weak var ageTxtField: UITextField!
  @IBOutlet weak var companyTxtField: UITextField!
  
  var type : String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let saveBarBtn = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveDetails))
    self.navigationController?.topViewController?.navigationItem.rightBarButtonItem = saveBarBtn
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  static func storyboardInstance() -> AddViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
  }
  
  @objc private func saveDetails() {
    
  }
  
}
