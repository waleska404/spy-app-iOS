//
//  SystemInfoFetcher.swift
//  Spy
//
//  Created by Paula Waleska on 23/2/25.
//

class SystemInfoFetcher: Plugin {
    required init() {}
    
    var name: String = "System Info Fetcher"
    weak var delegate: PluginDelegate?

      func execute() throws {
        print("Fetching system information...")
        delegate?.pluginDidFinish(plugin: self)
      }
 }
