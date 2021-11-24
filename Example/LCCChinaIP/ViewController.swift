//
//  ViewController.swift
//  LCCChinaIP
//
//  Created by lu63chuan@163.com on 11/24/2021.
//  Copyright (c) 2021 lu63chuan@163.com. All rights reserved.
//

import UIKit
import LCCChinaIP

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        LCCChinaIP.isChinaIP { isChinaIP in
            print(isChinaIP)
        }
        LCCChinaIP.isChinaIP(ip: "1.1.1.1")
    }
}

