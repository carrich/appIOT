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
    
    @IBOutlet weak var icon2: UIImageView!
    
    @IBOutlet weak var devide: UILabel!
    
    @IBOutlet weak var state: UILabel!
    
    var roomDetail: RoomM! {
        didSet{
            icon1.image = UIImage(named: roomDetail.icon1)
                   icon2.image = UIImage(named: roomDetail.icon2)
                   devide.text = roomDetail.divice
                   state.text = roomDetail.temp
        }
       
    }
}
