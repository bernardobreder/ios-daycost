//
//  Cost.h
//  BrederApp
//
//  Created by Bernardo Breder on 22/02/14.
//  Copyright (c) 2014 Bernardo Breder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Time.h"

@interface Cost : NSObject

@property (nonatomic, assign) int _id;

@property (nonatomic, strong) DayTime* day;

@property (nonatomic, strong) NSString* title;

@property (nonatomic, strong) NSNumber* value;

@end
