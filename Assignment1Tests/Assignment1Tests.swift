//
//  Assignment1Tests.swift
//  Assignment1Tests
//
//  Created by Suhaib Umar on 4/12/16.
//  Copyright © 2016 Suhaib. All rights reserved.
//

import XCTest
import MapKit
@testable import Assignment1

class Assignment1Tests: XCTestCase {
    
    var tableViewClass:ViewController = ViewController()
    var mapViewClass:MapViewController = MapViewController()
    
    
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.classForCoder))
        
        self.mapViewClass = storyboard.instantiateViewControllerWithIdentifier("mapView") as! MapViewController
        
        self.tableViewClass = storyboard.instantiateViewControllerWithIdentifier("tableView") as! ViewController;
        
        self.tableViewClass.loadView()
        self.mapViewClass.loadView()
        self.mapViewClass.viewDidLoad()
        self.tableViewClass.viewDidLoad()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewLoads() {
        XCTAssertNotNil(self.tableViewClass.view, "Table View not loaded")
        XCTAssertNotNil(self.mapViewClass.view, "Map View not loaded")
    }
    
    func testTableViewConformsToUITableViewDelegate() {
        XCTAssertTrue(ViewController.conformsToProtocol(UITableViewDelegate), "View does not conform to UITableViewDelegate")
    }
    
    func testTableViewConformsToUITableViewDataSource() {
        XCTAssertTrue(ViewController.conformsToProtocol(UITableViewDataSource), "View does not conform to UITableViewDataSource")
    }
    
    func testTableIsLoaded() {
        XCTAssertNotNil(self.tableViewClass.table, "Table not loaded")
    }
    
    func testMapIsLoaded() {
        XCTAssertNotNil(self.mapViewClass.map, "Map not loaded")
    }
    
    func testMapViewConformsToMKMapViewDelegate() {
        XCTAssertTrue(MapViewController.conformsToProtocol(MKMapViewDelegate), "View does not conform to MKMapViewDelegate")
    }
    
    func testTableOrMapViewIsConnectedToDelegate() {
        XCTAssertNotNil(self.tableViewClass.table.delegate, "Table is not connected to delegate");
        XCTAssertNotNil(self.mapViewClass.map.delegate, "Map is not connected to delegate");
    }
    
    func testTableIsNotNill() {
        let tableRowCount = self.tableViewClass.table.numberOfRowsInSection(0)
        XCTAssertNotEqual(tableRowCount, 0, "table is empty")
    }

}
