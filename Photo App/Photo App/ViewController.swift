import UIKit

class ViewController: UIViewController {
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var leftConstraint: NSLayoutConstraint!
    @IBOutlet var rightConstraint: NSLayoutConstraint!
    
    var password: String = ""
    var count = 0
    var passwordNums = ["_" , "_" , "_" , "_"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = StorageManager()
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
    
    @IBAction func didTapDelete() {
        password.removeAll()
        passwordLabel.text = "_ _ _ _"
        passwordNums[0] = "_"
        passwordNums[1] = "_"
        passwordNums[2] = "_"
        passwordNums[3] = "_"
        count = 0
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
        
            let manager = StorageManager()
            
            if password == manager.getPassword(key: .passKey){
                passwordLabel.textColor = .green
                self.dismiss(animated: true)
            } else {
                passwordLabel.textColor = .red
                UIView.animate(withDuration: 0.2, delay: 0, options: .allowAnimatedContent) {
                    self.leftConstraint.constant -= 15
                    self.rightConstraint.constant += 15
                    self.passwordLabel.center.x -= 15
                } completion: { _ in UIView.animate(withDuration: 0.2, delay: 0, options: .allowAnimatedContent) {
                    self.leftConstraint.constant += 30
                    self.rightConstraint.constant -= 30
                    self.passwordLabel.center.x += 30
                } completion: { _ in UIView.animate(withDuration: 0.2, delay: 0, options: .allowAnimatedContent) {
                    self.leftConstraint.constant -= 15
                    self.rightConstraint.constant += 15
                    self.passwordLabel.center.x -= 15
                } completion: { _ in
                    self.passwordLabel.textColor = .black
                    self.didTapDelete()
                }
                }
                }
            }
            
        default: break
        }
        count += 1
    }
}
