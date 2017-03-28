//
//  GoogleMapVC.swift
//  Bday_GoogleMapScreen
//
//  Created by Appinventiv on 25/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit
import Foundation
import GoogleMaps
import GooglePlaces
import GooglePlacePicker
import Alamofire
import SwiftyJSON


protocol AddLocationDelegate {
    
    func getLocation(address : String , latitude : Double, longitude : Double)
    
}

class GoogleMapVC: BaseViewController, LocationManagerDelegate, GMSMapViewDelegate {

    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var placeTable: UITableView!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var googleMapView: GMSMapView!
    
    var places: [String]?
    var placeId: [String]?
    
    var placesData = [PlacesModel]()
    
    var didFindMyLocation = false
    
    var locationLatitude: Double = 0.0
    var locationLongitude: Double = 0.0
    
    var locationMarker = GMSMarker()
    var locationMarkerSnippet = "Noida"
    
    var delegate : AddLocationDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let locationImage = UIImageView()
        locationImage.image = #imageLiteral(resourceName: "gray-location-icon-png-7")
        locationImage.frame = CGRect(x: 0, y: 0, width: 45, height: self.searchBar.frame.height)
        locationImage.contentMode = .center
        self.searchBar.leftView = locationImage
        self.searchBar.leftViewMode = .always
        
        self.placeTable.dataSource = self
        self.placeTable.delegate = self
        
        self.placeTable.isHidden = true
        
        self.googleMapView.delegate = self
        
        self.searchBar.text = "Noida"
        
        LocationManager.sharedInstance.delegate = self
        LocationManager.sharedInstance.autoUpdate = true
        
        LocationManager.sharedInstance.showVerboseMessage = false
        
        LocationManager.sharedInstance.startUpdatingLocationWithCompletionHandler { (latitude: Double, longitude:Double, status:String, verboseMessage:String, error:String?) in
            
            LocationManager.sharedInstance.stopUpdatingLocation()
            
            self.locationLatitude = latitude
            self.locationLongitude = longitude
            
            print(self.locationLatitude)
            print(self.locationLongitude)
            self.loadMap()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        
        self.delegate?.getLocation(address: self.searchBar.text!, latitude: self.locationLatitude, longitude: self.locationLongitude)
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func loadMap() {
        
        let camera = GMSCameraPosition.camera(withLatitude: self.locationLatitude, longitude: self.locationLongitude, zoom: 6.0)
        
        self.googleMapView.camera = camera
        self.googleMapView.isMyLocationEnabled = true
        self.googleMapView.settings.myLocationButton = true
         self.googleMapView.settings.compassButton = true
        
        // Creates a marker at your location on map.
        locationMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: self.locationLatitude, longitude: self.locationLongitude))
        locationMarker.map = self.googleMapView
        locationMarker.icon = GMSMarker.markerImage(with: UIColor.blue)
        //locationMarker.icon = UIImage(named: "gray")
        locationMarker.title = "Location:"
        locationMarker.opacity = 1
        locationMarker.snippet = self.locationMarkerSnippet
        
        print("====",self.locationLatitude,self.locationLongitude)
    }
    
    func locationFound(_ latitude:Double, longitude:Double) {
    
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        print("***************************")
        self.locationLatitude = (self.googleMapView.myLocation?.coordinate.latitude)!
        self.locationLongitude = (self.googleMapView.myLocation?.coordinate.longitude)!
        self.locationMarkerSnippet = "Your Location :- Noida"
        self.googleMapView.clear()
        
        self.searchBar.text = "Noida"
        self.loadMap()
        
        return true
    }
    
    @IBAction func searchBarEditingChanged(_ sender: UITextField) {
        
        //self.googleMapView.isHidden = true
        self.placeTable.isHidden = false
        WebServicesData().fetchData(withInput: sender.text!,success: { (placesData: [PlacesModel]) in
            print("+++++++++++++++++++++++++",placesData)
            self.placesData = placesData
            self.placeTable.reloadData()
        }) { (error: Error) in
            print(error)
        }
        
    }
    
}

extension GoogleMapVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesTableViewCellID", for: indexPath) as! PlacesTableViewCell
        
        cell.detailsLabel.text = placesData[indexPath.row].description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        WebServicesData().fetchLangLong(placeId: placesData[indexPath.row].place_id){ (coordinate) -> Void in
        
            self.locationLatitude = coordinate.latitude
            self.locationLongitude = coordinate.longitude
            self.locationMarkerSnippet = self.placesData[indexPath.row].description
            self.googleMapView.clear()
            
            self.placeTable.isHidden = true
            self.searchBar.text = self.placesData[indexPath.row].description
            self.loadMap()
            self.googleMapView.isHidden = false
            
            print(coordinate.latitude,coordinate.longitude)
        }
        
    }
    
}

class PlacesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var detailsLabel:UILabel!
    
}



