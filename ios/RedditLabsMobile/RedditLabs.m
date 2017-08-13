//
//  RedditLabs.m
//  RedditLabsMobile
//
//  Created by vyga on 8/12/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

//#import "RedditLabs.h"
//
//@implementation RedditLabs
//
//@end
#import "RedditLabs.h"
#import <Social/Social.h>
#import "ShareView.h"

@implementation RedditLabs




- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()
RCT_EXPORT_METHOD(log:(NSString *)text image:(UIImage *)image)
{
  RCTLogInfo(@"Pretending to create text %@ and image %@", text, image);
}




RCT_EXPORT_METHOD(promise:(NSDictionary *)options
                  failureCallback:(RCTResponseErrorBlock)failureCallback
                  successCallback:(RCTResponseSenderBlock)successCallback)
{
//   ShareView *shareCtl = [[ShareView alloc] init];
  NSString *message = [RCTConvert NSString:options[@"message"]];
  ShareView *shareCtl = [[ShareView alloc] init];
//  [shareCtl share:options failureCallback: failureCallback successCallback: successCallback];
  [shareCtl share:options failureCallback: failureCallback successCallback: successCallback serviceType: SLServiceTypeTwitter];
//  initWithSuiteName:@"group.redditlabs.redditlabs"
//    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.redditlabs.redditlabs"];

  //successCallback(@[[NSNull null], message]);
  
  
}


//GenericShare *shareCtl = [[GenericShare alloc] init];
//[shareCtl shareSingle:options failureCallback: failureCallback successCallback: successCallback serviceType: SLServiceTypeTwitter];

RCT_EXPORT_METHOD(openDialog:(NSDictionary *)options
                  failureCallback:(RCTResponseErrorBlock)failureCallback
                  successCallback:(RCTResponseSenderBlock)successCallback)
{
if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
  
  SLComposeViewController *mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
  
  [mySLComposerSheet setInitialText:@"iOS 6 Social Framework test!"];
  
  [mySLComposerSheet addImage:[UIImage imageNamed:@"myImage.png"]];
  
  [mySLComposerSheet addURL:[NSURL URLWithString:@"http://stackoverflow.com/questions/12503287/tutorial-for-slcomposeviewcontroller-sharing"]];
  
  [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
    
    switch (result) {
      case SLComposeViewControllerResultCancelled:
        NSLog(@"Post Canceled");
        break;
      case SLComposeViewControllerResultDone:
        NSLog(@"Post Sucessful");
        break;
        
      default:
        break;
    }
  }];
  
  //[self presentViewController:mySLComposerSheet animated:YES completion:nil];
}
}


@end
