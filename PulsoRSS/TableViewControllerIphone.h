//
//  TableViewControllerIphone.h
//  PulsoRSS
//
//  Created by Abel on 21/09/12.
//  Copyright (c) 2012 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KMXMLParser;
@interface TableViewControllerIphone : UITableViewController
@property (strong, nonatomic) NSMutableArray *parseResults;
@property (strong, nonatomic) NSMutableArray *parseCategory;
@property (strong, nonatomic) KMXMLParser *parser;
@end
