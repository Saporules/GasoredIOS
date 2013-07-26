//
//  MApaViewController.h
//  GasoRed
//
//  Created by Abel on 19/07/13.
//  Copyright (c) 2013 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MApaViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>{
    MKMapView *mapView;
    NSData *data;
    MKPolyline *  routeLine;
    CLLocationManager *locationManager;
    NSString *lat;
    NSString *lon;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
