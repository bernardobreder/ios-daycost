//
//  UICostListViewController.h
//  BrederApp
//
//  Created by Bernardo Breder on 22/02/14.
//  Copyright (c) 2014 Bernardo Breder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIInfinitScrollView.h"
#import "CostModel.h"

@class UICostCreateViewController;
@class UICostDetailViewController;

@interface UICostListViewController : UIViewController <UIInfinitScrollViewDelegate>

@property(nonatomic, strong) CostModel* costModel;

@property(nonatomic, strong) UIView* toolbarView;
@property(nonatomic, strong) UILabel* totalLabel;
@property(nonatomic, strong) UIInfinitScrollView* costScrollView;
@property(nonatomic, strong) UIButton* addButton;
@property(nonatomic, strong) UIButton* reportButton;
@property(nonatomic, strong) UIButton* monthButton;

- (UICostCreateViewController*)onAddAction:(UIButton*)button;

- (void)reloadData;

@end

@interface UICostListTaskListView : UIScrollView <UITableViewDataSource, UITableViewDelegate> 

@property(nonatomic, strong) UICostListViewController* costListViewController;
@property(nonatomic, strong) DayTime* day;
@property(nonatomic, strong) CostModel* costModel;
@property(nonatomic, strong) NSMutableArray* array;
@property(nonatomic, strong) UITableView* tableView;
@property(nonatomic, strong) UILabel* titleLabel;
@property(nonatomic, strong) UILabel* totalLabel;

- (UICostDetailViewController*)onDetailAction:(int)index;

@end

@interface UICostListTaskListCell : UITableViewCell

@property(nonatomic, strong) UILabel* titleLabel;
@property(nonatomic, strong) UILabel* valueLabel;

- (id)init;

@end