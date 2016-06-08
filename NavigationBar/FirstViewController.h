//
//  FirstViewController.h
//  NavigationBar
//
//  Created by MARIA FERNANDA REYES MOJICA on 27/04/16.
//  Copyright © 2016 Propio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController{
IBOutlet UILabel * vuelLabel;
IBOutlet UILabel * ComTime;
NSTimer * Timer;
IBOutlet UITableView * tableView;
NSMutableArray * datos;
NSMutableArray * subDatos;

}

- (IBAction)star:(id)sender;
-(void) countup;
- (IBAction)restar:(id)sender;



@end

