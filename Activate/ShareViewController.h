//
//  ShareViewController.h
//  Activate
//
//  Created by Mahaboobsab Nadaf on 23/11/17.
//  Copyright © 2017 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>

@interface ShareViewController : SLComposeServiceViewController
{
    NSUserDefaults *sharedUserDefaults;
    NSExtensionItem *inputItem;
}
@end
