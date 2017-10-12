//
//  RealmConfiguration.swift
//  RealmExample
//
//  Created by Pavan Kumar C on 12/10/17.
//  Copyright © 2017 Tarkalabs. All rights reserved.
//

import UIKit
import RealmSwift

class RealmConfiguration {

  static let sharedRealm = RealmConfiguration()
  let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]

  func defaultRealmInstance() -> Realm {
    let config = Realm.Configuration.init(schemaVersion: 1, deleteRealmIfMigrationNeeded: true, objectTypes: nil)
    let realm = try! Realm(configuration: config)
    return realm
  }

}

