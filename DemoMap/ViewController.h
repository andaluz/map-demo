//
//  ViewController.h
//  DemoMap
//
//  Created by Nordin on 15/09/16.
//  Copyright © 2016 AppPlanet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate>


@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet UIView *purpleView;


@end

