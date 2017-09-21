//
//  UICostReportViewController.h
//  BrederApp
//
//  Created by Bernardo Breder on 24/02/14.
//  Copyright (c) 2014 Bernardo Breder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICostListViewController.h"

@interface UICostReportViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) UICostListViewController* listController;
@property (nonatomic, strong) UIView* navView;
@property (nonatomic, strong) UIButton* backButton;

@end

@interface UICostReportView : UIView

- (void)drawRect:(CGRect)rect;

@property (nonatomic, strong) NSSet* touches;
@property (nonatomic, strong) NSMutableArray* views;
@property (nonatomic, assign) bool touched;

@end