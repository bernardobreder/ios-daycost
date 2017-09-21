//
//  UICostDetailViewController.h
//  BrederApp
//
//  Created by Bernardo Breder on 22/02/14.
//  Copyright (c) 2014 Bernardo Breder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICostListViewController.h"

@interface UICostDetailViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) UICostListViewController* listViewController;
@property (nonatomic, strong) UICostListTaskListView* taskListView;
@property (nonatomic, strong) Cost* data;

@property (nonatomic, strong) UIView* navView;
@property (nonatomic, strong) UIButton* backButton;
@property (nonatomic, strong) UIButton* saveButton;
@property (nonatomic, strong) UIButton* deleteButton;
@property (nonatomic, strong) UIView* topView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UIView* contentView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UITextField* titleText;
@property (nonatomic, strong) UILabel* valueLabel;
@property (nonatomic, strong) UITextField* valueText;

- (void)onBackAction:(UIButton*)button;
- (UIAlertView*)onDeleteAction:(UIButton*)button;
- (void)onSaveAction:(UIButton*)button;
- (void)onTextFieldKeyAction:(UITextField *)textField withText:(NSString*)text;

@end
