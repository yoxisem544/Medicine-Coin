//
//  parseJSONViewController.m
//  Search
//
//  Created by David on 12/13/14.
//  Copyright (c) 2014 PJ Vea. All rights reserved.
//

#import "parseJSONViewController.h"

@interface parseJSONViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testingLabel;
@property (weak, nonatomic) IBOutlet UITextView *testTextField;
@property (weak, nonatomic) IBOutlet UILabel *abc;
@property (weak, nonatomic) IBOutlet UILabel *cnName;
@property (weak, nonatomic) IBOutlet UITabBarItem *updateMenu;
@property (weak, nonatomic) IBOutlet UIButton *fetchdata;
@property (weak, nonatomic) IBOutlet UITextView *menuContent;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *updateindicator;

//local file here
//@property (strong, nonatomic) NSDictionary *dinamicData;
//@property (strong, nonatomic) NSData *localData;
@end

@implementation parseJSONViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"pretty" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    self.json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSArray *jsonKey = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSDictionary *dataFetchFromJSON;
    
    
    
    

    if (self.json)
    {
        NSLog(@"test success");
        
//        for (id key in self.json)
//            NSLog(@"wow= %@", key);
//        NSLog(@"%@", [self.json objectForKey:@"020021"]);
        dataFetchFromJSON = [self.json objectForKey:@"020021"];
//        for (id key in dataFetchFromJSON)
//            NSLog(@"key %@ value %@", key, [dataFetchFromJSON objectForKey:key]);
        self.testingLabel.text = [dataFetchFromJSON objectForKey:@"英文品名"];
        self.cnName.text = [dataFetchFromJSON objectForKey:@"中文品名"];
        self.testTextField.text = [dataFetchFromJSON objectForKey:self.abc.text];
    }
    else
        NSLog(@"fail");
    self.updateindicator.hidden = YES;
    
    //set transparent
//    [self.tabBarController.tabBar setTranslucent:YES];
//    self.tabBarController.tabBar.shadowImage = [UIImage new];
//    self.tabBarController.view.backgroundColor = [UIColor clearColor];
//    [self.tabBarController.tabBar setBackgroundImage:[[UIImage alloc] init]];
//    self.tabBarController.tabBar.shadowImage = [[UIImage alloc] init];
//    self.tabBarController.tabBar.backgroundColor = [UIColor clearColor];
    
    
    //set button
    self.fetchdata.layer.cornerRadius = 5;
    self.fetchdata.layer.borderWidth = 2;
    self.fetchdata.layer.borderColor = [UIColor colorWithRed:80/255.0 green:187/255.0 blue:187/255.0 alpha:1].CGColor;
    
}

- (NSString *)getMedicineMenu
{
    NSString * getback = [NSString stringWithFormat:@""];
    int counter = 0;
    NSString *date = [NSString stringWithFormat:@""];
    NSString *med = [NSString stringWithFormat:@""];
    
    for (id key in self.dinamicData)
    {
        for (id key2 in [self.dinamicData objectForKey:key])
        {
//
            if([key2 isEqualToString:@"date"])
            {
                NSLog(@"parseing: key %@, value %@", key2, [[self.dinamicData objectForKey:key] objectForKey:key2]);
                NSLog(@"date test %@", [[self.dinamicData objectForKey:key] objectForKey:@"date"]);
                date = [date stringByAppendingString:[NSString stringWithFormat:@"%@", [[self.dinamicData objectForKey:key] objectForKey:@"date"]]];
            }
            if ([key2  isEqual: @"medicines"])
            {
                NSLog(@"medicines %@", [[self.dinamicData objectForKey:key] objectForKey:key2]);
                NSArray *tmp = [[NSArray alloc] initWithArray:[[self.dinamicData objectForKey:key] objectForKey:key2]];
                for (id key in tmp){
                    NSLog(@"array key %@, name %@", key, [[self.json objectForKey:[NSString stringWithFormat:@"%@", key]] objectForKey:@"中文品名"]);
                    NSString *yoyoyo = [NSString stringWithFormat:@"%@\n", [[self.json objectForKey:[NSString stringWithFormat:@"%@", key]] objectForKey:@"中文品名"]];
                    NSLog(@"YO! %@", yoyoyo);
                    if (!yoyoyo)
                        NSLog(@"fuck nothing inside");
                    med = [med stringByAppendingString:yoyoyo];
                    counter += 1;
                }
            }
        }
        getback = [getback stringByAppendingString:date];
        getback = [getback stringByAppendingString:@"\n"];
        getback = [getback stringByAppendingString:med];
        getback = [getback stringByAppendingString:@"\n"];
        date = @"";
        med = @"";
    }
    NSLog(getback);
    [self setbadge:counter];
    
    return getback;
}

- (IBAction)update:(id)sender {
    [self show3Second];
    [self setbadge4second];
    
    //start download
    [self startDownloading];
    
    [self performSelector:@selector(startParse) withObject:nil afterDelay:3.0];
    [self performSelector:@selector(startLOG) withObject:nil afterDelay:4.0];
}

-(void)startLOG
{
    if (self.dinamicData)
    {
        for (id key in self.dinamicData)
            NSLog(@"startlog: key %@, value %@", key, [self.dinamicData objectForKey:key]);
    }
    
    self.menuContent.text = [self getMedicineMenu];
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

-(void)actIndicatorBegin
{
    self.updateindicator.hidden = NO;
    [self.updateindicator startAnimating];
}

-(void)actIndicatorEnd
{
    self.updateindicator.hidden = YES;
    [self.updateindicator stopAnimating];
}
-(void)show3Second
{
    [self actIndicatorBegin];
    [self performSelector:@selector(actIndicatorEnd) withObject:nil afterDelay:3.0];
}
-(void)setbadge4second
{
    [self performSelector:@selector(setbadge) withObject:nil afterDelay:4.0];
}
-(void)setbadge
{
        self.updateMenu.badgeValue = @"3";
}
-(void)setbadge:(int)count
{
    self.updateMenu.badgeValue = [NSString stringWithFormat:@"%d", count];
}

- (void)startDownloading
{
    NSLog(@"stratdownload");
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://medicinelookup.firebaseio.com/users/1/prescriptions.json"]];
    
        // another configuration option is backgroundSessionConfiguration (multitasking API required though)
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        
        // create the session without specifying a queue to run completion handler on (thus, not main queue)
        // we also don't specify a delegate (since completion handler is all we need)
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
        
        NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request
                                                        completionHandler:^(NSURL *localfile, NSURLResponse *response, NSError *error) {
                                                            // this handler is not executing on the main queue, so we can't do UI directly here
                                                            if (!error) {
                                                                NSLog(@"no error");
                                                                if ([request.URL isEqual:[NSURL URLWithString:@"https://medicinelookup.firebaseio.com/users/1/prescriptions.json"]]) {
                                                                    // UIImage is an exception to the "can't do UI here"
//                                                                    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:localfile]];
//                                                                    self.localData = [NSData dataWithContentsOfURL:localfile];
                                                                    // but calling "self.image =" is definitely not an exception to that!
                                                                    // so we must dispatch this back to the main queue
                                                                    dispatch_async(dispatch_get_main_queue(), ^{ self.localData = [NSData dataWithContentsOfURL:localfile]; });
                                                                }
                                                            }
                                                        }];
        [task resume]; // don't forget that all NSURLSession tasks start out suspended!
    
}

-(void)startParse
{
    self.dinamicData = [NSJSONSerialization JSONObjectWithData:self.localData options:kNilOptions error:nil];
}

@end
