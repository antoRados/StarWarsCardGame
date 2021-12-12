//
//  CharacterCollectionViewCell.swift
//  StarWarsCardGame
//
//  Created by Anto Rados on 12/11/21.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var characterImageView: UIImageView!
    
    func displayImage(for character: Character) {
        characterImageView.image = character.photo
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.clipsToBounds = true
    }
}
