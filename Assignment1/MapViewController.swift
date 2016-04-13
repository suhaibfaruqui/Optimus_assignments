//
//  MapViewController.swift
//  Assignment1
//
//  Created by Suhaib Umar on 4/13/16.
//  Copyright © 2016 Suhaib. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //assign map delegate to self
        map.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        let coor = CLLocationCoordinate2DMake(28.625548,77.37322100000006)
        let region = MKCoordinateRegionMakeWithDistance(coor, 600, 600);
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = coor
        dropPin.title = "Optimus Information"
        map.addAnnotation(dropPin)
        map.setRegion(region, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
