//
//  WebViewController.h
//  PulsoRSS
//
//  Created by Abel on 21/09/12.
//  Copyright (c) 2012 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property  (nonatomic, strong) IBOutlet UIWebView *web;
@property (nonatomic,retain) NSString *surl;
@property (nonatomic,retain) NSString *titulo;


@end
