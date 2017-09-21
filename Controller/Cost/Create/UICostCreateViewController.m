//
//  UICostCreateViewController.m
//  BrederApp
//
//  Created by Bernardo Breder on 22/02/14.
//  Copyright (c) 2014 Bernardo Breder. All rights reserved.
//

#import "UICostCreateViewController.h"

@interface UICostCreateViewController ()

@end

@implementation UICostCreateViewController

@synthesize listController;
@synthesize day;
@synthesize navView;
@synthesize topView;
@synthesize dateLabel;
@synthesize contentView;
@synthesize titleLabel;
@synthesize titleText;
@synthesize valueLabel;
@synthesize valueText;
@synthesize addButton;
@synthesize cancelButton;

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
            cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [cancelButton setTitle:@"Cancelar" forState:UIControlStateNormal];
            [cancelButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [cancelButton addTarget:self action:@selector(onCancelAction:) forControlEvents:UIControlEventTouchUpInside];
            //            cancelButton.backgroundColor = [UIColor redColor];
            [navView addSubview:cancelButton];
            [cancelButton setTranslatesAutoresizingMaskIntoConstraints:NO];
            [navView addConstraint:[NSLayoutConstraint constraintWithItem:cancelButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
            [navView addConstraint:[NSLayoutConstraint constraintWithItem:cancelButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeTop multiplier:0.0 constant:20]];
            [navView addConstraint:[NSLayoutConstraint constraintWithItem:cancelButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeWidth multiplier:1.0/3 constant:0]];
            [navView addConstraint:[NSLayoutConstraint constraintWithItem:cancelButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:-20]];
        }
        {
            addButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [addButton setTitle:@"Adicionar" forState:UIControlStateNormal];
            [addButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [addButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
            [addButton addTarget:self action:@selector(onAddAction:) forControlEvents:UIControlEventTouchUpInside];
            //            addButton.backgroundColor = [UIColor redColor];
            [navView addSubview:addButton];
            [addButton setTranslatesAutoresizingMaskIntoConstraints:NO];
            [navView addConstraint:[NSLayoutConstraint constraintWithItem:addButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
            [navView addConstraint:[NSLayoutConstraint constraintWithItem:addButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeTop multiplier:0.0 constant:20]];
            [navView addConstraint:[NSLayoutConstraint constraintWithItem:addButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeWidth multiplier:1.0/3 constant:0]];
            [navView addConstraint:[NSLayoutConstraint constraintWithItem:addButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:-20]];
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
            dateLabel = [[UILabel alloc] init];
            dateLabel.textAlignment = NSTextAlignmentCenter;
            dateLabel.font = [UIFont boldSystemFontOfSize:20.0];
            NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"dd MMMM yyyy"];
            NSString* text = [dateFormatter stringFromDate:[self.day toDate]];
            dateLabel.text = text;
            [topView addSubview:dateLabel];
            [dateLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
            [topView addConstraint:[NSLayoutConstraint constraintWithItem:dateLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15]];
            [topView addConstraint:[NSLayoutConstraint constraintWithItem:dateLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
            [topView addConstraint:[NSLayoutConstraint constraintWithItem:dateLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeTop multiplier:0.0 constant:0]];
            [topView addConstraint:[NSLayoutConstraint constraintWithItem:dateLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
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
            titleLabel.text = @"Título :";
            titleLabel.textAlignment = NSTextAlignmentRight;
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
            valueLabel.text = @"Valor :";
            valueLabel.textAlignment = NSTextAlignmentRight;
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
            valueText.delegate = self;
            if (0) {
                UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.window.frame.size.width, 44.0f)];
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                    toolBar.tintColor = [UIColor colorWithRed:0.6f
                                                        green:0.6f
                                                         blue:0.64f
                                                        alpha:1.0f];
                }
                else
                {
                    toolBar.tintColor = [UIColor colorWithRed:0.56f
                                                        green:0.59f
                                                         blue:0.63f
                                                        alpha:1.0f];
                }
                toolBar.translucent = NO;
//                toolBar.intrinsicContentSize = CGSizeMake(100, 44);
                NSMutableArray* array = [[NSMutableArray alloc] init];
                {
                    UIBarButtonItem* button = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(onCancelAction:)];
                    button.customView.frame = CGRectMake(0, 0, 144, 44);
                    [array addObject:button];
                }
                [array addObject:[[UIBarButtonItem alloc] initWithTitle:@"-" style:UIBarButtonItemStyleBordered target:self action:@selector(onCancelAction:)]];
                [array addObject:[[UIBarButtonItem alloc] initWithTitle:@"*" style:UIBarButtonItemStyleBordered target:self action:@selector(onCancelAction:)]];
                [array addObject:[[UIBarButtonItem alloc] initWithTitle:@"/" style:UIBarButtonItemStyleBordered target:self action:@selector(onCancelAction:)]];
                [array addObject:    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
                toolBar.items = array;
                valueText.inputAccessoryView = toolBar;
            }
            [contentView addSubview:valueText];
            [valueText setTranslatesAutoresizingMaskIntoConstraints:NO];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:valueText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:valueLabel attribute:NSLayoutAttributeRight multiplier:1.0 constant:10]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:valueText attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:valueText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:valueLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
            [contentView addConstraint:[NSLayoutConstraint constraintWithItem:valueText attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:valueLabel attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
        }
    }
    [titleText becomeFirstResponder];
    [self validate];
}

//-(IBAction)barButtonAddText:(UIBarButtonItem*)sender
//{
//    if (self.textField.isFirstResponder)
//    {
//        [self.textField insertText:sender.title];
//    }
//    else if (self.alertTextField.isFirstResponder)
//    {
//        [self.alertTextField insertText:sender.title];
//    }
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [titleText resignFirstResponder];
    [valueText resignFirstResponder];
}

#pragma mark - Action

- (void)onAddAction:(UIButton*)button
{
    NSString* title = titleText.text;
    double value = [[valueText.text stringByReplacingOccurrencesOfString:@"," withString:@"."] doubleValue];
    [self.listController.costModel create:self.day withTitle:title withValue:value];
    [self.listController reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onCancelAction:(UIButton*)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)validate
{
    NSString* titleStr = titleText.text;
    NSString* valueStr = valueText.text;
    addButton.enabled = titleStr.length > 0 && valueStr.length > 0;
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
        if (addButton.enabled) {
            [self onAddAction:addButton];
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
