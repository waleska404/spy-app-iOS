//
//  SystemInfoFetcher.swift
//  Spy
//
//  Created by Paula Waleska on 23/2/25.
//

import UIKit

class SystemInfoFetcher: Plugin {
    required init() {}
    
    var name: String = "System Info Fetcher"
    weak var delegate: PluginDelegate?

      func execute() throws {
          print("Fetching system information...")
          let deviceModel = UIDevice.current.model
          let systemVersion = UIDevice.current.systemVersion
          let batteryLevel = UIDevice.current.batteryLevel
          print("Device Model: \(deviceModel)")
          print("System Version: \(systemVersion)")
          print("Battery Level: \(batteryLevel)")
          delegate?.pluginDidFinish(plugin: self)
      }
 }
