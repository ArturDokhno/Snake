//
//  GameViewController.swift
//  Snake
//
//  Created by Артур Дохно on 15/12/2021.
//

import UIKit
import SpriteKit
import GameplayKit

protocol GameViewControllerDelegate: AnyObject {
    func didEndGame(withResult result: Int)
}

final class GameViewController: UIViewController {
    
    //MARK: - Properties
    
    weak var delegate: GameViewControllerDelegate?
    var difficulty: Difficulty = .medium
    
    private var createAppleStrategy: CreateApplesStrategy {
        switch self.difficulty {
        case .easy:
            return SequentialCreateOneAppleStrategy()
        case .medium, .hard, .insane:
            return RandomCreateOneAppleStrategy()
        }
    }
    
    private var snakeSpeedStrategy: SnakeSpeedStrategy {
        switch self.difficulty {
        case .easy, .medium:
            return NotIncreaseSnakeSpeedStrategy()
        case .hard:
            let strategy = ArithmeticProgressionSnakeSpeedStrategy()
            strategy.maxSpeed = 350.0
            return strategy
        case .insane:
            return GeometricProgressionSnakeSpeedStrategy()
        }
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size,
                              createApplesStrategy: createAppleStrategy,
                              snakeSpeedStrategy: snakeSpeedStrategy)
//        scene.gameDelegate = self
        scene.onGameEnd = { [weak self] result in
            self?.delegate?.didEndGame(withResult: result)
            self?.dismiss(animated: true)
        }
//        scene.onGameEnd = didCallGameEnd
        scene.scaleMode = .resizeFill
        guard let skView = view as? SKView else { return }
        skView.showsFPS = true //включаем отображение fps (количество кадров в секунду)
        skView.showsNodeCount = true //показывать количество объектов на экране
        skView.ignoresSiblingOrder = true //включаем произволный порядок рендеринга объектов в узле
        skView.presentScene(scene)
    }
    
    // реализация функционала замыкания через функцию
//    private func didCallGameEnd(result: Int) {
//        self.delegate?.didEndGame(withResult: result)
//        self.dismiss(animated: true)
//    }
    
    // MARK: - UIViewController
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

//extension GameViewController: GameSceneDelegate {
//
//    func didEndGame(withResult result: Int) {
//        delegate?.didEndGame(withResult: result)
//        dismiss(animated: true)
//    }
//
//}
