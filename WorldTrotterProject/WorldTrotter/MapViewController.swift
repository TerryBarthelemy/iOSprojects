//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Barthelemy, Terry on 2/19/21.
//
import MapKit
import UIKit
class MapViewController:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        print("MapViewController loaded its view.")
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }

  
    
    var mapView: MKMapView!

        override func loadView() {
            // Create a map view
            mapView = MKMapView()

            // Set it as *the* view of this view controller
            view = mapView
            
            let standardString = NSLocalizedString("Standard", comment: "Standard map view")
                let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
                let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")

                let segmentedControl = UISegmentedControl(items: [standardString, hybridString, satelliteString])
            

            segmentedControl.backgroundColor = UIColor.systemBackground
            segmentedControl.selectedSegmentIndex = 0
            
            segmentedControl.addTarget(self,action: #selector(mapTypeChanged(_:)),for: .valueChanged)

         

            segmentedControl.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(segmentedControl)

            let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor,constant: 50)
            let margins = view.layoutMarginsGuide
            let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
            let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)

           
            topConstraint.isActive = true
            leadingConstraint.isActive = true
            trailingConstraint.isActive = true

            
            
            segmentedControl.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(segmentedControl)

          
         
        }
  

}
