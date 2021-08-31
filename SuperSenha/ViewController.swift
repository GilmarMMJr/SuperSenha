//
//  ViewController.swift
//  SuperSenha
//
//  Created by Gilmar Junior on 27/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalPasswordsTextField: UITextField!
    @IBOutlet weak var numberOfCharactersTextField: UITextField!
    @IBOutlet weak var lettersSwitch: UISwitch!
    @IBOutlet weak var numbersSwitch: UISwitch!
    @IBOutlet weak var capitalLettersSwitch: UISwitch!
    @IBOutlet weak var specialCharactersSwich: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordsViewController
        
        if let numberOfPasswords = Int(totalPasswordsTextField.text!) {
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        
        if let numberOfCharacters = Int(numberOfCharactersTextField.text!) {
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }
        
        passwordsViewController.useLetters = lettersSwitch.isOn
        passwordsViewController.useNumbers = numbersSwitch.isOn
        passwordsViewController.useCaptalLetters = capitalLettersSwitch.isOn
        passwordsViewController.useSpecialChatacters = specialCharactersSwich.isOn
        view.endEditing(true)
        
        
    }


}

