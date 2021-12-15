//
//  CollisionCategories.swift
//  Snake
//
//  Created by Артур Дохно on 15/12/2021.
//

import Foundation

/// Категория пересчения объектов
struct CollisionCategories {
    //Тело змеи
    static let Snake: UInt32     = 0x1 << 0
    //Голова змеи
    static let SnakeHead: UInt32 = 0x1 << 1
    //Яблоко
    static let Apple: UInt32     = 0x1 << 2
    //Край сцены (экрана)
    static let EdgeBody: UInt32  = 0x1 << 3
}
