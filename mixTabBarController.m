//
//  mixTabBarController.m
//  Search
//
//  Created by David on 12/14/14.
//  Copyright (c) 2014 PJ Vea. All rights reserved.
//

#import "mixTabBarController.h"

@interface mixTabBarController ()

@end

@implementation mixTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        [self.tabBarItem initWithTitle:nil image:[[UIImage imageNamed:@"musical.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[UIImage imageNamed:@"musical.png"]];
    
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor colorWithRed:80/255.0 green:187/255.0 blue:187/255.0 alpha:1]];
    
    UITableView *view = (UITableView *)self.tabBarController.moreNavigationController.topViewController.view;
    
    
    if ([[view subviews] count])
    {
        NSLog(@"did go in here");
        for (UITableViewCell *cell in [view visibleCells])
        {
            cell.textLabel.textColor = [UIColor colorWithRed:80/255.0 green:187/255.0 blue:187/255.0 alpha:1];
            cell.imageView.tintColor = [UIColor colorWithRed:80/255.0 green:187/255.0 blue:187/255.0 alpha:1];
            NSLog(@"did change table view color") ;
        }
    }

    [self.tabBarController.tabBar setTranslucent:YES];
    self.tabBarController.tabBar.shadowImage = [UIImage new];
    self.tabBarController.view.backgroundColor = [UIColor clearColor];
    [self.tabBarController.tabBar setBackgroundImage:[[UIImage alloc] init]];
    self.tabBarController.tabBar.shadowImage = [[UIImage alloc] init];
    self.tabBarController.tabBar.backgroundColor = [UIColor clearColor];
    
    NSLog(@"hi");
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
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

-(void)awakeFromNib
{
    [super awakeFromNib];
    NSLog(@"awake");
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
}

@end
