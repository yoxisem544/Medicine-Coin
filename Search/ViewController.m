//
//  ViewController.m
//  Search
//
//  Created by PJ Vea on 3/26/14.
//  Copyright (c) 2014 PJ Vea. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *array;
@property (strong, nonatomic) NSArray *searchResults;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"name" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
//    self.array = [[NSArray alloc] initWithObjects:@"Apple", @"Samsung", @"HTC", @"LG", @"Moto", nil];
    self.array = json;
    
    self.searchResults = [[NSArray alloc] init];
    
    UIGestureRecognizer *tap = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tap];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Table View Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.searchResults count];
        
    } else {
        return [self.array count];
    }
//    return [self.array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [self.searchResults objectAtIndex:indexPath.row];
        
    } else {
        cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    }
//    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    return cell;
}

#pragma Search Methods

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", searchText];
//    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"contains[c] %@", searchText];
    self.searchResults = [self.array filteredArrayUsingPredicate:predicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableView *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog([NSString stringWithFormat:@"%@",cell]);
    [self performSegueWithIdentifier:@"showMedicine" sender:self];
}
//- (void)touchesEnded:(NSSet *)touches
//           withEvent:(UIEvent *)event {
//    UITouch *aTouch = [touches anyObject];
//    // below numberofclick in integer type
//    self.numberOfClicks = [aTouch tapCount];
//    [super touchesEnded:touches withEvent:event];
//}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"segue from deals screen");
    //addToCartViewContollerForItem
    if([[segue identifier] isEqualToString:@"showMedicine"]){
//        NSIndexPath *selectedRow = [self.tableView indexPathForSelectedRow];
//        
//        Item *currentItem = [[Item alloc]init];
//        currentItem = [itemList objectAtIndex:[selectedRow row]];
//        
//        RESTAddToCartViewController *vc = [segue destinationViewController];
//        [vc setCurrentItem:currentItem];
    }
}
- (IBAction)backButton:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
