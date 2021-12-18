//
//  SnakeSpeedStrategy.swift
//  Snake
//
//  Created by Артур Дохно on 18.12.2021.
//  Copyright © 2021 Pinspb. All rights reserved.
//

import Foundation

protocol SnakeSpeedStrategy: AnyObject {
    
    var snake: Snake? { get set }
    
    var maxSpeed: Double? { get set }
    
    func increaseSpeedByEatingApple()
}

final class NotIncreaseSnakeSpeedStrategy: SnakeSpeedStrategy {
    
    var snake: Snake?
    
    var maxSpeed: Double?
    
    func increaseSpeedByEatingApple() { }
}

final class ArithmeticProgressionSnakeSpeedStrategy: SnakeSpeedStrategy {
    
    var snake: Snake?
    
    var maxSpeed: Double?
    
    private let diff = 10.0
    
    func increaseSpeedByEatingApple() {
        guard let snake = snake else { return }
        snake.moveSpeed.value += self.diff
        if let maxSpeed = maxSpeed {
            if snake.moveSpeed.value > maxSpeed {
                snake.moveSpeed.value = maxSpeed
            }
        }
    }
}

final class GeometricProgressionSnakeSpeedStrategy: SnakeSpeedStrategy {
    
    var snake: Snake?
    
    var maxSpeed: Double?
    
    private let diff = 1.1
    
    func increaseSpeedByEatingApple() {
        guard let snake = snake else { return }
        snake.moveSpeed.value *= diff
        if let maxSpeed = maxSpeed {
            if snake.moveSpeed.value > maxSpeed {
                snake.moveSpeed.value = maxSpeed
            }
        }
    }
}
