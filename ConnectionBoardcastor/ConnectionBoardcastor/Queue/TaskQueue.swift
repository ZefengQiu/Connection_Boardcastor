//
//  TaskQueue.swift
//  ConnectionBoardcastor
//
//  Created by Zefeng Qiu on 2017-11-23.
//  Copyright © 2017 Zefeng Qiu. All rights reserved.
//

import ReachabilitySwift
import Foundation

class TaskQueue {
  
  ///singleton
  static var share = TaskQueue()
  
  private let reachability: Reachability?
  
  private init() {
    //TODO: Reachability failable init, error handling when it is nil
    self.reachability = Reachability()
    
    NotificationCenter.default.addObserver(self, selector: #selector(TaskQueue.checkReachability(notification:)), name: ReachabilityChangedNotification, object: nil)
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self, name: ReachabilityChangedNotification, object: nil)
    self.stopCheckReachability()
  }
  
  // observe and stop check Reachabilty
  func startReachability()
  {
    do {
      try self.reachability?.startNotifier()
    }catch {
      print("Not Reachable")
    }
  }
  
  func stopCheckReachability() {
    self.reachability?.stopNotifier()
  }
  
  /**
    Check device reachability using notification center.
   */
  @objc private func checkReachability(notification: NSNotification) {
    guard let reach = self.reachability else {
      return
    }
    
    reach.whenReachable = { connection in
      if connection.isReachableViaWiFi {
        print("Reach Wifi")
      }else {
        print("Reach Cellular")
      }
    }
    
    reach.whenUnreachable = { _ in
      print("Not Reachable")
    }
  }
  
}
