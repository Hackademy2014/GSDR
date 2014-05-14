//
//  GSDRPreventativeMeasuresViewController.h
//  GraniteStateDogRecovery
//
//  Created by Benjamin Petrin on 5/14/14.
//  Copyright (c) 2014 Granite State Dog Recovery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSDRPreventativeMeasuresViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) IBOutlet UILabel* tagInfoLabel;

-(IBAction)takePicture:(id) sender;
-(IBAction)editDescription:(id) sender;


@end
