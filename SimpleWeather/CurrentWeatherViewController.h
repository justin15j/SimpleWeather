//
//  CurrentWeatherViewController.h
//  SimpleWeather
//
//  Created by Justin Janda on 2015-07-23.
//  Copyright (c) 2015 Justin Janda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrentWeatherViewController : UIViewController<NSURLConnectionDelegate>
{
    NSMutableData *_responseData;
}
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@end
