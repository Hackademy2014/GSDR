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
 *  Opens the default browser with the Granite State Dog Recovery Facebook Page. Due to Facebook behavior, if the user has Facebook installed, it may ask to open the Facebook app.
 */
- (IBAction)openFacebook {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.facebook.com/granitestatedogrecovery"]];
}

/**
 *  Opens the default browser with the Granite State Dog Recovery Twitter Page. Due to Twitter behavior, if the user has Twitter installed, it may ask to open the Twitter app.
 */
- (IBAction)openTwitter{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.twitter.com/GSdogrecovery"]];
}

/**
 *  Opens the default browser with the Granite State Dog Recovery YouTube Channel. Due to YouTube behavior, if the user has YouTube installed, it may ask to open the YouTube app.
 */
- (IBAction)openYouTube{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.youtube.com/GSdogrecovery"]];
        
}

/**
 *  When clicked, the phone will start calling the phone number listed.
 */
- (IBAction)callPhone
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Call GSDR?"
                                                     message:@"Would you like to call 1-855-639-5678?"
                                                    delegate:self cancelButtonTitle:@"Cancel"
                                           otherButtonTitles:@"Call", nil];
    
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
}


/**
 *  When clicked, the mail app will open with the to: field pre-filled with the email address below.
 */
- (IBAction)emailNonProfit
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto://Lost@granitestatedogrecovery.com"]];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://18556395678"]];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
