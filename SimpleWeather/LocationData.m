//
//  LocationData.m
//  SimpleWeather
//
//  Created by Justin Janda on 2015-07-24.
//  Copyright (c) 2015 Justin Janda. All rights reserved.
//

#import "LocationData.h"

@implementation LocationData

@synthesize city;
@synthesize country;

static LocationData *instance = nil;

+(LocationData *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance= [LocationData new];
        }
    }
    return instance;
}
@end
