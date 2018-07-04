//
//  ViewController.swift
//  HenriqueAS_WebMotors
//
//  Created by Henrique Silva on 24/06/2018.
//  Copyright © 2018 Henrique Silva. All rights reserved.
//

import UIKit
import PromiseKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        RequestData.shared.auth(linkString: "http://desafioonline.webmotors.com.br/api/OnlineChallenge/Vehicles?Page=1")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

