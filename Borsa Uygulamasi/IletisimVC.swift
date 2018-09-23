//
//  IletisimVC.swift
//  Deneme
//
//  Created by Can KINCAL on 23/08/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import UIKit
import MapKit
class IletisimVC: UIViewController {
    @IBOutlet weak var iletisimBilgileriTextField: UITextView!

    @IBOutlet weak var iletisimBilgileriMapKitView: MKMapView!
    let regionRadius: CLLocationDistance = 1000
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // initial location
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        
        centerMapOnLocation(location: initialLocation)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        iletisimBilgileriMapKitView.setRegion(coordinateRegion, animated: true)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
