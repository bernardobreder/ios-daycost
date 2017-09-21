//
//  CostModel.m
//  BrederApp
//
//  Created by Bernardo Breder on 22/02/14.
//  Copyright (c) 2014 Bernardo Breder. All rights reserved.
//

#import "CostModel.h"
#import "Cost.h"
#import "sqlite3.h"
#import "Time.h"

@implementation CostModel

- (NSString*)pathOfDatabase:(NSString*)name
{
    NSString* db = [NSString stringWithFormat:@"%@.sqlite3", name];
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* docDir = [paths objectAtIndex:0];
    NSString* path = [docDir stringByAppendingPathComponent:db];
    return path;
}

- (id)init
{
    if (!(self = [super init])) return nil;
    NSString* path = [self pathOfDatabase: @"cost"];
    int result = sqlite3_open([path UTF8String], &_db);
    if (result != SQLITE_OK) {
        return 0;
    }
    {
        NSString* sql = @"create table if not exists cost (_id integer not null primary key autoincrement, day integer not null, title text not null, value number not null, label text not null default '')";
        char* error;
        result = sqlite3_exec(_db, [sql UTF8String], 0, 0, &error);
        if (result != SQLITE_OK) {
            return 0;
        }
    }
    {
        NSString* sql = @"create index if not exists cost_day on cost (day)";
        char* error;
        sqlite3_exec(_db, [sql UTF8String], 0, 0, &error);
        result = sqlite3_exec(_db, [sql UTF8String], 0, 0, &error);
        if (result != SQLITE_OK) {
            return 0;
        }
    }
    return self;
}

- (void)close
{
    sqlite3_close(_db);
}

- (void)reset
{
    sqlite3_exec(_db, [@"delete from cost" UTF8String], 0, 0, 0);
}

- (NSMutableArray*)list
{
    NSMutableArray* array = [[NSMutableArray alloc] init];
    NSString* sql = @"select _id, day, title, value from cost order by _id";
    sqlite3_stmt* stmt;
    int result = sqlite3_prepare_v2(_db, [sql UTF8String], -1, &stmt, 0);
    if (result != SQLITE_OK) {
        return 0;
    }
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        Cost* data = [[Cost alloc] init];
        data._id = sqlite3_column_int(stmt, 1);
        data.day = [[DayTime alloc] initWithTime:sqlite3_column_int(stmt, 2)];
        data.title = [NSString stringWithCString:(const char*)sqlite3_column_text(stmt, 3) encoding:NSUTF8StringEncoding];
        data.value = [NSNumber numberWithDouble:sqlite3_column_double(stmt, 4)];
        [array addObject:data];
    }
    if (result != SQLITE_OK) {
        sqlite3_finalize(stmt);
        return 0;
    }
    sqlite3_finalize(stmt);
    return array;
}

- (NSMutableArray*)list:(DayTime*)day
{
    NSMutableArray* array = [[NSMutableArray alloc] init];
    NSString* sql = @"select _id, title, value from cost where day = ? order by _id";
    sqlite3_stmt* stmt;
    int result = sqlite3_prepare_v2(_db, [sql UTF8String], -1, &stmt, 0);
    if (result != SQLITE_OK) {
        return 0;
    }
    sqlite3_bind_int(stmt, 1, day.time);
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        Cost* data = [[Cost alloc] init];
        data._id = sqlite3_column_int(stmt, 0);
        data.day = day;
        data.title = [NSString stringWithCString:(const char*)sqlite3_column_text(stmt, 1) encoding:NSUTF8StringEncoding];
        data.value = [NSNumber numberWithDouble:sqlite3_column_double(stmt, 2)];
        [array addObject:data];
    }
    if (result != SQLITE_OK) {
        sqlite3_finalize(stmt);
        return 0;
    }
    sqlite3_finalize(stmt);
    return array;
}

- (NSMutableArray*)listMonth:(MonthTime*)month
{
    DayTime* firstDayTime = month.firstDayTime;
    DayTime* lastDayTime = month.lastDayTime;
    NSMutableArray* array = [[NSMutableArray alloc] init];
    NSString* sql = @"select _id, day, title, value from cost where day >= ? and day <= ? order by day, _id";
    sqlite3_stmt* stmt;
    int result = sqlite3_prepare_v2(_db, [sql UTF8String], -1, &stmt, 0);
    if (result != SQLITE_OK) {
        return 0;
    }
    sqlite3_bind_int(stmt, 1, firstDayTime.time);
    sqlite3_bind_int(stmt, 2, lastDayTime.time);
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        Cost* data = [[Cost alloc] init];
        data._id = sqlite3_column_int(stmt, 0);
        data.day = [[DayTime alloc] initWithTime: sqlite3_column_int(stmt, 1)];
        data.title = [NSString stringWithCString:(const char*)sqlite3_column_text(stmt, 2) encoding:NSUTF8StringEncoding];
        data.value = [NSNumber numberWithDouble:sqlite3_column_double(stmt, 3)];
        [array addObject:data];
    }
    if (result != SQLITE_OK) {
        sqlite3_finalize(stmt);
        return 0;
    }
    sqlite3_finalize(stmt);
    return array;
}

- (int)create:(DayTime*)day withTitle:(NSString*)title withValue:(double) value
{
    NSString* sql = @"insert or replace into cost (_id, day, title, value) values (?, ?, ?, ?)";
    sqlite3_stmt* stmt;
    int result = sqlite3_prepare_v2(_db, [sql UTF8String], -1, &stmt, 0);
    if (result != SQLITE_OK) {
        return 0;
    }
    sqlite3_bind_int(stmt, 2, day.time);
    sqlite3_bind_text(stmt, 3, [title UTF8String], -1, nil);
    sqlite3_bind_double(stmt, 4, [[NSString stringWithFormat: @"%.2f", value] doubleValue]);
    result = sqlite3_step(stmt);
    if (result != SQLITE_DONE) {
        sqlite3_finalize(stmt);
        return 0;
    }
    sqlite3_int64 lastId = sqlite3_last_insert_rowid(_db);
    sqlite3_finalize(stmt);
    return (int)lastId;
}

- (void)remove:(NSInteger)id
{
    NSString* sql = @"delete from cost where _id = ?";
    sqlite3_stmt* stmt;
    int result = sqlite3_prepare_v2(_db, [sql UTF8String], -1, &stmt, 0);
    if (result != SQLITE_OK) {
        return;
    }
    sqlite3_bind_int(stmt, 1, (int)id);
    result = sqlite3_step(stmt);
    if (result != SQLITE_OK) {
        sqlite3_finalize(stmt);
        return;
    }
    sqlite3_finalize(stmt);
}

- (void)update:(NSInteger)id withDay:(DayTime*)day withTitle:(NSString*)title withValue:(double)value
{
    NSString* sql = @"insert or replace into cost (_id, day, title, value) values (?, ?, ?, ?)";
    sqlite3_stmt* stmt;
    int result = sqlite3_prepare_v2(_db, [sql UTF8String], -1, &stmt, 0);
    if (result != SQLITE_OK) {
        return;
    }
    sqlite3_bind_int(stmt, 1, (int)id);
    sqlite3_bind_int(stmt, 2, day.time);
    sqlite3_bind_text(stmt, 3, [title UTF8String], -1, nil);
    sqlite3_bind_double(stmt, 4, [[NSString stringWithFormat: @"%.2f", value] doubleValue]);
    result = sqlite3_step(stmt);
    if (result != SQLITE_OK) {
        sqlite3_finalize(stmt);
        return;
    }
    sqlite3_finalize(stmt);
}

@end
