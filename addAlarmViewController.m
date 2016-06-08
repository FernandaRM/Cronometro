//
//  addAlarmViewController.m
//  NavigationBar
//
//  Created by MARIA FERNANDA REYES MOJICA on 17/05/16.
//  Copyright © 2016 Propio. All rights reserved.
//

#import "addAlarmViewController.h"

@interface addAlarmViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *pikerDate;

@end

@implementation addAlarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Guardar"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(saveAlarm)];
    self.navigationItem.rightBarButtonItem = saveButton;
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Cancelar"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(cancelAlarm)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getDate:(id)sender {
    NSDate *myDate = _pikerDate.date;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"cccc, MMM d, hh:mm aa"];
    NSString *prettyVersion = [dateFormat stringFromDate:myDate];
    NSLog(@"sender %@",prettyVersion);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)saveAlarm{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)cancelAlarm{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
