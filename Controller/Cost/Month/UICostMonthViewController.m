//
//  UICostMonthViewController.m
//  BrederApp
//
//  Created by Bernardo Breder on 24/02/14.
//  Copyright (c) 2014 Bernardo Breder. All rights reserved.
//

#import "UICostMonthViewController.h"
#import "Time.h"

@interface UICostMonthViewController ()

@end

@implementation UICostMonthViewController

@synthesize listController;
@synthesize month;
@synthesize array;
@synthesize navView;
@synthesize backButton;
@synthesize topView;
@synthesize monthLabel;
@synthesize valueLabel;
@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    {
        navView = [[UIView alloc] init];
        navView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        [self.view addSubview:navView];
        [navView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:navView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:0.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:navView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:navView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:0.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:navView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.0 constant:70]];
        {
            {
                backButton = [UIButton buttonWithType:UIButtonTypeCustom];
                [backButton setTitle:@"Voltar" forState:UIControlStateNormal];
                [backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                [backButton addTarget:self action:@selector(onBackAction:) forControlEvents:UIControlEventTouchUpInside];
                //                backButton.backgroundColor = [UIColor redColor];
                [navView addSubview:self.backButton];
                [backButton setTranslatesAutoresizingMaskIntoConstraints:NO];
                [navView addConstraint:[NSLayoutConstraint constraintWithItem:backButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeLeft multiplier:0.0 constant:0]];
                [navView addConstraint:[NSLayoutConstraint constraintWithItem:backButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeTop multiplier:0.0 constant:20]];
                [navView addConstraint:[NSLayoutConstraint constraintWithItem:backButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeWidth multiplier:1.0/3 constant:0]];
                [navView addConstraint:[NSLayoutConstraint constraintWithItem:backButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeHeight multiplier:0.0 constant:50]];
            }
        }
        
    }
    {
        topView = [[UIView alloc] init];
        topView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:self.topView];
        [topView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:topView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:topView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:topView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:1]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:topView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.0 constant:50]];
        {
            monthLabel = [[UILabel alloc] init];
            monthLabel.textColor = [UIColor blackColor];
            monthLabel.font = [UIFont boldSystemFontOfSize:20.0];
//            monthLabel.backgroundColor = [UIColor redColor];
            NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"MMMM yyyy"];
            NSString* text = [dateFormatter stringFromDate:[self.month.firstDayTime toDate]];
            monthLabel.text = text;
            [topView addSubview:monthLabel];
            [monthLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
            [topView addConstraint:[NSLayoutConstraint constraintWithItem:monthLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeLeft multiplier:0.0 constant:15]];
            [topView addConstraint:[NSLayoutConstraint constraintWithItem:monthLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeTop multiplier:0.0 constant:0]];
            [topView addConstraint:[NSLayoutConstraint constraintWithItem:monthLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:-35]];
            [topView addConstraint:[NSLayoutConstraint constraintWithItem:monthLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
        }
        {
            valueLabel = [[UILabel alloc] init];
            valueLabel.textColor = [UIColor lightGrayColor];
            valueLabel.font = [UIFont boldSystemFontOfSize:20.0];
            valueLabel.textAlignment = NSTextAlignmentRight;
//            valueLabel.backgroundColor = [UIColor redColor];
            double sum = 0;
            for (int n = 0 ; n < self.array.count ; n++) {
                Cost* cost = (Cost*)[self.array objectAtIndex:n];
                sum += [cost.value doubleValue];
            }
            int numberOfDays = 0;
            {
                DayTime* day = self.month.firstDayTime;
                DayTime* now = [[DayTime alloc] initNow];
                int days = [DayTime lastDayOfMonth:self.month.month andYear:self.month.year];
                for (int n = 0 ; n < days ; n++) {
                    if ([day compare:now] <= 0) {
                        numberOfDays++;
                    } else {
                        break;
                    }
                    [day addDay:1];
                }
            }
            double mid = sum / numberOfDays;
            valueLabel.text = [NSString stringWithFormat: @"$%.2f / $%.2f", mid, sum];
            [topView addSubview:valueLabel];
            [valueLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
            [topView addConstraint:[NSLayoutConstraint constraintWithItem:valueLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10]];
            [topView addConstraint:[NSLayoutConstraint constraintWithItem:valueLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeTop multiplier:0.0 constant:0]];
            [topView addConstraint:[NSLayoutConstraint constraintWithItem:valueLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0]];
            [topView addConstraint:[NSLayoutConstraint constraintWithItem:valueLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
        }
        
    }
    {
        tableView = [[UITableView alloc] init];
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        [tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:1]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    }
//    [self didRotateFromInterfaceOrientation: UIInterfaceOrientationPortrait];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
//{
//    CGRect frame = self.view.bounds;
//    CGSize size = frame.size;
//    CGPoint pont = frame.origin;
//    {
//        pont = CGPointMake(0, 0);
//        navView.frame = CGRectMake(0, pont.y, size.width, 70);
//        pont.y += 71;
//        size.height -= 71;
//        topView.frame = CGRectMake(0, pont.y, size.width, 50);
//        pont.y += 51;
//        size.height -= 51;
//        tableView.frame = CGRectMake(0, pont.y, size.width, size.height);
//        {
//            size = self.navView.frame.size;
//            pont = CGPointMake(0, 0);
//            double div3 = (size.width / 3);
//            backButton.frame = CGRectMake(0, 20, div3, size.height - 20);
//        }
//        {
//            size = self.topView.frame.size;
//            pont = CGPointMake(0, 0);
//            double div3 = (size.width / 3);
//            monthLabel.frame = CGRectMake(15, 0, 2 * div3 - 20, size.height);
//            valueLabel.frame = CGRectMake(2 * div3 + 5, 0, div3 - 15, size.height);
//        }
//    }
//}

#pragma mask - Actions

- (void)onBackAction:(UIButton*)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mask - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DayTime* day = self.month.firstDayTime;
    [day addDay:section];
    int time = day.time;
    int count = self.array.count;
    int result = 0;
    for (int n = 0; n < count ; n++) {
        Cost* cost = [self.array objectAtIndex:n];
        if (cost.day.time == time) {
            result++;
        }
    }
    return result;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UICostListTaskListCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"UICostListTaskListCell"];
    if (!cell) {
        cell = [[UICostListTaskListCell alloc] init];
    }
    DayTime* day = self.month.firstDayTime;
    [day addDay:indexPath.section];
    NSInteger index = indexPath.row;
    int time = day.time;
    int count = self.array.count;
    Cost* cost;
    for (int n = 0; n < count ; n++) {
        cost = [self.array objectAtIndex:n];
        if (cost.day.time == time) {
            if (index == 0) {
                break;
            } else {
                index--;
            }
        }
    }
    cell.titleLabel.text = cost.title;
    cell.valueLabel.text = [NSString stringWithFormat: @"$%.2f", [cost.value doubleValue]];
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.month lastDayOfMonth];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    DayTime* day = self.month.firstDayTime;
    [day addDay:section];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd MMMM yyyy"];
    return [dateFormatter stringFromDate:[day toDate]];
}

@end
