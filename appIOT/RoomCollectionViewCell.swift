//
//  RoomCollectionViewCell.swift
//  appIOT
//
//  Created by Ngoduc on 6/3/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit

class RoomCollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet weak var airConditionerView: UIView!
     
   
    @IBOutlet weak var icon1: UIImageView!
    

  
    @IBOutlet weak var switchControl: BigSwitch!
    
    @IBOutlet weak var devide: UILabel!
    
    @IBOutlet weak var state: UILabel!
    
    var roomDetail: RoomM! {
        didSet{
            icon1.image = UIImage(named: roomDetail.icon1)
            switchControl.isOn = roomDetail.icon2
                   devide.text = roomDetail.divice
                   state.text = roomDetail.temp
        }
       
    }
    @IBAction func switchOff(_ sender: UISwitch) {
        print(sender.isOn)
    }
}
