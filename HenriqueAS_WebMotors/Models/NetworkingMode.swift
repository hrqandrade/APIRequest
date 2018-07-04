//
//  NetworkingMode.swift
//  HenriqueAS_WebMotors
//
//  Created by Henrique Silva on 24/06/2018.
//  Copyright © 2018 Henrique Silva. All rights reserved.
//

import UIKit
import PromiseKit


class RequestData {
    
    static let shared = RequestData()
    
    
    var idCarTemp: [Int] = []
    var makeTemp: [String] = []
    var modelTemp: [String] = []
    var versionTemp: [String] = []
    var imageCarTemp: [String] = []
    var kmTemp: [Int] = []
    var priceTemp: [String] = []
    var yearModelTemp: [Int] = []
    var yearFabTemp: [Int] = []
    var colorCarTemp: [String] = []
    
    func auth(linkString: String) -> Promise<Bool> {
        return Promise { success, reject in
            
            var session: URLSession?
            let config = URLSessionConfiguration.default
            session = URLSession(configuration: config)
            
            let link = linkString
            
            let url = URL(string: link)
            
            let task = session?.dataTask(with: url!, completionHandler: { (data, response, error)
                in
                guard error == nil else {
                    reject(false as! Error)
                    return
                }
                
                guard let data = data else {
                    reject(false as! Error)
                    return
                }
                
                if data != nil{
                    self.idCarTemp = self.retornarInt(data: data, campo: "ID")
                    self.makeTemp = self.retornarDados(data: data, campo: "Make")
                    self.modelTemp = self.retornarDados(data: data, campo: "Model")
                    self.versionTemp = self.retornarDados(data: data, campo: "Version")
                    self.imageCarTemp = self.retornarDados(data: data, campo: "Image")
                    self.kmTemp = self.retornarInt(data: data, campo: "KM")
                    self.priceTemp = self.retornarDados(data: data, campo: "Price")
                    self.yearModelTemp = self.retornarInt(data: data, campo: "YearModel")
                    self.yearFabTemp = self.retornarInt(data: data, campo: "YearFab")
                    self.colorCarTemp = self.retornarDados(data: data, campo: "Color")
                    VehicleViewModel.sharedInstance.dataCars.removeAll()
                    
                    if self.makeTemp.count > 0 {
                        for i in 0...self.makeTemp.count-1{
                            var dataTemp = Cars(idCar: self.idCarTemp[i], make: self.makeTemp[i], model: self.modelTemp[i], version: self.versionTemp[i], imageCar: self.imageCarTemp[i], km: self.kmTemp[i], price: self.priceTemp[i], yearModel: self.yearModelTemp[i], yearFab: self.yearFabTemp[i], colorCar: self.colorCarTemp[i])
                            
                            VehicleViewModel.sharedInstance.dataCars.append(dataTemp)
                            
                        }
                    }else{
                        VehicleViewModel.sharedInstance.exitData = true
                    }
                    
                }else{
                    VehicleViewModel.sharedInstance.exitData = true
                }
            })
            
            task?.resume()
            
            
        }
        self.tempRemoveAll()
    }
    
    func retornarDados(data:Data, campo:String) -> Array<String>{
        
        var resposta: [Any] = []
        do{
            let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            if json.count > 0 {
                for index in 0...json.count-1{
                    let aObject = json[index] as! [String : AnyObject]
                    
                    resposta.append(aObject[campo] as! String)
                }
                
            }
            
        }catch let error as NSError{
            return ["Falha ao carregar: \(error.localizedDescription)"]
        }
        return resposta as! Array<String>
    }
    
    func retornarInt(data:Data, campo:String) -> Array<Int>{
        
        var resposta: [Any] = []
        do{
            let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            if json.count > 0 {
                for index in 0...json.count-1{
                    let aObject = json[index] as! [String : AnyObject]
                    
                    resposta.append(aObject[campo] as! Int)
                }
            }
            
        }catch let error as NSError{
            return [0]
        }
        return resposta as! Array<Int>
    }
    
    func tempRemoveAll(){
        self.idCarTemp.removeAll()
        self.makeTemp.removeAll()
        self.modelTemp.removeAll()
        self.versionTemp.removeAll()
        self.imageCarTemp.removeAll()
        self.kmTemp.removeAll()
        self.priceTemp.removeAll()
        self.yearModelTemp.removeAll()
        self.yearFabTemp.removeAll()
        self.colorCarTemp.removeAll()
    }
}
