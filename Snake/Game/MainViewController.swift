//
//  MainViewController.swift
//  Snake
//
//  Created by Артур Дохно on 17.12.2021.
//  Copyright © 2021 Pinspb. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet var lastResultLabel: UILabel!
    @IBOutlet var startGameButton: UIButton!
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let destination = segue.destination as? GameViewController else { return }
            destination.delegate = self
        default:
            break
        }
    }
    
}

extension MainViewController: GameViewControllerDelegate {
    
    func didEndGame(withResult result: Int) {
        lastResultLabel.text = "Последний результат: \(result)"
    }
    
}
