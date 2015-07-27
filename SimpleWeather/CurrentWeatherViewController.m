//
//  CurrentWeatherViewController.m
//  SimpleWeather
//
//  Created by Justin Janda on 2015-07-23.
//  Copyright (c) 2015 Justin Janda. All rights reserved.
//

#import "CurrentWeatherViewController.h"
#import "LocationData.h"

@interface CurrentWeatherViewController ()

@property (strong, nonatomic) NSString *country;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSMutableData *receiveData;

@end

@implementation CurrentWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self fetchCurrentWeather];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)fetchCurrentWeather {
    LocationData *location=[LocationData getInstance];
    self.country = location.country;
    self.city = location.city;
    //for celsius append: &units=metric
    //for fahrenheit append: &units=imperial
    
    //TODO: store apiKey else where
    NSString *apiKey = @"deca2aaf6cc37404105bc5f5519f30fb";
    
    
    NSString *requestString = [NSString stringWithFormat:
                               @"http://api.openweathermap.org/data/2.5/weather?q=%@,%@?id=%@&units=metric",
                               self.city, self.country, apiKey];
    
    
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLConnection *connection= [[NSURLConnection alloc] initWithRequest:request
                                                                 delegate:self];
    NSLog(@"%@", connection);
}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:_responseData
                                                                 options:0
                                                                   error:nil];
    
    NSDictionary *sys = jsonObject[@"sys"];
    NSDictionary *main = jsonObject[@"main"];
    NSArray *weatherArray = jsonObject[@"weather"];
    NSDictionary *weather = weatherArray.firstObject;
    self.locationLabel.text = [NSString stringWithFormat:@"%@, %@", jsonObject[@"name"], sys[@"country"]];
    self.tempLabel.text = [NSString stringWithFormat:@"%d \u00B0C", [main[@"temp"]intValue]];
    self.descriptionLabel.text = [NSString stringWithFormat:@"%@", weather[@"description"]];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Connection failed");
}

@end
