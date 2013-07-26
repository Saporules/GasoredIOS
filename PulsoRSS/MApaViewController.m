//
//  MApaViewController.m
//  GasoRed
//
//  Created by Abel on 19/07/13.
//  Copyright (c) 2013 Abel. All rights reserved.
//

#import "MApaViewController.h"
#import "DetailViewController.h"
#define METERS_PER_MILE 14000

@interface MApaViewController ()

@end

@implementation MApaViewController
@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    // 1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 22.1575;
    zoomLocation.longitude= -100.9850;
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    // 3
    [mapView setRegion:viewRegion animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    // Do any additional setup after loading the view from its nib.
    NSURL *url = [NSURL URLWithString:@"http://gasored.herokuapp.com/gas_stations.json"];
    data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data
                                                     options:0
                                                       error:&error];
    if (error != nil)
    {
        //Manejo de Errores
        NSLog(@"No jala");
    }
    
    
    
    CLLocationCoordinate2D location;
    NSMutableArray *newAnnotations = [NSMutableArray array];
    MKPointAnnotation *newAnnotation;
    
    
    
    for (NSDictionary *dictionary in array)
    {
        
        //obtenemos las coordenadas para la anotacion
        location.latitude = [dictionary[@"latitud"] doubleValue];
        location.longitude = [dictionary[@"longitud"] doubleValue];
        
        // creamos la anotacion
        
        newAnnotation = [[MKPointAnnotation alloc] init];
        newAnnotation.title = dictionary[@"nombre"];
        newAnnotation.subtitle = dictionary[@"direccion"];
        newAnnotation.coordinate = location;
        
        [newAnnotations addObject:newAnnotation];
        
        
        
    }
    
    //Añadimos las anotaciones al mapa :3
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    [mapView setShowsUserLocation:YES];
    [self.mapView addAnnotations:newAnnotations];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    // Here push your view controller
    NSLog(@"LOL");
    DetailViewController *detalle=[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    detalle.title=@"Detalles";
    detalle.alat=[NSString stringWithFormat:@"%f",view.annotation.coordinate.latitude];
    detalle.alon=[NSString stringWithFormat:@"%f",view.annotation.coordinate.longitude];
    detalle.lat=lat;
    detalle.lon=lon;
    detalle.nombreS=[NSString stringWithString:view.annotation.title];
    detalle.dirS=[NSString stringWithString:view.annotation.subtitle];
    
    
    NSLog(detalle.lat);
    NSLog(detalle.lon);
    NSLog(detalle.nombreS);
    NSLog(detalle.dirS);
    [self.navigationController pushViewController:detalle animated:YES];
    
    

}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{

    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        lon = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        lat = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
}


@end
