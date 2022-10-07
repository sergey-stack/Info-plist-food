//
//  VerificationService.swift
//  InfoPlistFood
//
//  Created by сергей on 2.10.22.
//

import Foundation

class Verification{
    
static func isValidEmail(email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}
    static func isValidPassword(pass: String) -> Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: pass)
    }
    
    static func isPassCofirm(pass1: String, pass2: String) -> Bool {
        return pass1 == pass2
    }
}
