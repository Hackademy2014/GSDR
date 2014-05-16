//
//  PreventativeMeasuresViewController.h
//  GraniteStateDogRecovery
//
//  Created by Benjamin Petrin on 5/14/14.
//  Copyright (c) 2014 Granite State Dog Recovery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreventativeMeasuresViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) IBOutlet UILabel *tagInfoLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionInfoLabel;
@property (strong, nonatomic) IBOutlet UISwitch *microchipSwitch;

- (IBAction)takePicture:(id) sender;
- (IBAction)editTag:(id) sender;
- (IBAction)editDescription:(id)sender;
- (IBAction)microchipSwitchChanged:(id)sender;


@end
