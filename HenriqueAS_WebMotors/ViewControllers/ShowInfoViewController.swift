//
//  ShowInfoViewController.swift
//  HenriqueAS_WebMotors
//
//  Created by Henrique Silva on 24/06/2018.
//  Copyright © 2018 Henrique Silva. All rights reserved.
//

import UIKit
import SDWebImage

class ShowInfoViewController: UIViewController {
    
    var showCar : Cars!
    
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showCar = VehicleViewModel.sharedInstance.showCar
        
        self.makeLabel.text = "Marca: " + (self.showCar.make)!
        self.modelLabel.text = "Modelo: " + (self.showCar.model)!
        self.carImage.sd_setImage(with: URL(string: showCar.imageCar!), placeholderImage: UIImage(named: "placeholder.png"))
        self.versionLabel.text = "Versão: " + (self.showCar.version)!
        self.kmLabel.text = "KM: \(self.showCar.km ?? 0)"
        self.priceLabel.text = "R$ " + (self.showCar.price)!
        self.yearLabel.text = "Ano \(self.showCar.yearFab ?? 0)/\(self.showCar.yearModel ?? 0)"
        self.colorLabel.text = "Cor: " + self.showCar.colorCar!
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
