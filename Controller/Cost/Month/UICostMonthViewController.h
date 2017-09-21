//
//  UICostMonthViewController.h
//  BrederApp
//
//  Created by Bernardo Breder on 24/02/14.
//  Copyright (c) 2014 Bernardo Breder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICostListViewController.h"
#import "Time.h"

@interface UICostMonthViewController : UIViewController <UITableViewDataSource>

@property (nonatomic, strong) UICostListViewController* listController;
@property (nonatomic, strong) MonthTime* month;
@property (nonatomic, strong) NSMutableArray* array;

@property (nonatomic, strong) UIView* navView;
@property (nonatomic, strong) UIButton* backButton;
@property (nonatomic, strong) UIView* topView;
@property (nonatomic, strong) UILabel* monthLabel;
@property (nonatomic, strong) UILabel* valueLabel;
@property (nonatomic, strong) UITableView* tableView;

@end