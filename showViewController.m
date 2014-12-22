//
//  showViewController.m
//  Search
//
//  Created by David on 12/13/14.
//  Copyright (c) 2014 PJ Vea. All rights reserved.
//

#import "showViewController.h"

@interface showViewController ()
@property (weak, nonatomic) IBOutlet UINavigationItem *nameTitle;


@end

@implementation showViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"another view did load");

    
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

- (void) settitle:(NSString *)title content:(NSString *)content
{
    self.nameTitle.title = title;
}


@end
