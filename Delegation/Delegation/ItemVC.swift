import UIKit

class ItemsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var items: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        
        guard let addItemViewController = storyboard?.instantiateViewController(withIdentifier: "addItemViewController") as? AddItemViewController else {
            return
        }
        addItemViewController.delegate = self
        self.present(addItemViewController, animated: true, completion: nil)
    }

   
}


extension ItemsVC: AddItemControllerDelegate {
    func didAddItem(_ item: String) {
        self.items.append(item)
        self.tableView.reloadData()
    }
}

extension ItemsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}
