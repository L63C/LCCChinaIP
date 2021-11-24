//
//  LCCChinaIP.swift
//  LCCChinaIP
//
//  Created by L63 on 2021/11/24.
//

import UIKit

public class LCCChinaIP: NSObject {
    @objc public static func isChinaIP(ip: String) -> Bool {
        guard ip.count > 0 else {
            return false
        }
        
        
        
        let bundle = Bundle.init(for: LCCChinaIP.self)
        let ipSource = bundle.path(forResource: "LCCChinaIP", ofType: "bundle")

        let ipFilePath = ipSource! + "/IPSource.bundle" + "/cnIP.plist"
        let ipcn = NSDictionary(contentsOfFile: ipFilePath) as! Dictionary<String, [[String : Any]]>
        
        let key = IPTools.getIpKey(ip: ip)
        let rangArr = ipcn[key]
        guard let _ = rangArr else {
            return false
        }
        let ipV = IPTools.covertIPToInt64(ip: ip)
        for range in rangArr! {
            let from = range["from"] as! String
            let to = range["to"] as! String
            
            let fromV = range["fromV"] as! Int64
            let toV = range["toV"] as! Int64
            if ipV >= fromV && ipV <= toV {
                print("this IP \(ip) is chain ip.rang:\(from)~\(to)")
                return true
                
            }
        }
        return false
    }
    @objc public static func isChinaIP(callback isChina: ((Bool) -> Void)?){
        DispatchQueue.global().async {
            let ip = IPTools.getIPAddress()
            isChina?(self.isChinaIP(ip: ip))
        }
       
    }
}
