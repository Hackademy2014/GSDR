//
//  LostDogFormViewController.m
//  GraniteStateDogRecovery
//
//  Created by Christine Graham on 5/14/14.
//  Copyright (c) 2014 Granite State Dog Recovery. All rights reserved.
//

#import "LostDogFormViewController.h"

@interface LostDogFormViewController ()

@end

@implementation LostDogFormViewController

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
    // Do any additional setup after loading the view.
    
    self.webView.delegate = self;
    
    NSURL *url = [NSURL URLWithString:@"http://m.granitestatedogrecovery.com/Lost-Dog-Report.html"];
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
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    loadTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(scrollPage) userInfo:nil repeats:NO];
}

- (void)scrollPage
{
    [self.webView.scrollView scrollRectToVisible:CGRectMake(0, self.webView.bounds.size.height + 300, 1, 1) animated:YES];
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
