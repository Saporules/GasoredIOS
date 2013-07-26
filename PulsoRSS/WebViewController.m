//
//  WebViewController.m
//  PulsoRSS
//
//  Created by Abel on 21/09/12.
//  Copyright (c) 2012 Abel. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController
@synthesize web=_web;
@synthesize surl,titulo;

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
    self.web.scrollView.bounces=NO;
    NSString *trimmedString = [surl stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceCharacterSet]];
    NSURL *url = [NSURL URLWithString:trimmedString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self.web loadRequest:req];
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAction) target:self action:@selector(share:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    
    // Do any additional setup after loading the view from its nib.
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)share: (id)sender{
    NSString *textToShare = self.titulo;
    NSURL *url = [[NSURL alloc] initWithString:[surl stringByTrimmingCharactersInSet:
                                                [NSCharacterSet whitespaceCharacterSet]]];
    NSArray *activityItems = @[textToShare, url];
    UIActivityViewController *activityVC =
    [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                      applicationActivities:nil];
    [self presentViewController:activityVC animated:YES completion:nil];
}


@end
