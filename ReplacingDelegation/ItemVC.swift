import UIKit
import Combine


class ItemVC: UIViewController {

    
    var subscriptions = Set<AnyCancellable>()
    var items: [String] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        
        guard let addItemViewController = storyboard?.instantiateViewController(withIdentifier: "addItemViewController") as? AddItemViewController else {
            return
        }
        addItemViewController.newItem
            .handleEvents(receiveOutput: { [unowned self] newItem in
                self.updateTableView(withItem: newItem)
        })
            .sink { _ in}
            .store(in: &subscriptions)

        self.present(addItemViewController, animated: true, completion: nil)

    }
    
   func updateTableView(withItem item: String) {
        self.items.append(item)
    
        self.tableView.reloadData()
    }

    
}
    
extension ItemVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
        
        
    }
    

   

