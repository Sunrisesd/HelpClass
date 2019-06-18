## 关于

- 正则表达式，采用单例模式，用于常用数据格式判断

## 需求

- iOS 8.0+
- Xcode 9.0+
- Swift 4.0+

## 安装

### CocoaPods

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
pod 'HelpClass'
end
```
## 用法

```swift
import HelpClass

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 判断手机号
        let isPhoneBool = HelpClass.shareInstance.judgePhoneNum("17657341378")

        // 判断邮箱
        let isEmailBool = HelpClass.shareInstance.judgeEmail("sunrise@163.com")

        // 判断身份证
        let isCardBool = HelpClass.shareInstance.judgeCard("352227190001010234")

        // 判断纯数字
        let isNumberBool = HelpClass.shareInstance.judgeNumber("12321412")

        // 判断混合字符串
        let isHybridNumBool = HelpClass.shareInstance.numberAndAlphabetAndSymbol("2132eeds@@")
    }
    
}
```

