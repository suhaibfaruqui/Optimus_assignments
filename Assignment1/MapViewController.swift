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
    var geocoder = CLGeocoder()
    let coordinates = CLLocationCoordinate2DMake(28.6109401,77.23448200000007) //coordinates of India Gate
    var placemark = [CLPlacemark]() //Array to store placemarks
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        map.delegate = self //assign map delegate to self
        locationManager.requestWhenInUseAuthorization() //request authorization for mapview
        
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        
        let region = MKCoordinateRegionMakeWithDistance(coordinates, 600, 600);
        map.setRegion(region, animated: true) //set region to show around coordinates
        self.getPlacemarkFromLocation(CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)) //get placemarks to show on annotation view callout
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        //set the view of annotation
        if annotation.isKindOfClass(CustomAnnotation) {
            let myLocation = annotation as! CustomAnnotation
            myLocation.title = self.placemark[0].subLocality
            myLocation.subtitle = self.placemark[0].locality
        
        
            var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier("CustomAnnotation")
        
            if (annotationView == nil) {
                annotationView = myLocation.annotationView()
            }
            
            else {
                annotationView!.annotation = annotation;
            }
        
            annotationView!.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
            return annotationView;
            
        }
    
        else {
            return nil
        }
    }

    
    //function to add the annotation
    func addMapAnnotation() {
        
        let dropPin = CustomAnnotation()
        dropPin.coordinate = coordinates
        map.addAnnotation(dropPin)
        
    }
    
    //function to get the placemarks
    func getPlacemarkFromLocation(location: CLLocation) {
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler:
            {(placemarks, error) in
                if (error != nil) {print("reverse geodcode fail: \(error!.localizedDescription)")}
                self.placemark = placemarks! as [CLPlacemark]
                if self.placemark.count > 0
                {
                    self.addMapAnnotation()
                }
        })
        
    }
    
    //function to handle the callout button click
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if !view.annotation!.isKindOfClass(CustomAnnotation) {
            return
        }
        
        self.performSegueWithIdentifier("detailsView", sender: view)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier == "detailsView") {
            let destination = segue.destinationViewController as! DetailViewController
            destination.importedPlacemark = self.placemark
        }
        
    }

}
