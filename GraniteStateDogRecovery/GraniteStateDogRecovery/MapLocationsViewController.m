//
//  MapLocationsViewController.m
//  GraniteStateDogRecovery
//
//  Created by Christine Graham on 5/15/14.
//  Copyright (c) 2014 Granite State Dog Recovery. All rights reserved.
//

#import "MapLocationsViewController.h"
#import "PlaceAnnotation.h"

#define METERS_PER_MILE 1609.344

@interface MapLocationsViewController ()


@end

@implementation MapLocationsViewController

@synthesize searchTermCtrl;
@synthesize refreshButton;

@synthesize region;
@synthesize places;


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
    
    [_mapView setDelegate:self];

}

- (void)viewWillAppear:(BOOL)animated
{
    // check to see if Location Services is enabled, there are two state possibilities:
    // 1) disabled for entire device, 2) disabled just for this app
    //
    NSString *causeStr = nil;
    
    // check whether location services are enabled on the device
    if ([CLLocationManager locationServicesEnabled] == NO)
    {
        causeStr = @"device";
    }
    // check the application’s explicit authorization status:
    else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)
    {
        causeStr = @"app";
    }
    else
    {
        // All is okay
    }
    
    if (causeStr != nil)
    {
        NSString *alertMessage = [NSString stringWithFormat:@"You currently have location services disabled for this %@. Please refer to \"Settings\" app to turn on Location Services.", causeStr];
        
        UIAlertView *servicesDisabledAlert = [[UIAlertView alloc] initWithTitle:@"Location Services Disabled"
                                                                        message:alertMessage
                                                                       delegate:nil
                                                              cancelButtonTitle:@"OK"
                                                              otherButtonTitles:nil];
        [servicesDisabledAlert show];
    }
}

- (IBAction)refreshButtonClicked:(id)sender {
    
    // Save the current region
    region = _mapView.region;
    
    // Get clicked segment if any
    NSString *searchString = [self getSearchString];
    
    // If the user is actually searching for one of the terms, display those results on the map
    if (searchString.length > 0)
    {
        [self showResults:searchString];
    }
}

- (IBAction)searchTermCtrlClicked:(id)sender {
    
    // Save the current region
    region = _mapView.region;
    
    NSString *searchString = [self getSearchString];
    
    
    [self showResults:searchString];
}

- (NSString *)getSearchString
{
    NSString *searchString = @"";
    
    // Get clicked segment
    if(searchTermCtrl.selectedSegmentIndex == 0)
    {
        searchString = @"Humane";
    }
    else if(searchTermCtrl.selectedSegmentIndex == 1)
    {
        searchString = @"Animal Shelter";
    }
    else if(searchTermCtrl.selectedSegmentIndex == 2)
    {
        searchString = @"Vet";
    }
    
    return searchString;
}

- (void)showResults:(NSString *)searchString
{
    
    // Clear existing pins
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    
    request.naturalLanguageQuery = searchString;
    request.region = region;
    
    MKLocalSearchCompletionHandler completionHandler = ^(MKLocalSearchResponse *response, NSError *error)
    {
        if (error != nil)
        {
            NSString *errorStr = [[error userInfo] valueForKey:NSLocalizedDescriptionKey];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Could not find places"
                                                            message:errorStr
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        else
        {
            self.places = [response mapItems];
            
            // add all the found annotations to the map
            
            for (MKMapItem *item in self.places)
            {
                PlaceAnnotation *annotation = [[PlaceAnnotation alloc] init];
                annotation.coordinate = item.placemark.location.coordinate;
                annotation.title = item.name;
                annotation.url = item.url;
                [self.mapView addAnnotation:annotation];
            }
        
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    };
    
    MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    
    [localSearch startWithCompletionHandler:completionHandler];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MapView Delegate Methods

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    region = MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate, 10000, 10000);
    [mapView setRegion:region animated:YES];
    
    // remove us as delegate so we don't re-center map each time user moves
    mapView.delegate = nil;
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
