//
//  Notification.swift
//  ConnectionBoardcastor
//
//  Created by Zefeng Qiu on 2017-11-27.
//  Copyright © 2017 Zefeng Qiu. All rights reserved.
//

import Foundation

struct Notification {
  
  struct Connection {
    static let reachError = NSNotification.Name("reachabilityError")
    static let none = NSNotification.Name("noneInternetConnection")
    static let wifi = NSNotification.Name("wifiInternectConnection")
    static let cellular = NSNotification.Name("cellularInternectConnection")
  }
  
}
