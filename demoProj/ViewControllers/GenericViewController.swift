//
//  GenericViewController.swift
//  demoProj
//
//  Created by Ronak Shahstri on 2021-02-27.
//

import UIKit

protocol ViewControllerProtocol {
    associatedtype viewModelType
}

class GenericViewController: UIViewController {    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
