import UIKit

class ViewControllerRegistration: UIViewController {
    @IBOutlet var passwordLabel: UILabel!

    var password: String = ""
    var count = 0
    var passwordNums = ["_" , "_" , "_" , "_"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let manager = StorageManager()
        manager.savePassword(value: password, key: .passKey)
        print(manager.getPassword(key: .passKey))
    }
    
    @IBAction func didChooseNumber(sender: UIButton){
        let textOfButton = sender.titleLabel?.text
        let numberInText = Int(textOfButton!)
        switch numberInText{
        case 0:
            password.append(contentsOf: "0")
            changeLabel(number: "0")
        case 1:
            password.append(contentsOf: "1")
            changeLabel(number: "1")
        case 2:
            password.append(contentsOf: "2")
            changeLabel(number: "2")
        case 3:
            password.append(contentsOf: "3")
            changeLabel(number: "3")
        case 4:
            password.append(contentsOf: "4")
            changeLabel(number: "4")
        case 5:
            password.append(contentsOf: "5")
            changeLabel(number: "5")
        case 6:
            password.append(contentsOf: "6")
            changeLabel(number: "6")
        case 7:
            password.append(contentsOf: "7")
            changeLabel(number: "7")
        case 8:
            password.append(contentsOf: "8")
            changeLabel(number: "8")
        case 9:
            password.append(contentsOf: "9")
            changeLabel(number: "9")
        default:
            break
        }
    }
    
    @IBAction func didTapDel() {
        password.removeAll()
        passwordLabel.text = "_ _ _ _"
        count = 0
        passwordNums[0] = "_"
        passwordNums[1] = "_"
        passwordNums[2] = "_"
        passwordNums[3] = "_"

    }

    func changeLabel(number: String){
        switch(count){
        case 0: passwordNums[0] = number
            passwordLabel.text = "\(passwordNums[0]) _ _ _"
        case 1: passwordNums[1] = number
            passwordLabel.text = "\(passwordNums[0]) \(passwordNums[1]) _ _"
        case 2: passwordNums[2] = number
            passwordLabel.text = "\(passwordNums[0]) \(passwordNums[1]) \(passwordNums[2]) _"
        case 3:passwordNums[3] = number
            passwordLabel.text = "\(passwordNums[0]) \(passwordNums[1]) \(passwordNums[2]) \(passwordNums[3])"
            
//            UserDefaults.standard.set(password, forKey: UserDefaultsKey.keyPassword.rawValue)
            passwordLabel.textColor = .green
            self.navigationController?.popToRootViewController(animated: true)
            
        default: break
        }
        count += 1
    }
}

