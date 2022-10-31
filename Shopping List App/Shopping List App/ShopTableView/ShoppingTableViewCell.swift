//
//  ShoppingTableViewCell.swift
//  Shopping List App
//
//  Created by kurupareshan pathmanathan on 10/27/22.
//

import UIKit

protocol ButtonTappedDelegate{
    
    func increaseValue(cell: ShoppingTableViewCell)
    func decreaseValue(cell: ShoppingTableViewCell)

}

class ShoppingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var decreaseButton: UIButton!
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var increaseButton: UIButton!
    var delegate: ButtonTappedDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        increaseButton.setTitle("", for: .normal)
        decreaseButton.setTitle("", for: .normal)
        increaseButton.setImage(UIImage(named: "inc"), for: .normal)
        decreaseButton.setImage(UIImage(named: "dec"), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func increaseButtonTapped(_ sender: Any) {
        delegate?.increaseValue(cell: self)
    }
    
    
    @IBAction func decreaseButtonTapped(_ sender: Any) {
        delegate?.decreaseValue(cell: self)
    }
}
