//
//  PawwaordsViewController.swift
//  SuperSenha
//
//  Created by Gilmar Junior on 28/08/21.
//

import UIKit

class PasswordsViewController: UIViewController {

    @IBOutlet weak var passwordsTextField: UITextView!
    
    var numberOfPasswords: Int = 1
    var numberOfCharacters: Int = 10
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCaptalLetters: Bool!
    var useSpecialChatacters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de senhas: \(numberOfPasswords)"
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: useNumbers, useCaptalLetters: useCaptalLetters, useSpecialChatacters: useSpecialChatacters)
        
        generatePasswords()

    }
    
    
    func generatePasswords() {
        passwordsTextField.scrollRangeToVisible(NSRange(location: 0, length: 0))
        passwordsTextField.text = ""
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            passwordsTextField.text.append(password + "\n\n")
        }
    }

    @IBAction func generateButton(_ sender: UIButton) {
        generatePasswords()
    }
    
}
