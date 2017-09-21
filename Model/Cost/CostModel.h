//
//  CostModel.h
//  BrederApp
//
//  Created by Bernardo Breder on 22/02/14.
//  Copyright (c) 2014 Bernardo Breder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cost.h"
#import "sqlite3.h"
#import "Time.h"

@interface CostModel : NSObject {
    sqlite3* _db;
}

- (id)init;

- (void)close;

- (void)reset;

- (NSMutableArray*)list;

- (NSMutableArray*)list:(DayTime*)day;

- (NSMutableArray*)listMonth:(MonthTime*)month;

- (int)create:(DayTime*)day withTitle:(NSString*)title withValue:(double)value;

- (void)remove:(NSInteger)id;

- (void)update:(NSInteger)id withDay:(DayTime*)day withTitle:(NSString*)title withValue:(double)value;

@end
