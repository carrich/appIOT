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
    
    var swiftOn = false
    var nameDivice = ""
    var ac = State.inactive
    
    @IBOutlet weak var midPoint: UILabel!
    @IBOutlet weak var endPoint: UILabel!
    @IBOutlet weak var startPoint: UILabel!
    @IBOutlet weak var nameDiviceController: UILabel!
    @IBOutlet weak var ADD: UIView!
    @IBOutlet weak var controlTable: UIView!
    @IBOutlet weak var circleIndecate: Canvas!
    @IBOutlet weak var valueText: UILabel!
    @IBOutlet weak var cotrolSlider: UISlider!
    @IBOutlet weak var controllview: UIView!
    @IBOutlet weak var collectionView1: UICollectionView!
    var listRoom = [ RoomM(icon1: "Snowflake Icon", icon2: true, divice: "Air Conditioner", temp: "25°C"),
                     RoomM(icon1: "Light Bulb Icon", icon2: true, divice: "Room Lights", temp: "5000K"),
                     RoomM(icon1: "Speaker Icon", icon2: true, divice: "All Speakers", temp: "75% Volume"),
                     RoomM(icon1: "TV Icon", icon2: false, divice: "Samsung TV", temp: "Off"),
                     RoomM(icon1: "Controller Icon", icon2: false, divice: "PlayStation 4", temp: "Off"),
                     RoomM(icon1: "Equalizer Icon", icon2: false, divice: "Sound System", temp: "Connected")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        ADD.layer.borderWidth = 2
        //        ADD.layer.borderColor = UIColor.gray.cgColor
        //
        //        ADD.layer.cornerRadius = 12.5
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
        switch nameDivice {
        case "Air Conditioner":
            let value = cotrolSlider.value * 180
            circleIndecate.changeValue = Int(value)
            valueText.text = "\((Int(value/9)) + 10)°C"
        case "Room Lights":
            let value = cotrolSlider.value * 180
            circleIndecate.changeValue = Int(value)
            valueText.text = "\((Int(10000*cotrolSlider.value)))K"
        case "All Speakers":
            let value = cotrolSlider.value * 180
            circleIndecate.changeValue = Int(value)
            valueText.text = "\((Int(100*cotrolSlider.value)))%"
        default:
            print("Ok")
        }
        
    }
    
    @IBAction func closeControlTable(_ sender: Any) {
        if ac == .active {
            UIView.animate(withDuration: 2) {
                self.controlTable.center.y += 600
            }
            ac = .inactive
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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(popup(_ :)))
        Cell.switchControl.addGestureRecognizer(tap)
        
        Cell.roomDetail = listRoom[indexPath.row]
        
        return Cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        swiftOn = listRoom[indexPath.row].icon2
        nameDivice = listRoom[indexPath.row].divice
        if ac == .inactive && swiftOn {
            switch nameDivice {
            case "Air Conditioner":
                nameDiviceController.text = "Change Temperate"
            case "Room Lights":
                startPoint.text = "0 K"
                midPoint.text = "5000 K"
                endPoint.text = "10000 K"
                valueText.text = "0 K"
                nameDiviceController.text = "Change Lumina"
            case "All Speakers":
                startPoint.text = "0 %"
                midPoint.text = "50 %"
                endPoint.text = "100 %"
                valueText.text = "0 %"
                nameDiviceController.text = "Change Volume"
            default:
                print("Node")
            }
            
            UIView.animate(withDuration: 1) {
                self.controlTable.center.y -= 600
            }
            ac = .active
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    @objc func popup(_ sender: BigSwitch){
        print("g")
    }
    
}


