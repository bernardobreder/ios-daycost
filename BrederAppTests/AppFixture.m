//
//  AppFixture.m
//  BrederApp
//
//  Created by Bernardo Breder on 04/03/14.
//  Copyright (c) 2014 Bernardo Breder. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppFixture.h"
#import "CostModel.h"
#import "UICostListViewController.h"
#import "UICostCreateViewController.h"
#import "UICostDetailViewController.h"
#import "UICostMonthViewController.h"

@implementation AppFixture

@synthesize window;
@synthesize costModel;
@synthesize listController;
@synthesize createController;
@synthesize detailController;
@synthesize monthController;

#define XCTAssertNilViewController(CV) if (CV) { @throw @"not expected #CV controller view visibled"; }
#define XCTAssertNotNilViewController(CV) if (!CV) { @throw @"not expected #CV controller view visibled"; }

- (id)init
{
    self = [super init];
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    costModel = [[CostModel alloc] init];
    [costModel reset];
    listController = [[UICostListViewController alloc] init];
    listController.costModel = costModel;
	[listController viewDidLoad];
    window.rootViewController = listController;
    return self;
}

- (void)finish
{
    [costModel finish];
}

- (AppFixture*)listAddClick
{
    if (createController) {
        @throw @"not expected create controller view visibled";
    }
    if (detailController) {
        @throw @"not expected detail controller view visibled";
    }
    if (monthController) {
        @throw @"not expected month controller view visibled";
    }
    createController = [listController onAddAction:nil];
	[createController viewDidLoad];
    return self;
}

- (AppFixture*)listCellClick:(int)index
{
    XCTAssertNilViewController(createController);
    XCTAssertNilViewController(detailController);
    XCTAssertNilViewController(monthController);
	UICostListTaskListView* cellView = (UICostListTaskListView*)[listController.costScrollView page];
	detailController = [cellView onDetailAction:index];
	[detailController viewDidLoad];
    return self;
}

- (int)listListCount
{
    XCTAssertNilViewController(createController);
    XCTAssertNilViewController(detailController);
    XCTAssertNilViewController(monthController);
    return ((UICostListTaskListView*)[listController.costScrollView page]).array.count;
}

- (NSString*)listListTitle:(int)index
{
    XCTAssertNilViewController(createController);
    XCTAssertNilViewController(detailController);
    XCTAssertNilViewController(monthController);
    Cost* cost = ((UICostListTaskListView*)[listController.costScrollView page]).array[index];
    return cost.title;
}

- (double)listListValue:(int)index
{
    XCTAssertNilViewController(createController);
    XCTAssertNilViewController(detailController);
    XCTAssertNilViewController(monthController);
//    XCTAssertTrue(index < [self listListCount]);
    Cost* cost = ((UICostListTaskListView*)[listController.costScrollView page]).array[index];
    return [cost.value doubleValue];
}

- (AppFixture*)createTitleType:(NSString*)value
{
	XCTAssertNotNilViewController(createController);
    [createController onTextFieldKeyAction:createController.titleText withText:value];
    return self;
}

- (AppFixture*)createValueType:(NSString*)value
{
	XCTAssertNotNilViewController(createController);
    [createController onTextFieldKeyAction:createController.valueText withText:value];
    return self;
}

- (AppFixture*)createAddClick
{
	XCTAssertNotNilViewController(createController);
	if ([self createAddEnabled]) {
        [createController onAddAction:createController.addButton];
        createController = NULL;
    }
    return self;
}

- (AppFixture*)createCancelClick
{
	XCTAssertNotNilViewController(createController);
    [createController onCancelAction:createController.cancelButton];
	createController = NULL;
    return self;
}

- (BOOL)createAddEnabled
{
	XCTAssertNotNilViewController(createController);
	return createController.addButton.enabled;
}


- (AppFixture*)detailTitleType:(NSString*)value
{
	XCTAssertNotNilViewController(detailController);
    [detailController onTextFieldKeyAction:detailController.titleText withText:value];
    return self;
}

- (AppFixture*)detailValueType:(NSString*)value
{
	XCTAssertNotNilViewController(detailController);
    [detailController onTextFieldKeyAction:detailController.valueText withText:value];
    return self;
}

- (UIAlertView*)detailDeleteClick
{
	XCTAssertNotNilViewController(detailController);
    return [detailController onDeleteAction:detailController.deleteButton];
}

- (AppFixture*)detailDeleteClickAndConfirm
{
	XCTAssertNotNilViewController(detailController);
    UIAlertView* alertView = [self detailDeleteClick];
    [detailController alertView:alertView clickedButtonAtIndex:1];
	detailController = NULL;
    return self;
}

- (AppFixture*)detailSaveClick
{
	XCTAssertNotNilViewController(detailController);
	if ([self detailSaveEnabled]) {
        [detailController onSaveAction:detailController.saveButton];
        detailController = NULL;
    }
    return self;
}

- (AppFixture*)detailBackClick
{
	XCTAssertNotNilViewController(detailController);
    [detailController onBackAction:detailController.backButton];
	detailController = NULL;
    return self;
}

- (BOOL)detailSaveEnabled
{
	XCTAssertNotNilViewController(detailController);
	return detailController.saveButton.enabled;
}

@end
