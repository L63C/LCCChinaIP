# LCCChinaIP

[![CI Status](https://img.shields.io/travis/lu63chuan@163.com/LCCChinaIP.svg?style=flat)](https://travis-ci.org/lu63chuan@163.com/LCCChinaIP)
[![Version](https://img.shields.io/cocoapods/v/LCCChinaIP.svg?style=flat)](https://cocoapods.org/pods/LCCChinaIP)
[![License](https://img.shields.io/cocoapods/l/LCCChinaIP.svg?style=flat)](https://cocoapods.org/pods/LCCChinaIP)
[![Platform](https://img.shields.io/cocoapods/p/LCCChinaIP.svg?style=flat)](https://cocoapods.org/pods/LCCChinaIP)

## Example

自动获取手机的ip地址，并判断是否为中国IP
```
        LCCChinaIP.isChinaIP { isChinaIP in
            print(isChinaIP)
        }
        
```
判断输入的ip地址是否为中国的IP地址
```
        LCCChinaIP.isChinaIP(ip: "1.1.1.1")
```

## Requirements

## Installation

LCCChinaIP is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LCCChinaIP'
```

## Author

lu63chuan@163.com, lu63chuan@163.com

## License

LCCChinaIP is available under the MIT license. See the LICENSE file for more info.
