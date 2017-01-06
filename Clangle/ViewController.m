//
//  ViewController.m
//  Clangle
//
//  Created by Thomas Manu on 1/5/17.
//  Copyright © 2017 Thomas Manu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *angleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Grab system date once view is loaded.
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"hh:mm a"];
    NSString *dateString = [dateFormat stringFromDate:today];
    [self.dateLabel setText:dateString];
    
    // Find and display shortest angle between hour and minute hand.
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:today];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    if (hour >= 12) {hour -= 12;}
    NSInteger angleBetweenHourMinute = ABS((hour * 30) - (minute * 6));
    [self.angleLabel setText:[NSString stringWithFormat:@"%ldº", (long)angleBetweenHourMinute]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
