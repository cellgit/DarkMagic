//
//  DMUserDefaults.swift
//  DarkMagic_Example
//
//  Created by liuhongli on 2023/2/11.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

//enum DMUserDefaultsKey {
//    case user
//    case bookDetail
//    var key: String {
//        switch self {
//        case .user: return "UserInfo"
//        case .bookDetail: return "BookDetail"
//        }
//    }
//}

public struct DMUserDefaults {

    /*
     存入数据: 数据为 Any 类型
     示例:
     let model = UserModel(json)
     DMUserDefaults.save(model, UserDefaultsKey.user.key)
     */
    public static func save(_ data: Any, _ key: String) {
        var userInfoData: Data?
        do {
            if #available(iOS 11.0, *) {
                userInfoData = try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: false)
            } else {
                userInfoData = NSKeyedArchiver.archivedData(withRootObject: data)
            }

        } catch {
            debugPrint("archivedData Error")
        }
        UserDefaults.standard.setValue(userInfoData, forKey: key)
    }

    /*
     获取数据
     示例:
     DMUserDefaults.get(UserDefaultsKey.user.key, UserModel.self)
     */
    public static func get<T>(_ key: String, _ classType: T.Type) -> T? {
        if let data = UserDefaults.standard.data(forKey: key) {
            if let user = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? T {
                return user
            }
        }
        return nil
    }

    /// 删除: DMUserDefaults.delete(UserDefaultsKey.user.key)
    public static func delete(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }

    public static func delete(_ key: String, success: () -> Void, failure: () -> Void = {}) {
        UserDefaults.standard.removeObject(forKey: key)
        success()
    }

}
