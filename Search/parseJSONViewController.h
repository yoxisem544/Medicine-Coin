//
//  parseJSONViewController.h
//  Search
//
//  Created by David on 12/13/14.
//  Copyright (c) 2014 PJ Vea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface parseJSONViewController : UIViewController

@property (strong, nonatomic) NSDictionary *dinamicData;
@property (strong, nonatomic) NSData *localData;
@property (strong, nonatomic) NSDictionary *json;

- (void)startDownloading;
@end
