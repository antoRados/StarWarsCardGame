//
//  FilterViewController.swift
//  StarWarsCardGame
//
//  Created by Anto Rados on 12/11/21.
//

import UIKit


protocol FilterSelectionDelegate: class {
    func selected(faction: String)
}


// filter function to let you choose sith or jedi character faction.
class FilterViewController: UIViewController {
    
    weak var delegate: FilterSelectionDelegate?
    
    @IBAction func sithButtonTapped(_ sender: Any) {
        delegate?.selected(faction: "sith")
        self.dismiss(animated: true)
    }
    
    @IBAction func jediButtonTapped(_ sender: Any) {
        delegate?.selected(faction: "jedi")
        self.dismiss(animated: true)
    }
    
} //End "FilterViewController" class
