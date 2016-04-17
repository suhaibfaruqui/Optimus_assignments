//
//  CustomAnnotation.swift
//  Assignment1
//
//  Created by Suhaib Umar on 4/15/16.
//  Copyright © 2016 Suhaib. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    
    var coordinate = CLLocationCoordinate2D()
    var title : String? = "title"
    var subtitle : String? = "subtitle"
    
    func annotationView() -> MKAnnotationView {
        let annotationView = MKAnnotationView(annotation: self, reuseIdentifier: "CustomAnnotation")
        annotationView.enabled = true
        annotationView.canShowCallout = true
        annotationView.image = UIImage(named: "map_pin")
        return annotationView
    }

}
