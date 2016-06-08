//
//  FirstViewController.m
//  NavigationBar
//
//  Created by MARIA FERNANDA REYES MOJICA on 27/04/16.
//  Copyright © 2016 Propio. All rights reserved.
//

#import "FirstViewController.h"
#import "Utility.h"

@interface FirstViewController (){
    
    __weak IBOutlet UIButton *resButton;
    NSDate * timerDate;
    NSTimeInterval  timeInterval;
    NSTimeInterval  timeIntervalHelper;
    BOOL isVuelta;
    int numberOfVuelta;
}
@property (strong, nonatomic)  NSDate * startDate;
@property (strong, nonatomic)  NSDate * startDatevuel;

@end

@implementation FirstViewController

- (IBAction)star:(id)sender {
    UIButton *actionButton = (UIButton *)sender;
    
    [actionButton setTitle:@"Detener" forState:UIControlStateNormal];
    [actionButton setTitleColor:[UIColor redColor]forState:UIControlStateNormal];
    
    if (!Timer) {
        
        self.startDate = [NSDate date];
        Timer = [NSTimer scheduledTimerWithTimeInterval:1.0 / 10.0 target:self selector:@selector(countup) userInfo:nil repeats:YES];
        [self countup];
        [resButton setTitle:@"Vuelta" forState:UIControlStateNormal];
    }else if ([Timer isValid]){
        [Timer invalidate];
        [actionButton setTitle:@"Iniciar" forState:UIControlStateNormal];
  
        [actionButton setTitleColor:[Utility getPurpleColor]
                           forState:UIControlStateNormal];
        
        [resButton setTitle:@"Reiniciar" forState:UIControlStateNormal];
        Timer = nil;
        
        
        
    }

    
    
}

-(void) countup {
    ComTime.text = [Utility getDate:timeIntervalHelper starDate:self.startDate];
    if (!isVuelta) {
        vuelLabel.text = [Utility getDate:timeIntervalHelper starDate:self.startDate];
    }else{
        vuelLabel.text = [Utility getDate:0 starDate:self.startDatevuel];
    }
    
}




- (IBAction)restar:(id)sender;{
    if (!Timer) {//reset
        [resButton setTitle:@"Vuelta" forState:UIControlStateNormal];
        isVuelta= NO;
        numberOfVuelta =1;
        self.startDate = [NSDate date];
        timeIntervalHelper = 0;
        [self countup];
        [datos removeAllObjects];
        [subDatos removeAllObjects];
        [tableView reloadData];
    }
    else {//vuelta
        isVuelta= YES;
        
        self.startDatevuel=[NSDate date];
        NSString * impVuelta = vuelLabel.text;
        
        [subDatos addObject: [NSString stringWithFormat:@"Vuelta %d", numberOfVuelta++ ]];
        [datos addObject:impVuelta];
        [tableView reloadData];
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [datos count];
}
- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellidentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: cellidentifier forIndexPath:indexPath];
    cell.textLabel.text = [subDatos objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[datos objectAtIndex:indexPath.row];
    return cell;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Cronòmetro";
    isVuelta= NO;
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *actionButton = (UIButton *)[self.view viewWithTag:1];
    [actionButton setTitle:[NSString stringWithFormat:@"%@%@",@"Ini",@"ciar"] forState:UIControlStateNormal];
    //[actionButton setTintColor:[UIColor greenColor]];
    actionButton.layer.cornerRadius = actionButton.frame.size.width/2;
    [resButton setTitle:@"Vuelta" forState:UIControlStateNormal];
    [resButton setTintColor:[UIColor blackColor]];
    resButton.layer.cornerRadius = resButton.frame.size.width/2;
    datos = [[NSMutableArray alloc]init];
    subDatos = [[NSMutableArray alloc] init];
    numberOfVuelta = 1;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
