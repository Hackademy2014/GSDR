//
//  GSDRPreventativeMeasuresViewController.m
//  GraniteStateDogRecovery
//
//  Created by Benjamin Petrin on 5/14/14.
//  Copyright (c) 2014 Granite State Dog Recovery. All rights reserved.
//

#import "GSDRPreventativeMeasuresViewController.h"

@interface GSDRPreventativeMeasuresViewController ()

@end

@implementation GSDRPreventativeMeasuresViewController

@synthesize tagInfoLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *tagData = [[NSUserDefaults standardUserDefaults] objectForKey:@"tagData"];
    if (tagData && ![tagData isEqualToString:@""]){
        self.tagInfoLabel.text = tagData;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - User actions

-(IBAction)takePicture:(id) sender{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You don't have a camera on this device"
                                                        message:@"Go take a picture of your dog using a camera"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *photoTaken = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    UIImageWriteToSavedPhotosAlbum(photoTaken, self, nil, nil);
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)editDescription:(id) sender{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Tag information" message:@"Enter the text of your dog's tag" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Save", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1){
        NSString* tagData = [alertView textFieldAtIndex:0].text;
        
        // Set the text
        tagInfoLabel.text = tagData;
        // Save it away
        NSUserDefaults  *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:tagData forKey:@"tagData"];
        [prefs synchronize];
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
