//
//  TableViewControllerIphone.m
//  PulsoRSS
//
//  Created by Abel on 21/09/12.
//  Copyright (c) 2012 Abel. All rights reserved.
//

#import "TableViewControllerIphone.h"
#import "KMXMLParser.h"
#import "WebViewController.h"

@interface TableViewControllerIphone ()

@end

@implementation TableViewControllerIphone
@synthesize parseResults = _parseResults,parseCategory,parser;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title=self.navigationController.title;
    }
    
    
    
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSLog(@"entra");
    
    self.parseCategory=[[NSMutableArray alloc] init];
    _parseResults = [parser posts];
    if([self.navigationController.title isEqualToString:@"Gasotips"]){
        for (int i=0; i<[self.parseResults count]; i++) {
            NSString *trimmedString = [[self.parseResults objectAtIndex:i] objectForKey:@"category"];
            [trimmedString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            NSLog(@"Gasotips");
            if([trimmedString hasPrefix:@"Gasotips"]){
                [parseCategory addObject:[self.parseResults objectAtIndex:i]];
            }
        }
    }
    else if([self.navigationController.title isEqualToString:@"Beneficios"]){
        for (int i=0; i<[self.parseResults count]; i++) {
            NSString *trimmedString = [[self.parseResults objectAtIndex:i] objectForKey:@"category"];
            [trimmedString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            NSLog(@"Beneficios");
            if([trimmedString hasPrefix:@"Beneficios"]){
                [parseCategory addObject:[self.parseResults objectAtIndex:i]];
            }
        }
        
    }
    _parseResults=parseCategory;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.parseResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    
    // Configure the cell...
    cell.textLabel.numberOfLines=1;
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:17.5];
    
    cell.textLabel.text = [[self.parseResults objectAtIndex:indexPath.row] objectForKey:@"title"];
    //cell.textLabel.text = [[self.parseResults objectAtIndex:indexPath.row] objectForKey:@"content"];
    
    cell.detailTextLabel.text = [[[self.parseResults objectAtIndex:indexPath.row]objectForKey:@"date"] substringToIndex:25];
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WebViewController *vc = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
    vc.title=[[self.parseResults objectAtIndex:indexPath.row]  objectForKey:@"title"];
    vc.surl=[[self.parseResults objectAtIndex:indexPath.row]  objectForKey:@"link"];
    vc.titulo=[[self.parseResults objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}





@end
