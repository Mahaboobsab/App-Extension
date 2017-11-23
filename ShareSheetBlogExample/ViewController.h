//
//  ViewController.h
//  ShareSheetBlogExample
//
//  Created by Mahaboobsab Nadaf on 23/11/17.
//  Copyright © 2017 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebCell.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrSites;
    NSUserDefaults *sharedUserDefaults;
}


@end

