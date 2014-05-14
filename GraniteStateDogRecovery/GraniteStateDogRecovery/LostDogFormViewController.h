//
//  LostDogFormViewController.h
//  GraniteStateDogRecovery
//
//  Created by Christine Graham on 5/14/14.
//  Copyright (c) 2014 Granite State Dog Recovery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LostDogFormViewController : UIViewController <UIWebViewDelegate>
{
    NSTimer *loadTimer;
}

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSTimer *loadTimer;

@end
