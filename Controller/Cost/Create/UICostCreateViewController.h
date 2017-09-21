//
//  UICostCreateViewController.h
//  BrederApp
//
//  Created by Bernardo Breder on 22/02/14.
//  Copyright (c) 2014 Bernardo Breder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICostListViewController.h"
#import "Time.h"

@interface UICostCreateViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) UICostListViewController* listController;
@property (nonatomic, strong) DayTime* day;

@property (nonatomic, strong) UIView* navView;
@property (nonatomic, strong) UIView* topView;
@property (nonatomic, strong) UILabel* dateLabel;
@property (nonatomic, strong) UIView* contentView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UITextField* titleText;
@property (nonatomic, strong) UILabel* valueLabel;
@property (nonatomic, strong) UITextField* valueText;
@property (nonatomic, strong) UIButton* addButton;
@property (nonatomic, strong) UIButton* cancelButton;

- (void)onCancelAction:(UIButton*)button;

- (void)onAddAction:(UIButton*)button;

- (void)onTextFieldKeyAction:(UITextField *)textField withText:(NSString*)text;

@end
