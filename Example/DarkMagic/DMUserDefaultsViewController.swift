//
//  DMUserDefaultsViewController.swift
//  DarkMagic_Example
//
//  Created by liuhongli on 2023/2/11.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class DMUserDefaultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // save Int value to UserDefaults
        DMUserDefaults.save(3, "key1")
        // get Int value from UserDefaults
        _ = DMUserDefaults.get("key1", Int.self)
        // delete from UserDefaults
        DMUserDefaults.delete("key1")
        // save dict value to UserDefaults
        let dict: [String: Any] = ["name": "Lily", "age": 18]
        DMUserDefaults.save(dict, "key2")
        // get dict value from UserDefaults
        let dictValue = DMUserDefaults.get("key2", [String: Any].self)
        // delete from UserDefaults
        DMUserDefaults.delete("key2")
    }

}
