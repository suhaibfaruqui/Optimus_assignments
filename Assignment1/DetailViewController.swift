//
//  DetailViewController.swift
//  Assignment1
//
//  Created by Suhaib Umar on 4/16/16.
//  Copyright © 2016 Suhaib. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
    var importedPlacemark = [CLPlacemark]() //var for receiving the placemarks from mapViewController
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //Display the location details on the label
        addressLabel.text = "\(importedPlacemark[0].subLocality!) \n\(importedPlacemark[0].thoroughfare!)\n\(importedPlacemark[0].locality!) \(importedPlacemark[0].postalCode!) \n\(importedPlacemark[0].country!) "

    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
}
