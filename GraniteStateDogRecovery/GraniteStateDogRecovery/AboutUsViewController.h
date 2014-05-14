//
//  AboutUsViewController.h
//  GraniteStateDogRecovery
//
//  Created by Christine Graham on 5/14/14.
//  Copyright (c) 2014 Granite State Dog Recovery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSDRAppDelegate.h"
#import "GSDRMainViewController.h"

@interface AboutUsViewController : UIViewController

{
    IBOutlet UIButton *websiteButton;
    IBOutlet UIButton *facebookButton;
    IBOutlet UIButton *twitterButton;
    IBOutlet UIButton *youTubeButton;
    IBOutlet UIButton *phoneButton;
    IBOutlet UIButton *emailButton;
    IBOutlet UIButton *loriButton;
    IBOutlet UIButton *hollyButton;
    IBOutlet UIButton *amyButton;
    IBOutlet UIButton *susanKButton;
    IBOutlet UIButton *bethButton;
    IBOutlet UIButton *susanPButton;


}

@property (retain, nonatomic) UIButton *websiteButton;
@property (retain, nonatomic) UIButton *facebookButton;
@property (retain, nonatomic) UIButton *twitterButton;
@property (retain, nonatomic) UIButton *youTubeButton;
@property (retain, nonatomic) UIButton *phoneButton;
@property (retain, nonatomic) UIButton *emailButton;
@property (retain, nonatomic) UIButton *loriButton;
@property (retain, nonatomic) UIButton *hollyButton;
@property (retain, nonatomic) UIButton *amyButton;
@property (retain, nonatomic) UIButton *susanKButton;
@property (retain, nonatomic) UIButton *bethButton;
@property (retain, nonatomic) UIButton *susanPButton;

- (IBAction)showWebsite;
- (IBAction)openFacebook;
- (IBAction)openTwitter;
- (IBAction)openYouTube;
- (IBAction)callPhone;
- (IBAction)emailNonProfit;
- (IBAction)aboutLori;
- (IBAction)aboutHolly;
- (IBAction)aboutAmy;
- (IBAction)aboutSusanK;
- (IBAction)aboutBeth;
- (IBAction)aboutSusanP;

@end
