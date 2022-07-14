//
//  ViewController.swift
//  JSonserDecode
//
//  Created by Consultant on 7/13/22.
//

import UIKit

class ViewController: UIViewController {

//    lazy var manualDecodeButton: UIButton = {
//        let button = UIButton(frame: .zero)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Manually Decode Data", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .systemBlue
//        button.layer.cornerRadius = 15.0
//        button.addTarget(self, action: #selector(self.manualDecodeButtonPressed), for: .touchUpInside)
//        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
//        return button
//    }()
    
    lazy var decodableDecodeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Decodable Decode Data", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15.0
        button.addTarget(self, action: #selector(self.decodableButtonPressed), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return button
    }()
    
    
    let network = NetworkManager()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.decodableDecodeButton)
        //self.view.addSubview(self.manualDecodeButton)
        
        self.decodableDecodeButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.decodableDecodeButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -50).isActive = true
        self.decodableDecodeButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.decodableDecodeButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
//        self.manualDecodeButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//        self.manualDecodeButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 50).isActive = true
//        self.manualDecodeButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        self.manualDecodeButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
    }
    
    @objc
    func decodableButtonPressed() {
        let pokemon = self.network.getPokemonDecodable()
        //self.network.getPokemonDecodable()
        self.presentPokemonAlert(pokemon: pokemon)
    }
    
//    @objc
//    func manualDecodeButtonPressed() {
//
//        let pokemon = self.network.getPokemonManually()
//        self.presentPokemonAlert(pokemon: pokemon)
//    }
    
    func presentPokemonAlert(pokemon: Pokemon?) {
        guard let pokemon = pokemon else { return }

        let names = pokemon.pokemon.compactMap { $0.pokemon.name }.reduce("") { partialResult, name in
            return partialResult + name + "\n"
        }
//        print("ok")
//        let names = pokemon.pokemon
//        print("\(names)")
//        print("ok")
        
//        let alert = UIAlertController(title: "name", message: "\(names)", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Fuck Off", style: .default, handler: nil)
//        alert.addAction(action)
//        DispatchQueue.main.async {
//            self.present(alert, animated: true, completion: nil)}

        let alert = UIAlertController(title: pokemon.name, message: names, preferredStyle: .alert)
        let action = UIAlertAction(title: "Sounds Good", style: .default, handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }

        
//
    


    }}

