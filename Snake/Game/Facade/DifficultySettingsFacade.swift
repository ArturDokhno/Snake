//
//  DifficultySettingsFacade.swift
//  Snake
//
//  Created by Артур Дохно on 18.12.2021.
//  Copyright © 2021 Pinspb. All rights reserved.
//

import UIKit
import SpriteKit

final class DifficultySettingsFacade {
    
    let difficulty: Difficulty
    
    weak var snake: Snake? {
        didSet {
            snakeSpeedStrategy.snake = snake
        }
    }
    
    // MARK: - Strategies
    
    private lazy var createApplesStrategy: CreateApplesStrategy = {
        switch self.difficulty {
        case .easy:
            return SequentialCreateOneAppleStrategy()
        case .medium, .hard, .insane:
            return RandomCreateOneAppleStrategy()
        }
    }()
    
    private lazy var snakeSpeedStrategy: SnakeSpeedStrategy = {
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
    }()
    
    // MARK: - Init
    
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
    }
    // MARK: - Methods
    
    func createApples(in scene: SKScene) -> [Apple] {
        return createApplesStrategy.createApples(in: scene.frame)
    }
    
    func increaseSnakeSpeed() {
        self.snakeSpeedStrategy.increaseSpeedByEatingApple()
    }
}
