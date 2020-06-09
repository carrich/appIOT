//
//  SecondViewController.swift
//  appIOT
//
//  Created by Ngoduc on 6/4/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    enum State {
        case active
        case inactive
    }
    var ac = State.inactive
    
    @IBOutlet weak var ADD: UIView!
    @IBOutlet weak var controlTable: UIView!
    @IBOutlet weak var circleIndecate: Canvas!
    @IBOutlet weak var valueText: UILabel!
    @IBOutlet weak var cotrolSlider: UISlider!
    @IBOutlet weak var controllview: UIView!
    @IBOutlet weak var collectionView1: UICollectionView!
    var listRoom = [ RoomM(icon1: "Snowflake Icon", icon2: "Toggle", divice: "Air Conditioner", temp: "25°C"),
                     RoomM(icon1: "Light Bulb Icon", icon2: "Toggle", divice: "Room Lights", temp: "5000K"),
                     RoomM(icon1: "Speaker Icon", icon2: "Toggle", divice: "All Speakers", temp: "75% Volume"),
                     RoomM(icon1: "TV Icon", icon2: "Toggle1", divice: "Samsung TV", temp: "Off"),
                     RoomM(icon1: "Controller Icon", icon2: "Toggle1", divice: "PlayStation 4", temp: "Off"),
                     RoomM(icon1: "Equalizer Icon", icon2: "Toggle", divice: "Sound System", temp: "Connected")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        ADD.layer.borderWidth = 2
        ADD.layer.borderColor = UIColor.gray.cgColor
        
        ADD.layer.cornerRadius = 12.5
        controlTable.center.y += 600
        controllview.layer.shadowColor = UIColor(red: 0.145, green: 0.2, blue: 0.294, alpha: 0.1).cgColor
        controllview.layer.shadowOffset = CGSize(width: 0, height: 3)
        controllview.layer.shadowRadius = 3
        controllview.layer.shadowOpacity = 1
        controllview.layer.cornerRadius = 12.5
        
        controlTable.layer.shadowColor = UIColor(red: 0.145, green: 0.2, blue: 0.294, alpha: 0.1).cgColor
        controlTable.layer.shadowOffset = CGSize(width: 0, height: 3)
        controlTable.layer.shadowRadius = 3
        controlTable.layer.shadowOpacity = 1
        
        controlTable.layer.cornerRadius = 12.5
    }
    
    @IBAction func changeValue(_ sender: Any) {
        let value = cotrolSlider.value * 180
        circleIndecate.changeValue = Int(value)
        valueText.text = "\((Int(value/9)) + 10)°C"
    }
    
    @IBAction func closeControlTable(_ sender: Any) {
        if ac == .active {
            UIView.animate(withDuration: 2) {
                self.controlTable.center.y += 600
            }
            ac = .inactive
        }
    }
    @objc func popup(){
        if ac == .inactive {
            UIView.animate(withDuration: 1) {
                self.controlTable.center.y -= 600
            }
            ac = .active
            
        }
        
    }
}

extension SecondViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoomCell", for: indexPath) as! RoomCollectionViewCell
        Cell.airConditionerView.layer.shadowColor = UIColor(red: 0.145, green: 0.2, blue: 0.294, alpha: 0.1).cgColor
        Cell.airConditionerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        Cell.airConditionerView.layer.shadowRadius = 3
        Cell.airConditionerView.layer.shadowOpacity = 1
        Cell.airConditionerView.layer.cornerRadius = 12.5
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(popup))
        Cell.airConditionerView.addGestureRecognizer(tap)
        
        Cell.roomDetail = listRoom[indexPath.row]
        
        return Cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
}


