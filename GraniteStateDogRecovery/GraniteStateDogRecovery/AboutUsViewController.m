//
//  AboutUsViewController.m
//  GraniteStateDogRecovery
//
//  Created by Christine Graham on 5/14/14.
//  Copyright (c) 2014 Granite State Dog Recovery. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

@synthesize websiteButton;
@synthesize facebookButton;
@synthesize twitterButton;
@synthesize youTubeButton;
@synthesize phoneButton;
@synthesize emailButton;
@synthesize loriButton;
@synthesize hollyButton;
@synthesize amyButton;
@synthesize susanKButton;
@synthesize bethButton;
@synthesize susanPButton;

#pragma mark - Generated Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - About Us Methods

/**
 *  Show the Granite State Dog Recovery Website in the Default Browser
 *  http://www.granitestatedogrecovery.com/
 */
- (IBAction)showWebsite
{
    //Open the default browser and load the website's url
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.granitestatedogrecovery.com/"]];
}

/**
 *  Opens the default browser with the Granite State Dog Recovery Facebook Page. Due to the Facebook behavior, if the user has Facebook installed, it may ask to open the facebook app.
 */
- (IBAction)openFacebook {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.facebook.com/granitestatedogrecovery"]];
}

- (IBAction)openTwitter{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.twitter.com/GSdogrecovery"]];
}

- (IBAction)openYouTube{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.youtube.com/GSdogrecovery"]];
        
}

- (IBAction)callPhone
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://18556395678"]];
}


- (IBAction)emailNonProfit
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto://Lost@granitestatedogrecovery.com"]];
}


- (IBAction)aboutLori
{
    
}


- (IBAction)aboutHolly
{
    
}


- (IBAction)aboutAmy
{
    
}


- (IBAction)aboutSusanK
{
    
}


- (IBAction)aboutBeth
{
    
}


- (IBAction)aboutSusanP
{
    
}


#pragma mark - Helper Methods



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

//- (void)flipsideViewControllerDidFinish:(NetticaFlipsideViewController *)controller
//{
    //show new flash card
//    [self showCard];
    
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
//        [self dismissViewControllerAnimated:YES completion:nil];
//    } else {
//        [self.flipsidePopoverController dismissPopoverAnimated:YES];
//        self.flipsidePopoverController = nil;
//    }
//}


@end
