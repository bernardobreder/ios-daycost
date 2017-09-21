//
//  AppFixture.h
//  BrederApp
//
//  Created by Bernardo Breder on 04/03/14.
//  Copyright (c) 2014 Bernardo Breder. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CostModel;
@class UICostListViewController;
@class UICostCreateViewController;
@class UICostDetailViewController;
@class UICostMonthViewController;

@interface AppFixture : NSObject

@property (nonatomic, strong) UIWindow* window;
@property (nonatomic, strong) CostModel* costModel;
@property (nonatomic, strong) UICostListViewController* listController;
@property (nonatomic, strong) UICostCreateViewController* createController;
@property (nonatomic, strong) UICostDetailViewController* detailController;
@property (nonatomic, strong) UICostMonthViewController* monthController;

- (id)init;

- (void)finish;

- (AppFixture*)listAddClick;
- (AppFixture*)listCellClick:(int)index;
- (int)listListCount;
- (NSString*)listListTitle:(int)index;
- (double)listListValue:(int)index;

- (AppFixture*)createTitleType:(NSString*)value;
- (AppFixture*)createValueType:(NSString*)value;
- (AppFixture*)createAddClick;
- (BOOL)createAddEnabled;

- (AppFixture*)detailTitleType:(NSString*)value;
- (AppFixture*)detailValueType:(NSString*)value;
- (UIAlertView*)detailDeleteClick;
- (AppFixture*)detailDeleteClickAndConfirm;
- (AppFixture*)detailSaveClick;
- (AppFixture*)detailBackClick;
- (BOOL)detailSaveEnabled;

@end
