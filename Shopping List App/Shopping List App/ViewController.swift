//
//  ViewController.swift
//  Shopping List App
//
//  Created by Sayanthan Sriskandarajah on 10/27/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var listNameLabel: UILabel!
    @IBOutlet weak var listItemLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var listNameTextField: UITextField!
    
    var itemOne = Int()
    var itemTwo = Int()
    var itemThree = Int()
    var itemFour = Int()
    var itemFive = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupView()
        self.setupTableView()
    }
    
    func setupView() {
        topLabel.text = "Create Shopping List"
        listNameLabel.text = "Enter New list Name"
        listItemLabel.text = "Enter New List Item"
        quantityLabel.text = "Quantity"
        saveButton.setTitle("Save", for: .normal)
        cancelButton.setTitle("Cancel", for: .normal)
    }
    
    func setupTableView() {
        tableView.register(ShoppingTableViewCell.self)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.isUserInteractionEnabled = true
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.itemOne = 0
        self.itemTwo = 0
        self.itemThree = 0
        self.itemFour = 0
        self.itemFive = 0
        self.listNameTextField.text = ""
        self.tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, ButtonTappedDelegate {
   
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ShoppingTableViewCell.self), for: indexPath) as! ShoppingTableViewCell
        cell.delegate = self
        cell.quantityLabel.text = "0"
        return cell
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func increaseValue(cell: ShoppingTableViewCell) {
        var countValue = String()
        if let indexPath = tableView.indexPath(for: cell) {
            if (indexPath.row == 0) {
                itemOne = 1 + itemOne
                countValue = "\(itemOne)"
            }else if (indexPath.row == 1) {
                itemTwo = 1 + itemTwo
                countValue = "\(itemTwo)"
            }else if (indexPath.row == 2) {
                itemThree = 1 + itemThree
                countValue = "\(itemThree)"
            }else if (indexPath.row == 3) {
                itemFour = 1 + itemFour
                countValue = "\(itemFour)"
            }else {
                itemFive = 1 + itemFive
                countValue = "\(itemFive)"
            }
        }
        cell.quantityLabel.text = countValue
    }
    
    func decreaseValue(cell: ShoppingTableViewCell) {
        var countValue = String()
        if let indexPath = tableView.indexPath(for: cell) {
            if (indexPath.row == 0) {
                if (itemOne == 0) {
                    countValue = "0"
                }else {
                    itemOne = itemOne - 1
                    countValue = "\(itemOne)"
                }
            }else if (indexPath.row == 1) {
                if (itemTwo == 0) {
                    countValue = "0"
                }else {
                    itemTwo = itemTwo - 1
                    countValue = "\(itemTwo)"
                }
            }else if (indexPath.row == 2) {
                if (itemThree == 0) {
                    countValue = "0"
                }else {
                    itemThree = itemThree - 1
                    countValue = "\(itemThree)"
                }
            }else if (indexPath.row == 3) {
                if (itemFour == 0) {
                    countValue = "0"
                }else {
                    itemFour = itemFour - 1
                    countValue = "\(itemFour)"
                }
            }else {
                if (itemFive == 0) {
                    countValue = "0"
                }else {
                    itemFive = itemFive - 1
                    countValue = "\(itemFive)"
                }
            }
        }
        cell.quantityLabel.text = countValue
    }
    
}
