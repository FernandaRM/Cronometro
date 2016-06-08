//
//  SecondViewController.m
//  NavigationBar
//
//  Created by MARIA FERNANDA REYES MOJICA on 27/04/16.
//  Copyright © 2016 Propio. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *hour;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *alarmLabel;
@property (weak, nonatomic) IBOutlet UILabel *day;

@end

@implementation SecondViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [figure count];
}
- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellidentifier = @"Alarm";
    UITableViewCell * cell = [alarmClock dequeueReusableCellWithIdentifier: cellidentifier forIndexPath:indexPath];
    cell.textLabel.text = [figure objectAtIndex:indexPath.row];
    return cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Alarma";
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"+"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(addAlarm)];
    self.navigationItem.rightBarButtonItem = flipButton;
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Editar"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(editAlarm)];
    self.navigationItem.leftBarButtonItem = editButton;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addAlarm{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"editAlarm"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];
    [navController topViewController].title = @"Agregar alarma";
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:navController animated:YES completion:NULL];
}

-(void)editAlarm{

}

@end
