//
//  Plugin.swift
//  Spy
//
//  Created by Paula Waleska on 23/2/25.
//

protocol Plugin {
    init()
    var name: String { get }
    var delegate: PluginDelegate? {get set}
    func execute() throws
}

protocol PluginDelegate: AnyObject {
  func pluginDidFinish(plugin: Plugin)
}
