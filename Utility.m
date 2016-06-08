//
//  Utility.m
//  NavigationBar
//
//  Created by MARIA FERNANDA REYES MOJICA on 02/05/16.
//  Copyright © 2016 Propio. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Utility.h"

@implementation Utility
+(UIColor *)getPurpleColor{
    return [UIColor colorWithRed:  141/255.f
                           green: 10/255.f
                            blue:108/255.f
                           alpha:1.0];
    
    
}
+(NSString * )getDate: (NSTimeInterval )timeIntervalH starDate:(NSDate *)sDate{
    NSDate * currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:sDate]+timeIntervalH;
    NSDate * timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"mm:ss.SSS"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    NSString *timeString=[dateFormatter stringFromDate:timerDate];
    return timeString;
}


@end
