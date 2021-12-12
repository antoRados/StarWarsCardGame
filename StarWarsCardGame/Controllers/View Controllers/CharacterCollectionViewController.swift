//
//  CharacterCollectionViewController.swift
//  StarWarsCardGame
//
//  Created by Anto Rados on 12/11/21.
//

import UIKit

class CharacterCollectionViewController: UICollectionViewController {
    
    // private variables that hold an array of characters that are being displayed, which faction they belong to, and the target character
    private var displayedCharacters: [Character] = []
    private var selectedFaction = "jedi"
    private var targetCharacter: Character?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleCharacters(for: selectedFaction)

    } //End "viewDidLoad" function

    
    // function to shuffle characters that are being displayed on screen
    func shuffleCharacters(for faction: String) {
        if faction == "jedi" {
            let jediGroup = CharacterController.jedi.prefix(3)
            displayedCharacters = Array(jediGroup)
            targetCharacter = CharacterController.sith.randomElement()
        } else if faction == "sith" {
            let sithGroup = CharacterController.sith.prefix(3)
            displayedCharacters = Array(sithGroup)
            targetCharacter = CharacterController.jedi.randomElement()
        }
        updateViews()
        
    } //End "shuffleCharacters" function
    
    
    // adds the target character to the displayedCharacters array and shuffles that array.  Also reloads the collection view data, and changes the title to the requested characters name.
    func updateViews() {
        guard let character = targetCharacter else { return }
        displayedCharacters.append(character)
        displayedCharacters.shuffle()
        collectionView.reloadData()
        title = "Find \(character.name)"
    
    } //End "updateViews" function
    
    
    // function to display a basic alert.
    func presentAlert(for character: Character) {
        
        // checks if character is equatable to targetCharacter, returns bool to success
        let success = character == targetCharacter
        
        // creates alert controller whose title depends on the success variable
        let alertController = UIAlertController(title: success ? "Good job!" : "Better luck next time", message: nil, preferredStyle: .alert)
        
        // creates two different actions that can be selected once the alert is displayed.
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        let shuffleAction = UIAlertAction(title: "Shuffle", style: .default) { _ in
            self.shuffleCharacters(for: self.selectedFaction)
        }
        
        // doneAction will always be displayed, while shuffleAction is conditional on the user input
        alertController.addAction(doneAction)
        
        if success {
            alertController.addAction(shuffleAction)
        }
        
        present(alertController, animated: true)
        
    } //End "presentAlert" function
    
    
    
    // MARK: - Navigation
    
    // segue from CharacterCollectionViewController to FilterViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "filterVC" {
            let vc = segue.destination as? FilterViewController
            vc?.delegate = self
        }
    } //End "prepare" function


    
    // MARK: - UICollectionViewDataSource
    
    // dynamically sets the number of items per section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        displayedCharacters.count
    } //End numberOfItemsInSection

    
    // assigns the selected cell to "cell", then assigns the target character based on the indexPath, and finally displays the corresponding image in the selected cell.
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as? CharacterCollectionViewCell else { return UICollectionViewCell() }
        
        let targetCharacter = displayedCharacters[indexPath.row]
        cell.displayImage(for: targetCharacter)
        
        return cell
    } //End cellForItemAt

    
    
    // MARK: - UICollectionViewDelegate
    
    // specifies which character the alert is displayed for
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = displayedCharacters[indexPath.row]
        presentAlert(for: character)
    
    } //End didSelectItemAt
} //End "CharacterCollectionViewController" class


// custom sizing for the displayed items
extension CharacterCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        return CGSize(width: width - 15, height: width + 30)
    }
} //End "CharacterCollectionViewController" extension


// sets selected faction, reapplies selected faction based on filter selection, then shuffles characters within selected faction
extension CharacterCollectionViewController: FilterSelectionDelegate {
    func selected(faction: String) {
        selectedFaction = faction
        shuffleCharacters(for: selectedFaction)
    }
} //End "CharacterCollectionViewController" extension
