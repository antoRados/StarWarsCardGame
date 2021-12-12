//
//  CharacterCollectionViewCell.swift
//  StarWarsCardGame
//
//  Created by Anto Rados on 12/11/21.
//

import UIKit

// sets the settings for each cell.  assigns image and aspect ratio
class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var characterImageView: UIImageView!
    
    func displayImage(for character: Character) {
        characterImageView.image = character.photo
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.clipsToBounds = true
    
    }
}  //End of "CharacterCollectionViewCell" class
