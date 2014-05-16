//
//  FoundDogFormViewController.m
//  GraniteStateDogRecovery
//
//  Created by Christine Graham on 5/15/14.
//  Copyright (c) 2014 Granite State Dog Recovery. All rights reserved.
//

#import "FoundDogFormViewController.h"

@interface FoundDogFormViewController ()

@end

@implementation FoundDogFormViewController

@synthesize webView = _webView;
@synthesize loadTimer;

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
    
    // Since our ViewController is also acting as a UIWebViewDelegate, we need to set the webView delegate to be the view controller.
    self.webView.delegate = self;
    
    // Set the url of our webview for when the page loads
    NSURL *url = [NSURL URLWithString:@"http://m.granitestatedogrecovery.com/Found-Dog-Report.html"];
    NSURLRequest *requestURL = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestURL];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Optional UIWebViewDelegate delegate methods
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // Hide the network activity indicator
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    // Wait 1/10 of a second to scroll the page, otherwise it will bounce back to the top
    loadTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(scrollPage) userInfo:nil repeats:NO];
}

/**
 *  Scroll the web page to the top of the form, ignoring the logo and title information
 */
- (void)scrollPage
{
    [self.webView.scrollView scrollRectToVisible:CGRectMake(0, self.webView.bounds.size.height + 200, 1, 1) animated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
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
