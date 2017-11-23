//
//  ViewController.m
//  ShareSheetBlogExample
//
//  Created by Mahaboobsab Nadaf on 23/11/17.
//  Copyright © 2017 NeoRays. All rights reserved.
//

#import "ViewController.h"

static NSString *const AppGroupId = @"group.tag.AppGroupDemo";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    sharedUserDefaults = [[NSUserDefaults alloc] initWithSuiteName:AppGroupId];
    arrSites = [NSMutableArray arrayWithArray:[sharedUserDefaults valueForKey:@"SharedExtension"]];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrSites.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WebCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.lblSite.text = [[arrSites objectAtIndex:indexPath.row] valueForKey:@"URL"];
    cell.lblContent.text = [[arrSites objectAtIndex:indexPath.row] valueForKey:@"Text"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[[arrSites objectAtIndex:indexPath.row] valueForKey:@"URL"]]];
}
@end
