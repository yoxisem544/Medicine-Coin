//
//  notifyViewController.m
//  Search
//
//  Created by David on 12/13/14.
//  Copyright (c) 2014 PJ Vea. All rights reserved.
//

#import "notifyViewController.h"

@interface notifyViewController ()
@property (weak, nonatomic) IBOutlet UITextField *whatToNotify;
@property (weak, nonatomic) IBOutlet UIDatePicker *timeSet;
@property (weak, nonatomic) IBOutlet UIButton *notifyMEButton;


@property (nonatomic) int go;
@end

@implementation notifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view endEditing:YES];
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    swipe.numberOfTouchesRequired = 1;
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipe];
    self.notifyMEButton.layer.cornerRadius = 5;
    self.notifyMEButton.layer.borderWidth = 2;
    UIColor *yoyoyo = [UIColor colorWithRed:80/255.0 green:187/255.0 blue:187/255.0 alpha:1];
    self.notifyMEButton.layer.borderColor = yoyoyo.CGColor;
    self.notifyMEButton.tintColor = [UIColor colorWithRed:80/255.0 green:187/255.0 blue:187/255.0 alpha:1];
    CGSize ya;
    ya.height = 10;
    ya.width = 10;
    self.notifyMEButton.layer.shadowOpacity = 0.1;
    self.notifyMEButton.layer.shadowColor = [UIColor blackColor].CGColor;
    self.notifyMEButton.layer.shadowOffset = CGSizeMake(1, 1);
}

-(void)swipeGesture:(UISwipeGestureRecognizer *)swipereco
{
    NSLog(@"hey down");
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)notifyMeButton:(id)sender {
    UIApplication *application = [UIApplication sharedApplication];
    
    NSLog(@"testing notif");
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    NSString *datenow;
    NSDateFormatter *ff = [[NSDateFormatter alloc] init];
    [ff setDateFormat:@"yyyy-MM-dd HH:mm"];
    datenow = [ff stringFromDate:self.timeSet.date];
    
    //get time from date picker
    NSString *output = [NSString stringWithFormat:@"%@ %@", datenow, self.whatToNotify.text];
    
    if (notification)NSLog(@"yes notif") ;
    [notification setAlertBody: output]; //內容
    [notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:2]]; //時間
    [notification setTimeZone:[NSTimeZone  defaultTimeZone]];  //時區
    notification.soundName = @"default";
    
    notification.applicationIconBadgeNumber = 1;
    
    [application setScheduledLocalNotifications:[NSArray arrayWithObject:notification]];
    //排程
    

    
}
- (IBAction)againButton:(id)sender {
    UIApplication *application = [UIApplication sharedApplication];
        application.applicationIconBadgeNumber = 1;
    
    NSLog(@"testing notif, num = %@", application.applicationIconBadgeNumber );
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    if (notification)NSLog(@"yes notif") ;
    [notification setAlertBody:@"again world"]; //內容
    [notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:5]]; //時間
    [notification setTimeZone:[NSTimeZone  defaultTimeZone]];  //時區
    notification.soundName = @"default";


    [application setScheduledLocalNotifications:[NSArray arrayWithObject:notification]]; //排程
    

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
