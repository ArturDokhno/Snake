//
//  RecordViewController.swift
//  Snake
//
//  Created by Артур Дохно on 17.12.2021.
//  Copyright © 2021 Pinspb. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

}

extension RecordViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath)
        let record = Game.shared.records[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        cell.textLabel?.text = "\(record.score)" 
        cell.detailTextLabel?.text = dateFormatter.string(from: record.date)
        return cell
    }
    
    
}
