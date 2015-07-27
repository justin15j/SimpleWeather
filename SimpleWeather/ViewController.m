//
//  ViewController.m
//  SimpleWeather
//
//  Created by Justin Janda on 2015-07-22.
//  Copyright (c) 2015 Justin Janda. All rights reserved.
//

#import "ViewController.h"
#import "LocationData.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    LocationData *location=[LocationData getInstance];
    location.city = self.cityTextField.text;
    location.country = self.countryTextField.text;
    NSLog(@"Location: %@, %@", location.city, location.country);
}

@end
