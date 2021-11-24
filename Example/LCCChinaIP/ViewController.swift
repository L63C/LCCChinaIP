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
        let ret = LCCChinaIP.isChinaIP(ip: "1.1.1.1")
        print(ret)
        print(IPTools.covertIPToInt64(ip: "192.0.0.23"))
        print(IPTools.covertIPToInt64(ip: "192.0.0.0"))
        print(IPTools.covertIPToInt64(ip: "192.0.0.255"))
    }
    func handelSouceFile() {
        let filePath = "/Users/xx/Downloads/ipinfo.txt"
        
        let content = try?  String(contentsOfFile: filePath)
        guard let _ = content else {
            return
        }
        let ipRangeArr = content!.split(separator: "\n").compactMap{"\($0)"}
        var resutDic : [String : [Any]] = [:]
        for ipRange in ipRangeArr {
            let ipArr = ipRange.split(separator: " ").compactMap{"\($0)"}
            let from = ipArr.first!
            let to = ipArr.last!
            let key = IPTools.getIpKey(ip: from)
            let dic : [String : Any] = [
                "from":from,
                "fromV":IPTools.covertIPToInt64(ip: from),
                "to":to,
                "toV":IPTools.covertIPToInt64(ip: to)
            ]
            var subArr = resutDic[key]
            if subArr == nil {
                subArr = []
            }
            subArr!.append(dic)
            resutDic[key] = subArr
        }
        
       
        
        let newIPPath = "/Users/luchuan/Downloads/cnIP.plist"
        if FileManager.default.fileExists(atPath: newIPPath) {
           try? FileManager.default.removeItem(atPath: newIPPath)
        }
        FileManager.default.createFile(atPath: newIPPath, contents: nil, attributes: nil)
        (resutDic as NSDictionary).write(toFile: newIPPath, atomically: true)
        
    }
    
}

