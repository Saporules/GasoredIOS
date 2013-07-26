//
//  DetailViewController.m
//  GasoRed
//
//  Created by Abel on 19/07/13.
//  Copyright (c) 2013 Abel. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize alat,alon,lat,lon,data;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    
    NSString *telS;
    NSString *proof;
    
    for (NSDictionary *dictionary in array)
    {
        proof = dictionary[@"nombre"];
        NSLog(proof);
        
        if ([_nombreS isEqualToString:proof]) {
            NSLog(@"es igual :D!!");
            
            telS = dictionary[@"telefono"];
        }
        
        
        
    }
    
    
    
    _nombre.text=_nombreS;
    _dir.text=_dirS;
    _tel.text= [NSString stringWithFormat:@"Telefono: %@",telS];
    if( telS==nil || telS== @"" ){
        _tel.text=nil;
    }
    
    NSMutableArray *features = [[NSMutableArray alloc] initWithCapacity:100];
    //NSString *feat = [NSString stringWithString:(NSString *)];
    UILabel *featLabel;
    int cordX=50;
    int cordY=220;
    int i=0;
    
    for (i=0; i<=20; i++) {
        for (int i2=0; i2<=1; i2++) {
        
            featLabel = [[UILabel alloc]initWithFrame:CGRectMake(cordX, cordY, 200, 44)];
            featLabel.backgroundColor = [UIColor clearColor];
            featLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:14];
            featLabel.text = [NSString stringWithFormat:@"feature%d!",i];
            cordX+=160;
            
            [features addObject:featLabel];
            [_scrolling addSubview:[features objectAtIndex:i]];
            i++;
            
    }
        i--;
        cordX=50;
        cordY+=20;
    
    }
    
    
    /*UILabel *etiqueta = [[UILabel alloc]initWithFrame:CGRectMake(50, 220, 200, 44)];
    etiqueta.backgroundColor = [UIColor clearColor];
    etiqueta.font = [UIFont fontWithName:@"Helvetica-Light" size:14];
    etiqueta.text = @"HOLA1!";
    
    UILabel *etiqueta2 = [[UILabel alloc]initWithFrame:CGRectMake(210, 220, 200, 44)];
    etiqueta2.backgroundColor = [UIColor clearColor];
    etiqueta2.font = [UIFont fontWithName:@"Helvetica-Light" size:14];
    etiqueta2.text = @"HOLA2!";
    
    [self.view addSubview:etiqueta];
    [self.view addSubview:etiqueta2];*/
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)ruta:(id)sender{
    NSString *url;
    
    if([[[UIDevice currentDevice] systemVersion] compare:@"6.0" options:NSNumericSearch] == NSOrderedAscending)
    {
        url = [NSString stringWithFormat:@"http://maps.google.com/maps?daddr=%@,%@&saddr=%@,%@",alat,alon,lat,lon];
        NSLog(url);
        
    }
    else
    {
        
        url = [NSString stringWithFormat:@"http://maps.apple.com/maps?daddr=%@,%@&saddr=%@,%@",alat,alon,lat,lon];
                NSLog(url);
    }
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }

}

@end
