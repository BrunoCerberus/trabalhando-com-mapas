//
//  ViewController.swift
//  Trabalhando com mapas
//
//  Created by Bruno Lopes de Mello on 02/11/2017.
//  Copyright © 2017 Bruno Lopes de Mello. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocal = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gerenciadorLocal.delegate = self
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocal.requestWhenInUseAuthorization()
        gerenciadorLocal.startUpdatingLocation()
        
        // Do any additional setup after loading the view, typically from a nib.
//        let latitude : CLLocationDegrees = -20.314847
//        let longitude : CLLocationDegrees = -40.322062
//        let deltaLatitude : CLLocationDegrees = 0.005
//        let deltaLongitude : CLLocationDegrees = 0.005
//
//        let deltaLocalizacao : MKCoordinateSpan = MKCoordinateSpanMake(deltaLatitude, deltaLongitude)
//        let localizacao : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
//
//        let regiao : MKCoordinateRegion = MKCoordinateRegionMake(localizacao, deltaLocalizacao)
//
//        mapa.setRegion(regiao, animated: true)
//
//        //Adicionar uma marcacao ou anotacao no mapa
//        let anotacao = MKPointAnnotation()
//
//        anotacao.coordinate = localizacao
//        anotacao.title = "Meu pag!"
//        anotacao.subtitle = "Melhor empresa do mundo!"
//
//        mapa.addAnnotation(anotacao)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        let localizacaoUsuario : CLLocation = locations.last!
        
        let latitude : CLLocationDegrees = localizacaoUsuario.coordinate.latitude
        let longitude : CLLocationDegrees = localizacaoUsuario.coordinate.longitude
        let deltaLatitude : CLLocationDegrees = 0.003
        let deltaLongitude : CLLocationDegrees = 0.003
        
        let deltaLocalizacao : MKCoordinateSpan = MKCoordinateSpanMake(deltaLatitude, deltaLongitude)
        let localizacao : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let regiao : MKCoordinateRegion = MKCoordinateRegionMake(localizacao, deltaLocalizacao)
        
        mapa.setRegion(regiao, animated: true)
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

