//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Gilmar Junior on 28/08/21.
//

import Foundation

class PasswordGenerator {
    
    var numberOfCharacters: Int
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCaptalLetters: Bool!
    var useSpecialChatacters: Bool!
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%ˆ&*()_-+=|]}[{':;?/<>.,"
    private let numbers = "0123456789"
    
    init( numberOfCharacters: Int, useLetters: Bool, useNumbers: Bool, useCaptalLetters: Bool, useSpecialChatacters: Bool) {
        
        var numChars = min(numberOfCharacters, 16)
        numChars = max(numChars, 1)
        
        self.numberOfCharacters = numChars
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCaptalLetters = useCaptalLetters
        self.useSpecialChatacters = useSpecialChatacters
        
    }
    
    func generate(total: Int) -> [String]{
        passwords.removeAll()
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useSpecialChatacters {
            universe += specialCharacters
        }
        
        if useCaptalLetters {
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe)
        
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(universe.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        
        return passwords
    }
    
    
    
}
