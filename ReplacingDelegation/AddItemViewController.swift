import UIKit
import Combine

class AddItemViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    let newItem = PassthroughSubject<String, Never>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        newItem.send(textField.text!)
        self.dismiss(animated: true, completion: nil)
        
    }
    

    

}
