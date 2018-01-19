//
//  LIstViewController.swift
//  Trail Flo
//
//  Created by Nikhil Manapure on 19/01/18.
//
//

import UIKit
import Alamofire

class ListViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var noDataLabel: UILabel!
    
    var listOfItems: [Item] = [] {
        didSet {
            DispatchQueue.main.async {
                self.noDataLabel.isHidden = self.listOfItems.count != 0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.register(ItemCell.self)
        listTableView.rowHeight = UITableViewAutomaticDimension
        listTableView.estimatedRowHeight = 160
        getTheList()
    }
    
    func getTheList() {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer FlochatIosTestApi"
        ]
        
        loader.startAnimating()
        Alamofire.request("http://35.154.75.20:9090/test/ios", headers: headers).responseJSON { response in
            response.result.withValue({ (raw) in
                if let collections = (raw as? [String: Any])?["collections"] as? [[String: Any]] {
                    
                    var array: [[String: Any]] = []
                    collections.forEach({ (element) in
                        if let collection = element["collection"] as? [String: Any] {
                            array.append(collection)
                        }
                    })
                    
                    self.listOfItems = Item.models(from: array)
                    DispatchQueue.main.async {
                        self.listTableView.reloadData()
                        self.loader.stopAnimating()
                    }
                }
            })
        }
    }
    
    @IBAction func logout() {
        dismiss(animated: true, completion: nil)
    }
}


extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ItemCell = tableView.dequeueReusableCell(for: indexPath)
        let item = listOfItems[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}


extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // We can open the item.url in webview
    }
}
