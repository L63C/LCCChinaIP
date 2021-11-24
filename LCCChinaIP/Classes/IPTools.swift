//
//  IPTools.swift
//  Demo
//
//  Created by L63 on 2021/11/24.
//

import UIKit

@objcMembers
public class IPTools: NSObject {
    
    /// 将ip 地址转换为Int 类型
  @objc public static func covertIPToInt64(ip:String) -> Int64 {
        // 去空格
        let ipStr = ip.replacingOccurrences(of: " ", with: "")
        if ipStr.count == 0 {
            return 0
        }
        let splitArr = ipStr.split(separator: ".")
        var  result: Int64 = 0
        for (idx,subIp) in splitArr.enumerated() {
            let num : Int64 = Int64(subIp) ?? 0
            let scale = pow(Double(256), Double(3-idx))
            result = result + num * Int64(scale)
        }
        return result
    }
    
    /// 获取ip 地址的第一部分当作key
    @objc public static func getIpKey(ip: String) -> String {
        let ipStr = ip.replacingOccurrences(of: " ", with: "")
        if ipStr.count == 0 {
            return ""
        }
        let splitArr = ipStr.split(separator: ".")
        guard splitArr.count > 1 else {
            return ""
        }
        return String.init(splitArr.first!)
    }
    
    /// 获取本地IP 地址，可能是局域网的地址
    @objc public static func getIphoneIpAddress() -> String{
        var addresses = [String]()
        var ifaddr : UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while (ptr != nil) {
                let flags = Int32(ptr!.pointee.ifa_flags)
                var addr = ptr!.pointee.ifa_addr.pointee
                if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
                    if addr.sa_family == UInt8(AF_INET) || addr.sa_family == UInt8(AF_INET6) {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        if (getnameinfo(&addr, socklen_t(addr.sa_len), &hostname, socklen_t(hostname.count),nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                            if let address = String(validatingUTF8:hostname) {
                                addresses.append(address)
                            }
                        }
                    }
                }
                ptr = ptr!.pointee.ifa_next
            }
            freeifaddrs(ifaddr)
        }
        return addresses.first ?? "0.0.0.0"
    }
    /// 获取手机的网络的Ip 地址
    @objc public static func getNetIpAddress() -> String {
        let url = URL(string: "https://ifconfig.me/ip")
        let ip = try? String(contentsOf: url!, encoding: .utf8)
        return ip ?? "0.0.0.0"
    }
    /// 获取ip 地址
    @objc public static func getIPAddress() -> String {
        let phoneIpAddress = getIphoneIpAddress()
        if phoneIpAddress.hasPrefix("10.")
            || phoneIpAddress.hasPrefix("172.")
            || phoneIpAddress.hasPrefix("192.168") {
            return getNetIpAddress()
        }else {
            return phoneIpAddress
        }
            
    }
    
}
