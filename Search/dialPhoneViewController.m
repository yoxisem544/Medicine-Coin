//
//  dialPhoneViewController.m
//  Search
//
//  Created by David on 12/14/14.
//  Copyright (c) 2014 PJ Vea. All rights reserved.
//

#import "dialPhoneViewController.h"

@interface dialPhoneViewController ()

@property (weak, nonatomic) IBOutlet UIButton *callButton;
@end

@implementation dialPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.callButton.layer.borderWidth = 5;
    self.callButton.layer.cornerRadius = 9;
    self.callButton.layer.borderColor = [UIColor colorWithRed:80/255.0 green:187/255.0 blue:187/255.0 alpha:1].CGColor;    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)callTapped:(id)sender {
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:130-032-2837"]]];
    } else {
        UIAlertView *notPermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Your device doesn't support this feature." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [notPermitted show];
//        [notPermitted release];
    }
}

@end
