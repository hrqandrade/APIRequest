//
//  VehiclesModel.swift
//  HenriqueAS_WebMotors
//
//  Created by Henrique Silva on 24/06/2018.
//  Copyright © 2018 Henrique Silva. All rights reserved.
//

import UIKit

class VehicleViewModel{
    static let sharedInstance = VehicleViewModel()
    var dataCars: [Cars] = []
    var exitData = false
    var showCar: Cars?
}

class Cars {
    
    var idCar: Int?
    var make: String?
    var model: String?
    var version: String?
    var imageCar: String?
    var km: Int?
    var price: String?
    var yearModel: Int?
    var yearFab: Int?
    var colorCar: String?
    
    init(idCar: Int?, make: String?, model: String?, version: String?, imageCar: String?, km: Int?, price: String?, yearModel: Int?, yearFab: Int?, colorCar: String?) {
        self.idCar = idCar
        self.make = make
        self.model = model
        self.version = version
        self.imageCar = imageCar
        self.km = km
        self.price = price
        self.yearModel = yearModel
        self.yearFab = yearFab
        self.colorCar = colorCar
    }
    
}

