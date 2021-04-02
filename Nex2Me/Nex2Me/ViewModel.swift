//
//  ViewModel.swift
//  Nex2Me
//
//  Created by Nitin Yadav on 2/4/2021.
//
import Foundation
class ViewModel: NSObject {
    var user: User!
    
    var phoneNumber: String {
        return user.phoneNumber
    }
    
    var password: String {
        return user.password ?? ""
    }
    
    func authenticateNumber(_ number: String?) -> Bool {
        guard let number = number, !number.isEmpty, Int(number) != nil
        else { return false }
        return true
    }
    
    func authenticatePassword(_ password: String?) -> Bool {
        guard let password = password, !password.isEmpty
        else { return false }
        return true
    }
}
