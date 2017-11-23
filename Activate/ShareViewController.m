//
//  ShareViewController.m
//  Activate
//
//  Created by Mahaboobsab Nadaf on 23/11/17.
//  Copyright © 2017 NeoRays. All rights reserved.
//

#import "ShareViewController.h"
#import "ViewController.h"
@import MobileCoreServices;

static NSString *const AppGroupId = @"group.tag.AppGroupDemo";

@interface ShareViewController ()

@end

@implementation ShareViewController

- (BOOL)isContentValid {
    // Do validation of contentText and/or NSExtensionContext attachments here
    return YES;
}

//- (void)didSelectPost {
//    // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
//
//    // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
//    [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
//}
- (void)didSelectPost
{
    
    // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
    // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
    
    
    inputItem = self.extensionContext.inputItems.firstObject;
    
    NSItemProvider *urlItemProvider = [[inputItem.userInfo valueForKey:NSExtensionItemAttachmentsKey] objectAtIndex:0];
    
    if ([urlItemProvider hasItemConformingToTypeIdentifier:(__bridge NSString *)kUTTypeURL])
    {
        [urlItemProvider loadItemForTypeIdentifier:(__bridge NSString *)kUTTypeURL options:nil completionHandler:^(NSURL *url, NSError *error)
         {
             if (error)
             {
                 NSLog(@"Error occured");
             }
             else
             {
                 NSMutableArray *arrSites;
                 if ([sharedUserDefaults valueForKey:@"SharedExtension"])
                     arrSites = [sharedUserDefaults valueForKey:@"SharedExtension"];
                 else
                     arrSites = [[NSMutableArray alloc] init];
                 NSDictionary *dictSite = [NSDictionary dictionaryWithObjectsAndKeys:self.contentText, @"Text", url.absoluteString, @"URL",nil];
                 [arrSites addObject:dictSite];
                 [sharedUserDefaults setObject:arrSites forKey:@"SharedExtension"];
                 [sharedUserDefaults synchronize];
                 
                 UIAlertController * alert=   [UIAlertController
                                               alertControllerWithTitle:@"Success"
                                               message:@"Posted Successfully."
                                               preferredStyle:UIAlertControllerStyleAlert];
                 UIAlertAction* ok = [UIAlertAction
                                      actionWithTitle:@"OK"
                                      style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction * action)
                                      {
                                          [UIView animateWithDuration:0.20 animations:^
                                           {
                                               self.view.transform = CGAffineTransformMakeTranslation(0, self.view.frame.size.height);
                                           }
                                                           completion:^(BOOL finished)
                                           {
                                               [self.extensionContext completeRequestReturningItems:nil completionHandler:nil];
                                           }];
                                      }];
                 
                 [alert addAction:ok];
                // [self presentViewController:alert animated:YES completion:nil];
                 
                 [self presentViewController:alert animated:YES completion:^{
//                     UIStoryboard *enterPasscode = [UIStoryboard storyboardWithName:@"nadaf" bundle:[NSBundle bundleForClass:[self class]]];
//                     ViewController *enterVc = (ViewController *)[enterPasscode instantiateViewControllerWithIdentifier:@"home"];
                     
//                     ViewController *viewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"home"];
//                     UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:viewController];
//                     [self.navigationController pushViewController:navi animated:YES];
                     
                     
                     
                    // [self.navigationController pushViewController:enterVc animated:YES];
                     
                     
                     NSLog(@"%@",arrSites);
                     
                     
                 }];
             }
         }];
    }
}
- (NSArray *)configurationItems {
    // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
    return @[];
}

@end
