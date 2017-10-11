//
//  AddViewController.swift
//  RealmExample
//
//  Created by Pavan Kumar C on 11/10/17.
//  Copyright © 2017 Tarkalabs. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var nameTxtField: UITextField!
  @IBOutlet weak var ageTxtField: UITextField!
  @IBOutlet weak var companyTxtField: UITextField!
  
  var type : String?
  let realm = try! Realm()
  
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
  
  @objc func saveDetails() {
    
    nameTxtField.resignFirstResponder()
    ageTxtField.resignFirstResponder()
    companyTxtField.resignFirstResponder()
    
    if type == Type.Set1.rawValue {
      let set1 = Set1Item()
      set1.age = ageTxtField.text ?? ""
      set1.company = companyTxtField.text ?? ""
      set1.name = nameTxtField.text ?? ""
      
      try! realm.write {
        realm.add(set1)
      }
    }
    
    if type == Type.Set2.rawValue {
      let set2 = Set2Item()
      set2.age = ageTxtField.text ?? ""
      set2.company = companyTxtField.text ?? ""
      set2.name = nameTxtField.text ?? ""
      
      try! realm.write {
        realm.add(set2)
      }
    }
    
    if type == Type.Set3.rawValue {
      let set3 = Set3Item()
      set3.age = ageTxtField.text ?? ""
      set3.company = companyTxtField.text ?? ""
      set3.name = nameTxtField.text ?? ""
      
      try! realm.write {
        realm.add(set3)
      }
    }
    
    ageTxtField.text = ""
    companyTxtField.text = ""
    nameTxtField.text = ""
    self.navigationController?.popViewController(animated: true)
  }
  
}
