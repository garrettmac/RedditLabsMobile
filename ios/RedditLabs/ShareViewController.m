//
//  ShareViewController.m
//  MyShareTarget
//
//  Created by vyga on 8/12/17.
//  Copyright © 2017 Politicc. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (BOOL)isContentValid {
  // Do validation of contentText and/or NSExtensionContext attachments here
  return YES;
}

- (void)didSelectPost {
  
  for (NSItemProvider* itemProvider in ((NSExtensionItem*)self.extensionContext.inputItems[0]).attachments ) {
    
    if([itemProvider hasItemConformingToTypeIdentifier:@"public.jpeg"]) {
      NSLog(@"itemprovider = %@", itemProvider);
      
      [itemProvider loadItemForTypeIdentifier:@"public.jpeg" options:nil completionHandler: ^(id<NSSecureCoding> item, NSError *error) {
        
        NSData *imgData;
        if([(NSObject*)item isKindOfClass:[NSURL class]]) {
          imgData = [NSData dataWithContentsOfURL:(NSURL*)item];
        }
        if([(NSObject*)item isKindOfClass:[UIImage class]]) {
          imgData = UIImagePNGRepresentation((UIImage*)item);
        }
        
        NSDictionary *dict = @{
                               @"imgData" : imgData,
                               @"name" : self.contentText
                               };
        NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.redditlabs.redditlabs"];
        [defaults setObject:dict forKey:@"img"];
        [defaults synchronize];
      }];
    }
  }
  
}


- (NSArray *)configurationItems {
  // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
  return @[];
}

@end
