//
//  DetailViewController.h
//  GasoRed
//
//  Created by Abel on 19/07/13.
//  Copyright (c) 2013 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController{
    NSData *data;
    NSString *alat;
    NSString *alon;
    NSString *lat;
    NSString *lon;
}

-(IBAction)ruta:(id)sender;


@property (strong,nonatomic) NSString *alat;
@property (strong,nonatomic) NSString *alon;
@property (strong,nonatomic) NSString *lat;
@property (strong,nonatomic) NSString *lon;
@property (strong,nonatomic) NSString *nombreS;
@property (strong,nonatomic) NSString *dirS;
@property (strong,nonatomic) NSData *data;
@property (strong, nonatomic) IBOutlet UILabel *nombre;
@property (strong, nonatomic) IBOutlet UILabel *dir;
@property (strong, nonatomic) IBOutlet UILabel *tel;

@end
