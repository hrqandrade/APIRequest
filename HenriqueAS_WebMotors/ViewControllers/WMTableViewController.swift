//
//  WMTableViewController.swift
//  HenriqueAS_WebMotors
//
//  Created by Henrique Silva on 24/06/2018.
//  Copyright © 2018 Henrique Silva. All rights reserved.
//

import UIKit
import SDWebImage

class WMTableViewController: UITableViewController {
    
    var dataCars : [Cars] = []
    var pageCount = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "FirstViewCarsTableViewCell", bundle: nil), forCellReuseIdentifier: "FirstCell")
        
        if VehicleViewModel.sharedInstance.dataCars.count > 0{
            self.dataCars = VehicleViewModel.sharedInstance.dataCars
            tableView.reloadData()
            VehicleViewModel.sharedInstance.dataCars.removeAll()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var count = dataCars.count
        return count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! FirstViewCarsTableViewCell
        cell.makeLabel.text = String(self.dataCars[indexPath.row].idCar!) + " - " + self.dataCars[indexPath.row].make!
        cell.modelLabel.text = self.dataCars[indexPath.row].model
        cell.priceLabel.text = "R$" + self.dataCars[indexPath.row].price!
        cell.yearLabel.text = "\(self.dataCars[indexPath.row].yearModel!)"
        cell.imageCarView.sd_setImage(with: URL(string: self.dataCars[indexPath.row].imageCar!), placeholderImage: UIImage(named: "placeholder.png"))
        cell.versionLabel.text = self.dataCars[indexPath.row].version
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = dataCars.count-1
        if indexPath.row == lastItem {
            loadMoreData()
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        VehicleViewModel.sharedInstance.showCar = dataCars[indexPath.row]
        
        self.performSegue(withIdentifier: "ShowInfoCar", sender: self)
    }
    func loadMoreData() {
        
        if VehicleViewModel.sharedInstance.exitData != true{
            RequestData.shared.auth(linkString: "http://desafioonline.webmotors.com.br/api/OnlineChallenge/Vehicles?Page=\(pageCount)")
            
            for car in VehicleViewModel.sharedInstance.dataCars{
                dataCars.append(car)
            }
            
            pageCount = pageCount + 1
            tableView.reloadData()
        }
    }
    
}
