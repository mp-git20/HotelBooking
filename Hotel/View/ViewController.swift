//
//  ViewController.swift
//  Hotel
//
//  Created by APPDEV on 12/09/20.
//  Copyright © 2020 APPDEV. All rights reserved.
//

import UIKit

   var hotelList: [Hotel] = []
   var currentIndex = 0
   var fm = FileManager.default
   var fresult: Bool = false
   var subUrl: URL?
   var mainUrl: URL? = Bundle.main.url(forResource: "hotel", withExtension: "json")



class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {
@IBOutlet var tableView: UITableView!
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
         tableView.register(HotelTableViewCell.nib(), forCellReuseIdentifier: HotelTableViewCell.cellidentifier)
        do {

             let url = Bundle.main.url(forResource: "hotel", withExtension: "json")!
             let data = try Data(contentsOf: url)
             let res = try JSONDecoder().decode([Hotel].self, from: data)
             hotelList = res
            

        }
        catch {
            print(error)
        }
        // Do any additional setup after loading the view.
    }

  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return hotelList.count
     }
     
     // create a cell for each table view row
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         // create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: HotelTableViewCell.cellidentifier) as! HotelTableViewCell
        let model = hotelList[indexPath.row]
        cell.configure(with: CellViewModel(hotelId: model.hotelId, hotelName:model.hotelName, image: model.image,cost:model.cost,type:model.type))
         return cell
     }
     
     // method to run when table view cell is tapped
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
         print("You tapped cell number \(indexPath.row).")
        currentIndex = indexPath.row
        performSegue(withIdentifier: "details", sender: self)
         
     }
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

