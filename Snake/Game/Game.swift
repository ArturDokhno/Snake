//
//  Game.swift
//  Snake
//
//  Created by Артур Дохно on 17.12.2021.
//  Copyright © 2021 Pinspb. All rights reserved.
//

import Foundation

final class Game {
    
    static let shared = Game()
    
    private let recordsCaretaker = RecordsCaretaker()
    
    private(set) var records: [Record] {
        didSet {
            recordsCaretaker.save(records: self.records)
        }
    }
    
    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
    }
    
    func addREcord(_ record: Record) {
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
}
