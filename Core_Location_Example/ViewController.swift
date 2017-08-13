//
//  ViewController.swift
//  Core_Location_Example
//
//  Created by Sriteja Chilakamarri on 10/07/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserLocation()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        
        locationManager.requestWhenInUseAuthorization()
        
        
        // Here we start locating
        locationManager.startUpdatingLocation()
    
    }
    
    func getUserLocation(){
        
        //SVProgressHUD.show()
        
        if CLLocationManager.locationServicesEnabled() {
            switch(CLLocationManager.authorizationStatus()) {
            case .notDetermined, .restricted, .denied:
                print("No access")
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
                
            }
        } else {
            print("Location services are not enabled")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        //print(location.coordinate.latitude,location.coordinate.longitude)
        
        print(location.altitude,location.course,location.floor,location.speed,location.timestamp,location.verticalAccuracy)
        
        
    }

    


}

