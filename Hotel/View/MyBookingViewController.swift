//
//  MyBookingViewController.swift
//  Hotel
//
//  Created by APPDEV on 12/09/20.
//  Copyright © 2020 APPDEV. All rights reserved.
//

import UIKit

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: [Iterator.Element: Bool] = [:]
        return self.filter { seen.updateValue(true, forKey: $0) == nil }
    }
}

class MyBookingViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource  {
@IBOutlet var tableView: UITableView!
  
    var result : [Hotel] = []
    var bookedHotel: [BookedHotel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My Booking"
        if let data = UserDefaults.standard.data(forKey: "SavedData") {
            if let decoded = try? JSONDecoder().decode([BookedHotel].self, from: data) {
               
                bookedHotel.append(contentsOf: decoded)
              
                
            
            }
        }
        tableView.register(HotelTableViewCell.nib(), forCellReuseIdentifier: HotelTableViewCell.cellidentifier)
    }
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if bookedHotel.count > 0{
            tableView.isHidden = false
            tableView.reloadData()
        }
        else{
            tableView.isHidden = true
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return bookedHotel.count
     }
     
     // create a cell for each table view row
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         // create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: HotelTableViewCell.cellidentifier) as! HotelTableViewCell
        cell.dealBtn.isHidden = true
        let model = bookedHotel[indexPath.row]
        cell.configure(with: CellViewModel(hotelId: model.hotelId, hotelName:model.hotelName, image: model.image,cost:model.cost,type:model.type))
         return cell
     }
     
     // method to run when table view cell is tapped
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
         print("You tapped cell number \(indexPath.row).")
         
     }
}
