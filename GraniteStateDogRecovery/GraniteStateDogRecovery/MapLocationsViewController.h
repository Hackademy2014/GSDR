//
//  MapLocationsViewController.h
//  GraniteStateDogRecovery
//
//  Created by Christine Graham on 5/15/14.
//  Copyright (c) 2014 Granite State Dog Recovery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapLocationsViewController : UIViewController <MKMapViewDelegate>
{
    IBOutlet UISegmentedControl *searchTermCtrl;
    IBOutlet UIBarButtonItem *refreshButton;
    
    MKCoordinateRegion region;
    NSArray *places;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *searchTermCtrl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *refreshButton;

@property (nonatomic) MKCoordinateRegion region;
@property (nonatomic, strong) NSArray *places;

- (IBAction)refreshButtonClicked:(id)sender;
- (IBAction)searchTermCtrlClicked:(id)sender;

@end
