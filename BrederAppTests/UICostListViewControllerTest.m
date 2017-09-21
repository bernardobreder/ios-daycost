//
//  BrederAppTests.m
//  BrederAppTests
//
//  Created by Bernardo Breder on 22/02/14.
//  Copyright (c) 2014 Bernardo Breder. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppFixture.h"
#import "UICostListViewController.h"
#import "UICostCreateViewController.h"

@interface UICostListViewControllerTest : XCTestCase

@property (nonatomic, strong) AppFixture* fixture;
@property (nonatomic, strong) CostModel* costModel;
@property (nonatomic, strong) UICostListViewController* listController;

@end

@implementation UICostListViewControllerTest

@synthesize fixture;

- (void)setUp
{
    [super setUp];
    fixture = [[AppFixture alloc] init];
}

- (void)tearDown
{
    [super tearDown];
    [fixture finish];
}

- (void)testAddAndRemove
{
    XCTAssertEqual(0, [fixture listListCount]);
    [fixture listAddClick];
	XCTAssertFalse([fixture createAddEnabled]);
    [fixture createTitleType:@"Cafe"];
	XCTAssertFalse([fixture createAddEnabled]);
    [fixture createValueType:@"12"];
	XCTAssertTrue([fixture createAddEnabled]);
    [fixture createAddClick];
    XCTAssertEqual(1, [fixture listListCount]);
	XCTAssertTrue([@"Cafe" isEqualToString:[fixture listListTitle: 0]]);
	XCTAssertEqual(12.0, [fixture listListValue: 0]);
	[fixture listCellClick:0];
	[fixture detailDeleteClickAndConfirm];
	XCTAssertEqual(0, [fixture listListCount]);
}

- (void)testAddIntegerValue
{
    XCTAssertEqual(0, [fixture listListCount]);
    [fixture listAddClick];
	XCTAssertFalse([fixture createAddEnabled]);
    [fixture createTitleType:@"Cafe"];
	XCTAssertFalse([fixture createAddEnabled]);
    [fixture createValueType:@"12"];
	XCTAssertTrue([fixture createAddEnabled]);
    [fixture createAddClick];
    XCTAssertEqual(1, [fixture listListCount]);
	XCTAssertTrue([@"Cafe" isEqualToString:[fixture listListTitle: 0]]);
	XCTAssertEqual(12.0, [fixture listListValue: 0]);
}

- (void)testAddFloatValue
{
    XCTAssertEqual(0, [fixture listListCount]);
    [fixture listAddClick];
	XCTAssertFalse([fixture createAddEnabled]);
    [fixture createTitleType:@"Cafe"];
	XCTAssertFalse([fixture createAddEnabled]);
    [fixture createValueType:@"12.34"];
	XCTAssertTrue([fixture createAddEnabled]);
    [fixture createAddClick];
    XCTAssertEqual(1, [fixture listListCount]);
	XCTAssertTrue([@"Cafe" isEqualToString:[fixture listListTitle: 0]]);
	XCTAssertEqual(12.34, [fixture listListValue: 0]);
}

- (void)testAddDoubleValue
{
    XCTAssertEqual(0, [fixture listListCount]);
    [fixture listAddClick];
	XCTAssertFalse([fixture createAddEnabled]);
    [fixture createTitleType:@"Cafe"];
	XCTAssertFalse([fixture createAddEnabled]);
    [fixture createValueType:@"12.3456"];
	XCTAssertTrue([fixture createAddEnabled]);
    [fixture createAddClick];
    XCTAssertEqual(1, [fixture listListCount]);
	XCTAssertTrue([@"Cafe" isEqualToString:[fixture listListTitle: 0]]);
	XCTAssertEqual(12.35, [fixture listListValue: 0]);
}

- (void)testAddAndSaveInteger
{
    XCTAssertEqual(0, [fixture listListCount]);
    [fixture listAddClick];
	XCTAssertFalse([fixture createAddEnabled]);
    [fixture createTitleType:@"Cafe"];
	XCTAssertFalse([fixture createAddEnabled]);
    [fixture createValueType:@"12"];
	XCTAssertTrue([fixture createAddEnabled]);
    [fixture createAddClick];
    XCTAssertEqual(1, [fixture listListCount]);
	XCTAssertTrue([@"Cafe" isEqualToString:[fixture listListTitle: 0]]);
	XCTAssertEqual(12.0, [fixture listListValue: 0]);
	[fixture listCellClick:0];
	XCTAssertFalse([fixture detailSaveEnabled]);
	[fixture detailTitleType:@"Ca"];
	XCTAssertTrue([fixture detailSaveEnabled]);
	[fixture detailTitleType:@"Cafe"];
	XCTAssertFalse([fixture detailSaveEnabled]);
	[fixture detailValueType:@"10"];
	[fixture detailTitleType:@"Cafe10"];
	XCTAssertTrue([fixture detailSaveEnabled]);
	[fixture detailSaveClick];
	XCTAssertEqual(1, [fixture listListCount]);
	XCTAssertTrue([@"Cafe10" isEqualToString:[fixture listListTitle: 0]]);
	XCTAssertEqual(10.0, [fixture listListValue: 0]);
}

- (void)testAddAndSaveFloat
{
    XCTAssertEqual(0, [fixture listListCount]);
    [fixture listAddClick];
	XCTAssertFalse([fixture createAddEnabled]);
    [fixture createTitleType:@"Cafe"];
	XCTAssertFalse([fixture createAddEnabled]);
    [fixture createValueType:@"12"];
	XCTAssertTrue([fixture createAddEnabled]);
    [fixture createAddClick];
    XCTAssertEqual(1, [fixture listListCount]);
	XCTAssertTrue([@"Cafe" isEqualToString:[fixture listListTitle: 0]]);
	XCTAssertEqual(12.0, [fixture listListValue: 0]);
	[fixture listCellClick:0];
	XCTAssertFalse([fixture detailSaveEnabled]);
	[fixture detailTitleType:@"Ca"];
	XCTAssertTrue([fixture detailSaveEnabled]);
	[fixture detailTitleType:@"Cafe"];
	XCTAssertFalse([fixture detailSaveEnabled]);
	[fixture detailValueType:@"10.23"];
	[fixture detailTitleType:@"Cafe10"];
	XCTAssertTrue([fixture detailSaveEnabled]);
	[fixture detailSaveClick];
	XCTAssertEqual(1, [fixture listListCount]);
	XCTAssertTrue([@"Cafe10" isEqualToString:[fixture listListTitle: 0]]);
	XCTAssertEqual(10.23, [fixture listListValue: 0]);
}

- (void)testAddAndSaveDouble
{
    XCTAssertEqual(0, [fixture listListCount]);
    [fixture listAddClick];
	XCTAssertFalse([fixture createAddEnabled]);
    [fixture createTitleType:@"Cafe"];
	XCTAssertFalse([fixture createAddEnabled]);
    [fixture createValueType:@"12"];
	XCTAssertTrue([fixture createAddEnabled]);
    [fixture createAddClick];
    XCTAssertEqual(1, [fixture listListCount]);
	XCTAssertTrue([@"Cafe" isEqualToString:[fixture listListTitle: 0]]);
	XCTAssertEqual(12.0, [fixture listListValue: 0]);
	[fixture listCellClick:0];
	XCTAssertFalse([fixture detailSaveEnabled]);
	[fixture detailTitleType:@"Ca"];
	XCTAssertTrue([fixture detailSaveEnabled]);
	[fixture detailTitleType:@"Cafe"];
	XCTAssertFalse([fixture detailSaveEnabled]);
	[fixture detailValueType:@"10.3456"];
	[fixture detailTitleType:@"Cafe10"];
	XCTAssertTrue([fixture detailSaveEnabled]);
	[fixture detailSaveClick];
	XCTAssertEqual(1, [fixture listListCount]);
	XCTAssertTrue([@"Cafe10" isEqualToString:[fixture listListTitle: 0]]);
	XCTAssertEqual(10.35, [fixture listListValue: 0]);
}

@end
