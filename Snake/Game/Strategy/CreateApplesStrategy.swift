//
//  CreateApplesStrategy.swift
//  Snake
//
//  Created by Артур Дохно on 18.12.2021.
//  Copyright © 2021 Pinspb. All rights reserved.
//

import UIKit

protocol CreateApplesStrategy {
    func createApples(in rect: CGRect) -> [Apple]
}

final class RandomCreateOneAppleStrategy: CreateApplesStrategy {
    
    func createApples(in rect: CGRect) -> [Apple] {
        let randX = CGFloat(arc4random_uniform(UInt32(rect.maxX - 5)) + 1)
        let randY = CGFloat(arc4random_uniform(UInt32(rect.maxY - 5)) + 1)
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        return [apple]
    }
}

final class SequentialCreateOneAppleStrategy: CreateApplesStrategy {
    
    private let positions = [CGPoint(x: 210, y: 210),
                             CGPoint(x: 250, y: 250),
                             CGPoint(x: 150, y: 250),
                             CGPoint(x: 250, y: 300),
                             CGPoint(x: 210, y: 210),
                             CGPoint(x: 200, y: 210),
                             CGPoint(x: 200, y: 250),
                             CGPoint(x: 100, y: 200),
                             CGPoint(x: 150, y: 300),
                             CGPoint(x: 150, y: 250)]
    
    private var lastUsedPositionIndex = -1
    
    func createApples(in rect: CGRect) -> [Apple] {
        self.lastUsedPositionIndex += 1
        if self.lastUsedPositionIndex >= self.positions.count {
            self.lastUsedPositionIndex = 0
        }
        let position = self.positions[self.lastUsedPositionIndex]
        let apple = Apple(position: position)
        return [apple]
    }
}
