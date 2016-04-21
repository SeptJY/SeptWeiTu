//
//  JYHomeController.m
//  SeptWeiTu
//
//  Created by Sept on 16/4/21.
//  Copyright © 2016年 九月. All rights reserved.
//

#import "JYHomeController.h"
#import "BMKMapView.h"

@interface JYHomeController ()

@property (strong, nonatomic) BMKMapView *mapView;

@end

@implementation JYHomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (BMKMapView *)mapView
{
    if (!_mapView) {
        
        _mapView = [[BMKMapView alloc] init];
        
        [self.view addSubview:_mapView];
    }
    return _mapView;
}

- (void)viewWillLayoutSubviews
{
    self.mapView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

@end
