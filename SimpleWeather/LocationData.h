//
//  LocationData.h
//  SimpleWeather
//
//  Created by Justin Janda on 2015-07-24.
//  Copyright (c) 2015 Justin Janda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationData : NSObject {
    
    NSString *city;
    NSString *country;
}

@property(nonatomic,retain)NSString *city;
@property(nonatomic,retain)NSString *country;

+(LocationData*)getInstance;

@end
