//
//  UICostDetailViewController.m
//  BrederApp
//
//  Created by Bernardo Breder on 22/02/14.
//  Copyright (c) 2014 Bernardo Breder. All rights reserved.
//

#import "UICostDetailViewController.h"

@interface UICostDetailViewController ()

@end

@implementation UICostDetailViewController

@synthesize listViewController;
@synthesize taskListView;
@synthesize data;

@synthesize navView;
@synthesize backButton;
@synthesize saveButton;
@synthesize deleteButton;
@synthesize topView;
@synthesize nameLabel;
@synthesize contentView;
@synthesize titleLabel;
@synthesize titleText;
@synthesize valueLabel;
@synthesize valueText;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    {
        navView = [[UIView alloc] init];
        navView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        [self.view addSubview:navView];
        [navView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:navView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:navView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:navView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:navView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.0 constant:70]];
        {
            {
                backButton = [UIButton buttonWithType:UIButtonTypeCustom];
                [backButton setTitle:@"Voltar" forState:UIControlStateNormal];
                [backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                [backButton addTarget:self action:@selector(onBackAction:) forControlEvents:UIControlEventTouchUpInside];
                //                backButton.backgroundColor = [UIColor redColor];
                [navView addSubview:backButton];
                [backButton setTranslatesAutoresizingMaskIntoConstraints:NO];
                [navView addConstraint:[NSLayoutConstraint constraintWithItem:backButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
                [navView addConstraint:[NSLayoutConstraint constraintWithItem:backButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeTop multiplier:0.0 constant:20]];
                [navView addConstraint:[NSLayoutConstraint constraintWithItem:backButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeWidth multiplier:1.0/3 constant:0]];
                [navView addConstraint:[NSLayoutConstraint constraintWithItem:backButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:-20]];
            }
            {
                saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
                [saveButton setTitle:@"Salvar" forState:UIControlStateNormal];
                [saveButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                [saveButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
                [saveButton addTarget:self action:@selector(onSaveAction:) forControlEvents:UIControlEventTouchUpInside];
                //                saveButton.backgroundColor = [UIColor redColor];
                [navView addSubview:saveButton];
                [saveButton setTranslatesAutoresizingMaskIntoConstraints:NO];
                [navView addConstraint:[NSLayoutConstraint constraintWithItem:saveButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
                [navView addConstraint:[NSLayoutConstraint constraintWithItem:saveButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeTop multiplier:0.0 constant:20]];
                [navView addConstraint:[NSLayoutConstraint constraintWithItem:saveButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeWidth multiplier:1.0/3 constant:0]];
                [navView addConstraint:[NSLayoutConstraint constraintWithItem:saveButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:-20]];
            }
            {
                deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
                [deleteButton setTitle:@"Deletar" forState:UIControlStateNormal];
                [deleteButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                [deleteButton addTarget:self action:@selector(onDeleteAction:) forControlEvents:UIControlEventTouchUpInside];
                //                deleteButton.backgroundColor = [UIColor redColor];
                [navView addSubview:deleteButton];
                [deleteButton setTranslatesAutoresizingMaskIntoConstraints:NO];
                [navView addConstraint:[NSLayoutConstraint constraintWithItem:deleteButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
                [navView addConstraint:[NSLayoutConstraint constraintWithItem:deleteButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeTop multiplier:0.0 constant:20]];
                [navView addConstraint:[NSLayoutConstraint constraintWithItem:deleteButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeWidth multiplier:1.0/3 constant:0]];
                [navView addConstraint:[NSLayoutConstraint constraintWithItem:deleteButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:-20]];
            }
        }
    }
    {
        topView = [[UIView alloc] init];
        topView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:topView];
        [topView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:topView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:topView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:topView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:1]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:topView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.0 constant:50]];
        {
            nameLabel = [[UILabel alloc] init];
            nameLabel.textAlignment = NSTextAlignmentCenter;
            nameLabel.text = data.title;
            //            nameLabel.backgroundColor = [UIColor redColor];
            [topView addSubview:nameLabel];
            [nameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
            [topView addConstraint:[NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15]];
            [topView addConstraint:[NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
            [topView addConstraint:[NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeTop multiplier:0.0 constant:0]];
            [topView addConstraint:[NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
        }
    }
    {
        contentView = [[UIView alloc] init];
        contentView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:contentView];
        [contentView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:1]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
        {
            titleLabel = [[UILabel alloc] init];
            titleLabel.textAlignment = NSTextAlignmentRight;
            titleLabel.textColor = [UIColor darkGrayColor];
            titleLabel.text = @"Título : ";
            //            titleLabel.backgroundColor = [UIColor redColor];
            [contentView addSubview:titleLabel];
            [titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:10]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:0.0 constant:100]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:0.0 constant:40]];
        }
        {
            titleText = [[UITextField alloc] init];
            titleText.borderStyle = UITextBorderStyleRoundedRect;
            titleText.keyboardType = UIKeyboardTypeAlphabet;
            titleText.returnKeyType = UIReturnKeyNext;
            titleText.text = data.title;
            titleText.delegate = self;
            [contentView addSubview:titleText];
            [titleText setTranslatesAutoresizingMaskIntoConstraints:NO];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:titleText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:titleLabel attribute:NSLayoutAttributeRight multiplier:1.0 constant:10]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:titleText attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:titleText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:titleLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:titleText attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:titleLabel attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
        }
        {
            valueLabel = [[UILabel alloc] init];
            valueLabel.textAlignment = NSTextAlignmentRight;
            valueLabel.textColor = [UIColor darkGrayColor];
            valueLabel.text = @"Valor : ";
            //            valueLabel.backgroundColor = [UIColor redColor];
            [contentView addSubview:valueLabel];
            [valueLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:valueLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:valueLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:valueLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:0.0 constant:100]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:valueLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:0.0 constant:40]];
        }
        {
            valueText = [[UITextField alloc] init];
            valueText.borderStyle = UITextBorderStyleRoundedRect;
            valueText.keyboardType = UIKeyboardTypeDecimalPad;
            valueText.returnKeyType = UIReturnKeyDone;
            valueText.text = [data.value stringValue];
            valueText.delegate = self;
            [contentView addSubview:valueText];
            [valueText setTranslatesAutoresizingMaskIntoConstraints:NO];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:valueText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:valueLabel attribute:NSLayoutAttributeRight multiplier:1.0 constant:10]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:valueText attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:valueText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:valueLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:valueText attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:valueLabel attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
        }
    }
    [self validate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)validate
{
    NSString* oldTitle = data.title;
    NSString* oldValue = [data.value stringValue];
    NSString* titleStr = titleText.text;
    NSString* valueStr = valueText.text;
    saveButton.enabled = titleStr.length > 0 && valueStr.length > 0 && (![oldTitle isEqualToString:titleStr] || ![oldValue isEqualToString:valueStr]);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [titleText resignFirstResponder];
    [valueText resignFirstResponder];
}

#pragma mask - Actions

- (void)onBackAction:(UIButton*)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIAlertView*)onDeleteAction:(UIButton*)button
{
    NSString* title = data.title;
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:title message:@"Deseja deletar?" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Deletar", nil];
    [alertView show];
    return alertView;
}

- (void)onSaveAction:(UIButton*)button
{
    NSInteger id = data._id;
    DayTime* day = data.day;
    NSString* titleString = titleText.text;
    double valueDouble = [[valueText.text stringByReplacingOccurrencesOfString:@"," withString:@"."] doubleValue];
    [listViewController.costModel update:id withDay:day withTitle:titleString withValue:valueDouble];
    [listViewController.costScrollView fireDataChanged];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"Deletar"]) {
        [listViewController.costModel remove:(NSInteger)data._id];
        [listViewController.costScrollView fireDataChanged];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([titleText isFirstResponder]) {
        if (titleText.text.length > 0) {
            [valueText becomeFirstResponder];
        }
        return NO;
    } else if ([valueText isFirstResponder]) {
        if (saveButton.enabled) {
            [self onSaveAction:saveButton];
        }
        return NO;
    }
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	[self onTextFieldKeyAction:textField withText:[textField.text stringByReplacingCharactersInRange:range withString:string]];
    return NO;
}

- (void)onTextFieldKeyAction:(UITextField *)textField withText:(NSString*)text
{
	textField.text = text;
	[self validate];
}

@end
