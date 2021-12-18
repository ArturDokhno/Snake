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
    @IBOutlet var difficultyControl: UISegmentedControl!
    
    private var selectedDifficulty: Difficulty {
        switch difficultyControl.selectedSegmentIndex {
        case 0:
            return .easy
        case 1:
            return .medium
        case 2:
            return .hard
        case 3:
            return .insane
        default:
            return .medium
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let destination = segue.destination as? GameViewController else { return }
            destination.difficulty = selectedDifficulty
            destination.delegate = self
        case "recordSegue":
            guard segue.destination is RecordViewController else { return }
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
