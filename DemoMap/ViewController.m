//
//  ViewController.m
//  DemoMap
//
//  Created by Nordin on 15/09/16.
//  Copyright © 2016 AppPlanet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    BOOL finishedLoadingMap;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self initializeUI];
    finishedLoadingMap = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initializeUI {
    self.purpleView.hidden = YES;
}


#pragma mark - mapview callbacks
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    NSLog(@"[mapViewDidFinishLoadingMap]");
    if(!finishedLoadingMap) {
        [self addDemoPin];
        finishedLoadingMap = YES;
    }
}

- (void) mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    NSLog(@"[mapView - didSelectAnnotationView]");
    
    [self hidePurpleView: NO];
}

- (void) mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    NSLog(@"[mapView - didDeSelectAnnotationView]");
    
    [self hidePurpleView: YES];
}


-(void) addDemoPin {
    CLLocationCoordinate2D annotationCoord;
    
    annotationCoord.latitude = 35.778266;
    annotationCoord.longitude = -5.775089;
    
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = annotationCoord;
    annotationPoint.title = @"Ronald Gump";
    annotationPoint.subtitle = @"I love you all!";
    [_mapView addAnnotation:annotationPoint];
    [_mapView selectAnnotation: annotationPoint animated: YES];
}

- (void) hidePurpleView: (BOOL) hide {
    [UIView animateWithDuration: 0.5
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations: ^() {
                         if(hide)
                             self.bottomConstraint.constant = -CGRectGetHeight(self.purpleView.bounds);
                         else
                             self.bottomConstraint.constant = 0;
                         
                         [self.purpleView layoutIfNeeded];
                     }
                     completion: ^(BOOL finished) {
                         NSLog(@"animation on prupleview finished");
                     }];
}

@end
