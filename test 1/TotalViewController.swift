//
//  TotalViewController.swift
//  test 1
//
//  Created by D7703_08 on 2018. 6. 21..
//  Copyright © 2018년 D7703_08. All rights reserved.
//



import UIKit
//추가
import MapKit

class TotalViewController: UIViewController {

    @IBOutlet weak var total: MKMapView!
    var name: [String] = []
    var address: [String] = []
    var annotaions = [MKPointAnnotation]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewMap(name: name, address: address)
    }
    var count = 0
    func  viewMap(name:[String], address:[String]) {
        for loc in address {
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(loc , completionHandler: {
                (placemarks: [CLPlacemark]?, error: Error?) -> Void in
                if let error = error {
                    print(error)
                    return
                }
                if placemarks != nil {
                    let placemark = placemarks![0]
                    print(placemarks![0])
                    
                    // pin point 을 저장
                    let annotation = MKPointAnnotation()
                    if let location = placemark.location {
                        // Add annotation
                        annotation.title = self.name[self.count]
                        annotation.subtitle = self.address[self.count]
                        self.count = self.count + 1
                        annotation.coordinate = location.coordinate
                        self.annotaions.append(annotation)
                        self.total.addAnnotations(self.annotaions)
                    }
                }
                self.total.showAnnotations(self.annotaions, animated: true)
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
