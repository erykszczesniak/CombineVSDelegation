import UIKit



protocol AddItemControllerDelegate: class {
    
    func didAddItem(_ item: String)
}

class AddItemViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    weak var delegate: AddItemControllerDelegate?
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        delegate?.didAddItem(textField.text!)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
