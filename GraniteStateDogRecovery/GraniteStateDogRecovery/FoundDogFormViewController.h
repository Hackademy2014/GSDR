//
//  FoundDogFormViewController.h
//  GraniteStateDogRecovery
//
//  Created by Christine Graham on 5/15/14.
//  Copyright (c) 2014 Granite State Dog Recovery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoundDogFormViewController : UIViewController <UIWebViewDelegate>
{
    NSTimer *loadTimer;
}

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSTimer *loadTimer;

@end