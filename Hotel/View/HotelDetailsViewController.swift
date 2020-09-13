//
//  HotelDetailsViewController.swift
//  Hotel
//
//  Created by APPDEV on 12/09/20.
//  Copyright © 2020 APPDEV. All rights reserved.
//

import UIKit

class HotelDetailsViewController: UIViewController {
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var type: UILabel!
    @IBOutlet var bookbtn: UIButton!
    @IBOutlet var amentiesVw: UIView!
    var addcost = 0
    var totalCost = 0
    @IBOutlet var poolbtn: UIButton!
    @IBOutlet var internetbtn: UIButton!
    @IBOutlet var brkfstbtn: UIButton!
    @IBOutlet var gymbtn: UIButton!
    @IBOutlet var spabtn: UIButton!
    @IBOutlet var hottubbtn: UIButton!
    var arrayList: [BookedHotel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = hotelList[currentIndex].hotelName
        bookbtn.layer.cornerRadius = 5.0
        amentiesVw.layer.cornerRadius = 5.0
        amentiesVw.layer.borderWidth = 1.0
        amentiesVw.layer.borderColor = UIColor.green.cgColor
        // Do any additional setup after loading the view.
        name.text = hotelList[currentIndex].hotelName
        price.text = hotelList[currentIndex].cost
        type.text = hotelList[currentIndex].type
        img.sd_setImage(with: URL(string:hotelList[currentIndex].image), placeholderImage: UIImage(named: ""))
        let string = price.text!
        let stringArray = string.components(separatedBy: CharacterSet.decimalDigits.inverted)
        for item in stringArray {
            if let number = Int(item) {
                totalCost = number
              
            }
        }
      
    }
    

    @IBAction func poolAdd(_ sender: UIButton) {
        if poolbtn.isSelected == true {
            poolbtn.isSelected = false
            totalCost = totalCost - 10
            poolbtn.backgroundColor = .clear
        }else {
            poolbtn.isSelected = true
            totalCost = totalCost + 10
            poolbtn.backgroundColor = .lightGray
        }
        
        price.text = "$\(totalCost) per night two Adults"
    }
    
    @IBAction func internetAdd(_ sender: UIButton) {
        if internetbtn.isSelected == true {
            internetbtn.isSelected = false
            totalCost = totalCost - 20
            internetbtn.backgroundColor = .clear
        }else {
            internetbtn.isSelected = true
            totalCost = totalCost + 20
            internetbtn.backgroundColor = .lightGray
        }
        
        price.text = "$\(totalCost) per night two Adults"
    }
    
    @IBAction func brkfastAdd(_ sender: UIButton) {
        if brkfstbtn.isSelected == true {
            brkfstbtn.isSelected = false
            totalCost = totalCost - 25
            brkfstbtn.backgroundColor = .clear
        }else {
            brkfstbtn.isSelected = true
            totalCost = totalCost + 25
            brkfstbtn.backgroundColor = .lightGray
        }
        
        price.text = "$\(totalCost) per night two Adults"
    }
    @IBAction func gymAdd(_ sender: UIButton) {
        if gymbtn.isSelected == true {
            gymbtn.isSelected = false
            totalCost = totalCost - 40
            gymbtn.backgroundColor = .clear
        }else {
            gymbtn.isSelected = true
            totalCost = totalCost + 40
            gymbtn.backgroundColor = .lightGray
        }
        
        price.text = "$\(totalCost) per night two Adults"
    }
    @IBAction func spaAdd(_ sender: UIButton) {
        if spabtn.isSelected == true {
            spabtn.isSelected = false
            totalCost = totalCost - 35
            spabtn.backgroundColor = .clear
        }else {
            spabtn.isSelected = true
            totalCost = totalCost + 35
            spabtn.backgroundColor = .lightGray
        }
        
        price.text = "$\(totalCost) per night two Adults"
    }
    @IBAction func hottubAdd(_ sender: UIButton) {
        if hottubbtn.isSelected == true {
            hottubbtn.isSelected = false
            totalCost = totalCost - 50
            hottubbtn.backgroundColor = .clear
        }else {
            hottubbtn.isSelected = true
            totalCost = totalCost + 50
            hottubbtn.backgroundColor = .lightGray
        }
        
        price.text = "$\(totalCost) per night two Adults"
    }
    
    
    @IBAction func bookHotel(_ sender: UIButton) {
        let hoteldata = BookedHotel (hotelName: name.text!, hotelId: "\(currentIndex+6)", cost: price.text!, image: hotelList[currentIndex].image, type: type.text!)
        if UserDefaults.standard.data(forKey: "SavedData") != nil{
        if let data = UserDefaults.standard.data(forKey: "SavedData") {
            if let decoded = try? JSONDecoder().decode([BookedHotel].self, from: data) {
              
                arrayList.append(contentsOf: decoded)
            }
        }
        }
        arrayList.append(hoteldata)
       
        let data =  try! JSONEncoder().encode(arrayList)
        UserDefaults.standard.set(data, forKey: "SavedData")
        performSegue(withIdentifier: "book", sender: self)
       
    }
}
