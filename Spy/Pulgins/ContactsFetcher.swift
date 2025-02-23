//
//  ContactsFetcher.swift
//  Spy
//
//  Created by Paula Waleska on 23/2/25.
//

import Contacts

class ContactsFetcher: Plugin {
    weak var delegate: PluginDelegate?
    required init() { }
    
    var name: String = "Contacts and CallKit Fetcher"

    
    func execute() throws {
        print("Fetching contacts and call history...")
        
        let store = CNContactStore()
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        
        do {
            try store.enumerateContacts(with: request) { contact, _ in
                print("Name: \(contact.givenName) \(contact.familyName)")
                
                for phoneNumber in contact.phoneNumbers {
                    print("Phone Number: \(phoneNumber.value.stringValue)")
                }
            }
        } catch {
            print("Error fetching contacts: \(error)")
        }
        
        delegate?.pluginDidFinish(plugin: self)
    }
}
