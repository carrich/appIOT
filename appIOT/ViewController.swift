//
//  ViewController.swift
//  appIOT
//
//  Created by Ngoduc on 6/3/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var notification: UIView!
    @IBOutlet weak var RoomTable: UITableView!
    
    @IBOutlet var oval: UIView!
    
    let rooms = [ Room(name: "Living Room", div: "4 Devices", image: "Background"),
                  Room(name: "Media Room", div: "6 Devices", image: "BackgroundM"),
                  Room(name: "Bathroom", div: "4 Devices", image: "BackgroundB"),
                  Room(name: "Bedroom", div: "4 Devices", image: "BackgroundBe")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notification.layer.cornerRadius = 8
        RoomTable.register(UINib(nibName: "RoomTableViewCell", bundle: nil), forCellReuseIdentifier: "RoomTableViewCell")
        RoomTable.separatorStyle = .none
        RoomTable.rowHeight = 140
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTableViewCell", for: indexPath) as! RoomTableViewCell
        cell.name.text = rooms[indexPath.row].name
        cell.device.text = rooms[indexPath.row ].div
        cell.background.image = UIImage(named: rooms[indexPath.row].image)
        return cell
    }
    
    
}
