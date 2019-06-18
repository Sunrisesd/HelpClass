//
//  HelpClass.swift
//  CocoaPodsManager
//
//  Created by Sunrise on 2019/6/18.
//  Copyright © 2019 ANSO. All rights reserved.
//

import UIKit

/// 正则表达式，采用单例模式，用于常用数据格式判断
public class HelpClass: NSObject {
    
    public static let shareInstance:HelpClass = {
        
        let help = HelpClass()
        
        return help
    }()
    
    /// 手机号码判断
    ///
    /// - Parameter phoneStr: 手机号字符串
    /// - Returns: 返回手机号码格式是否正确
    public func judgePhoneNum(_ phoneStr:String) -> Bool {
        
        // 移动号码段正则表达式
        let CM_NUM = "^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$"
        
        // 联通号码段正则表达式
        let CU_NUM = "^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$"
        
        // 电信号码段正则表达式
        let CT_NUM = "^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$"
        
        let pred1:NSPredicate = NSPredicate.init(format: "SELF MATCHES %@", CM_NUM)
        let isMatch1:Bool = pred1.evaluate(with: phoneStr)
        
        let pred2:NSPredicate = NSPredicate.init(format: "SELF MATCHES %@", CU_NUM)
        let isMatch2:Bool = pred2.evaluate(with: phoneStr)
        
        let pred3:NSPredicate = NSPredicate.init(format: "SELF MATCHES %@", CT_NUM)
        let isMatch3:Bool = pred3.evaluate(with: phoneStr)
        
        if isMatch1||isMatch2||isMatch3 {
            
            return true
        }
        
        return false
    }
    
    /// 邮箱判断
    ///
    /// - Parameter emailStr: 邮箱字符串
    /// - Returns: 返回邮箱格式是否正确
    public func judgeEmail(_ emailStr:String) -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        let emailPredicate = NSPredicate.init(format: "SELF MATCHES %@", emailRegex)
        
        let isMatch = emailPredicate.evaluate(with: emailStr)
        
        return isMatch
    }
    
    /// 身份证判断
    ///
    /// - Parameter cardStr: 身份证号码字符串
    /// - Returns: 返回身份证号码格式是否正确
    public func judgeCard(_ cardStr:String) -> Bool {
        
        let cardRedex = "^(\\d{14}|\\d{17})(\\d|[xX])$"
        
        let cardPredicate = NSPredicate.init(format: "SELF MATCHES %@", cardRedex)
        
        let isMatch = cardPredicate.evaluate(with: cardStr)
        
        return isMatch
    }
    
    /// 纯数字判断
    ///
    /// - Parameter numberStr: 字符串
    /// - Returns: 返回该字符串是否为纯数字
    public func judgeNumber(_ numberStr:String) -> Bool {
        
        let numberRedex = "^[0-9]+$"
        
        let numberPredicate = NSPredicate.init(format: "SELF MATCHES %@", numberRedex)
        
        let isMatch = numberPredicate.evaluate(with: numberStr)
        
        return isMatch
    }
    
    /// 数字、字母与符号的判断
    ///
    /// - Parameter passWordStr: 字符串
    /// - Returns: 返回该字符串是否包含数字、字母和符号
    public func numberAndAlphabetAndSymbol(_ passWordStr:String) -> Bool {
        
        let passWordRedex = "[a-zA-Z0-9]+$|[^a-zA-Z0-9/D]+$"
        
        let passWordPredicate = NSPredicate.init(format: "SELF MATCHES %@", passWordRedex)
        
        let isMatch = passWordPredicate.evaluate(with: passWordStr)
        
        return isMatch
    }
    
    /// 判断字符串中是否同时包含数字和字母
    ///
    /// - Parameter passWordStr: 字符串
    /// - Returns: 返回字符串是否同时包含数字和字母
    public func judgePassWordLegal(_ passWordStr:String) -> Bool {
        
        // 判断长度大于6位且少于16位后再接着判断是否同时包含数字和字符
        let passWordRedex = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$"
        
        let passWordPredicate = NSPredicate.init(format: "SELF MATCHES %@", passWordRedex)
        
        let isMatch = passWordPredicate.evaluate(with: passWordStr)
        
        return isMatch
    }
}

