//
//  GSDRDetailViewController.h
//  Granite State Dog Recovery
//
//  Created by Benjamin Petrin on 5/5/14.
//  Copyright (c) 2014 Granite State Dog Recovery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSDRDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
