//
//  ViewController.swift
//  Pokedex
//
//  Created by Nathan Mora on 24/11/23.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var typesFormLabel: UILabel!
    @IBOutlet weak var formsLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var stackViewDescription: UIStackView!
    @IBOutlet weak var ChangePokemonButton: UIButton!
    
    var pokemon: Pokemon?
    var viewModel = HomeViewModel(with: Pokemon())
    var selected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        
    }
    
    func updateData() {
        let number = Int.random(in: 0...80)
        let myString = String(number)
        viewModel.fetchPokemons(numberRandom: myString) {
            DispatchQueue.main.async {
                self.setDataView()
            }
        }
    }
    
    @IBAction func changePokemon(_ sender: Any) {
        stackViewDescription.isHidden = false
        self.animateButton(sender as! UIView)
        self.updateData()
    }
    
    func setDataView() {
        self.setImage(id: pokemon?.idString ?? "")
        self.labelName.text = pokemon?.name ?? ""
        let types = viewModel.pokemon?.types.map({$0.type.name.capitalized}).joined(separator: ", ")
        let forms = viewModel.pokemon?.forms.map({$0.name.capitalized}).joined(separator: ", ")
        let weight = String(format: "%.1fkg", Double(viewModel.pokemon?.weight ?? 0) / 10.0)
        let height = String(format: "%.1fm", Double(viewModel.pokemon?.height ?? 0) / 10.0)

        labelName.text = viewModel.pokemon?.name.capitalized
        weightLabel.text = weight
        heightLabel.text = height
        typesFormLabel.text = types
        formsLabel.text = forms
        setImage(id: viewModel.pokemon?.idString ?? "")
        
    }
    
    func setImage(id: String) {
        self.imagePokemon.sd_setImage(with: URL(string: "\(Constants.imageUrl)\(id).png"))
    }
    
    func setupStyle() {
        stackViewDescription.isHidden = true
        imagePokemon.layer.cornerRadius = 12
        ChangePokemonButton.layer.cornerRadius = 12
        
    }
    
    fileprivate func animateButton(_ viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }) {(_) in
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
    
}

