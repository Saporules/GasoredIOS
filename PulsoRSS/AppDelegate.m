//
//  AppDelegate.m
//  PulsoRSS
//
//  Created by Abel on 21/09/12.
//  Copyright (c) 2012 Abel. All rights reserved.
//

#import "AppDelegate.h"
#import "KMXMLParser.h"

#import "TableViewControllerIphone.h"
#import "MApaViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    TableViewControllerIphone *viewControllerBene, *viewControllerTips;
    MApaViewController *mapView;
    UINavigationController *navViewControllerMapa,*navviewControllerBene,*navviewControllerTips;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        mapView=[[MApaViewController alloc] initWithNibName:@"MApaViewController" bundle:nil];
        viewControllerBene = [[TableViewControllerIphone alloc] initWithNibName:@"TableViewControllerIphone" bundle:nil];
        viewControllerTips = [[TableViewControllerIphone alloc] initWithNibName:@"TableViewControllerIphone" bundle:nil];
        
        
    } else {
        mapView=[[MApaViewController alloc] initWithNibName:@"MApaViewController" bundle:nil];
        viewControllerBene = [[TableViewControllerIphone alloc] initWithNibName:@"TableViewControllerIphone" bundle:nil];
        viewControllerTips = [[TableViewControllerIphone alloc] initWithNibName:@"TableViewControllerIphone" bundle:nil];
        
    }
    
    navViewControllerMapa=[[UINavigationController alloc] initWithRootViewController:mapView];
    navviewControllerBene = [[UINavigationController alloc] initWithRootViewController:viewControllerBene];
    navviewControllerTips = [[UINavigationController alloc] initWithRootViewController:viewControllerTips];
    
    
    navViewControllerMapa.title=@"Mapa";
    navviewControllerTips.title=@"Gasotips";
    navviewControllerBene.title=@"Beneficios";
    
    
    KMXMLParser *parser = [[KMXMLParser alloc]  initWithURL:@"http://www.gasored.net/feed" delegate:nil];
    
    viewControllerTips.parser=parser;
    viewControllerBene.parser=parser;
    
    mapView.title=@"Ubicaciones";
    viewControllerTips.title=@"Gasotips";
    viewControllerBene.title=@"Beneficios";
    
    mapView.tabBarItem.image = [UIImage imageNamed:@"mapa_32"];
    viewControllerBene.tabBarItem.image = [UIImage imageNamed:@"beneficios_32"];
    viewControllerTips.tabBarItem.image = [UIImage imageNamed:@"gasotips_32"];
    
    [navViewControllerMapa.navigationBar setTintColor:[UIColor blackColor]];
    [navviewControllerTips.navigationBar setTintColor:[UIColor blackColor]];
    [navviewControllerBene.navigationBar setTintColor:[UIColor blackColor]];
    
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[navViewControllerMapa,navviewControllerBene, navviewControllerTips];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/




@end
