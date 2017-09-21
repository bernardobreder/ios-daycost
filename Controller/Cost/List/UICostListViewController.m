//
//  UICostListViewController.m
//  BrederApp
//
//  Created by Bernardo Breder on 22/02/14.
//  Copyright (c) 2014 Bernardo Breder. All rights reserved.
//

#import "UICostListViewController.h"
#import "UICostDetailViewController.h"
#import "UICostCreateViewController.h"
#import "UICostMonthViewController.h"
#import "UICostReportViewController.h"

@interface UICostListViewController ()

@end

@interface UICostListTaskListView ()

@end

@implementation UICostListViewController

@synthesize toolbarView;
@synthesize costScrollView;
@synthesize addButton;
@synthesize reportButton;
@synthesize monthButton;
@synthesize costModel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBar.topItem.title = @"Despesa";
    {
        toolbarView = [[UIView alloc] init];
        toolbarView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        [self.view addSubview:toolbarView];
        [toolbarView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:toolbarView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:toolbarView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:toolbarView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:toolbarView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.0 constant:70]];
        {
            {
                addButton = [UIButton buttonWithType:UIButtonTypeCustom];
                [addButton setTitle:@"Adicionar" forState:UIControlStateNormal];
                [addButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                [addButton addTarget:self action:@selector(onAddAction:) forControlEvents:UIControlEventTouchUpInside];
                //                addButton.backgroundColor = [UIColor redColor];
                [toolbarView addSubview:addButton];
                [addButton setTranslatesAutoresizingMaskIntoConstraints:NO];
                [toolbarView addConstraint:[NSLayoutConstraint constraintWithItem:addButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:toolbarView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
                [toolbarView addConstraint:[NSLayoutConstraint constraintWithItem:addButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:toolbarView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20]];
                [toolbarView addConstraint:[NSLayoutConstraint constraintWithItem:addButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:toolbarView attribute:NSLayoutAttributeWidth multiplier:1.0/3 constant:0]];
                [toolbarView addConstraint:[NSLayoutConstraint constraintWithItem:addButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:toolbarView attribute:NSLayoutAttributeHeight multiplier:0.0 constant:50]];
            }
            if (0) {
                reportButton = [UIButton buttonWithType:UIButtonTypeCustom];
                [reportButton setTitle:@"Laboratório" forState:UIControlStateNormal];
                [reportButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                [reportButton addTarget:self action:@selector(onReportAction:) forControlEvents:UIControlEventTouchUpInside];
                //                reportButton.backgroundColor = [UIColor redColor];
                [toolbarView addSubview:reportButton];
                [reportButton setTranslatesAutoresizingMaskIntoConstraints:NO];
                [toolbarView addConstraint:[NSLayoutConstraint constraintWithItem:reportButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:toolbarView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
                [toolbarView addConstraint:[NSLayoutConstraint constraintWithItem:reportButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:toolbarView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20]];
                [toolbarView addConstraint:[NSLayoutConstraint constraintWithItem:reportButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:toolbarView attribute:NSLayoutAttributeWidth multiplier:1.0/3 constant:0]];
                [toolbarView addConstraint:[NSLayoutConstraint constraintWithItem:reportButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:toolbarView attribute:NSLayoutAttributeHeight multiplier:0.0 constant:50]];
            }
            {
                monthButton = [UIButton buttonWithType:UIButtonTypeCustom];
                [monthButton setTitle:@"Mensal" forState:UIControlStateNormal];
                [monthButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                [monthButton addTarget:self action:@selector(onMonthAction:) forControlEvents:UIControlEventTouchUpInside];
                //                monthButton.backgroundColor = [UIColor redColor];
                [toolbarView addSubview:monthButton];
                [monthButton setTranslatesAutoresizingMaskIntoConstraints:NO];
                [toolbarView addConstraint:[NSLayoutConstraint constraintWithItem:monthButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:toolbarView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
                [toolbarView addConstraint:[NSLayoutConstraint constraintWithItem:monthButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:toolbarView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20]];
                [toolbarView addConstraint:[NSLayoutConstraint constraintWithItem:monthButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:toolbarView attribute:NSLayoutAttributeWidth multiplier:1.0/3 constant:0]];
                [toolbarView addConstraint:[NSLayoutConstraint constraintWithItem:monthButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:toolbarView attribute:NSLayoutAttributeHeight multiplier:0.0 constant:50]];
            }
        }
    }
    {
        costScrollView = [[UIInfinitScrollView alloc] initWithModel:self];
        [self.view addSubview:costScrollView];
        [costScrollView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:costScrollView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:costScrollView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:costScrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:toolbarView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:1]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:costScrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    }
    [self didRotateFromInterfaceOrientation: UIInterfaceOrientationPortrait];
}

- (void)reloadData
{
    [costScrollView fireDataChanged];
}

#pragma mark - Action

- (UICostCreateViewController*)onAddAction:(UIButton*)button
{
    UICostCreateViewController* createController = [[UICostCreateViewController alloc] init];
    createController.listController = self;
    UICostListTaskListView* view = (UICostListTaskListView*)[costScrollView page];
    createController.day = view.day;
    createController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:createController animated:YES completion:nil];
    return createController;
}

- (void)onReportAction:(UIButton*)button
{
    UICostReportViewController* reportController = [[UICostReportViewController alloc] init];
    reportController.listController = self;
    //    UICostListTaskListView* view = (UICostListTaskListView*)[costScrollView page];
    reportController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:reportController animated:YES completion:nil];
}

- (void)onMonthAction:(UIButton*)button
{
    UICostMonthViewController* monthController = [[UICostMonthViewController alloc] init];
    monthController.listController = self;
    UICostListTaskListView* view = (UICostListTaskListView*)[costScrollView page];
    monthController.month = view.day.monthTime;
    monthController.array = [costModel listMonth:monthController.month];
    monthController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:monthController animated:YES completion:nil];
}

#pragma mark - UIInfinitScrollView

- (UIView *)createView
{
    UICostListTaskListView* view = [[UICostListTaskListView alloc] init];
    view.costListViewController = self;
    view.costModel = costModel;
    {
        UIView* toolView = [[UIView alloc] init];
        toolView.backgroundColor = [UIColor whiteColor];
        [view addSubview:toolView];
        [toolView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [view addConstraint:[NSLayoutConstraint constraintWithItem:toolView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
        [view addConstraint:[NSLayoutConstraint constraintWithItem:toolView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
        [view addConstraint:[NSLayoutConstraint constraintWithItem:toolView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
        [view addConstraint:[NSLayoutConstraint constraintWithItem:toolView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeHeight multiplier:0.0 constant:50]];
        //        toolView.frame = CGRectMake(0, 0, 320, 50);
        
        {
            UILabel *label = view.titleLabel = [[UILabel alloc] init];
            //            label.backgroundColor = [UIColor redColor];
            label.textAlignment = NSTextAlignmentLeft;
            label.font = [UIFont boldSystemFontOfSize:18.0];
            [toolView addSubview:label];
            [label setTranslatesAutoresizingMaskIntoConstraints:NO];
            [toolView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:toolView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15]];
            [toolView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:toolView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
            [toolView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:toolView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:-15-90-10-10]];
            [toolView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:toolView attribute:NSLayoutAttributeHeight multiplier:0.0 constant:50]];
        }
        {
            UILabel* totalLabel = view.totalLabel = [[UILabel alloc] init];
            //                        totalLabel.backgroundColor = [UIColor redColor];
            totalLabel.textAlignment = NSTextAlignmentRight;
            totalLabel.font = [UIFont boldSystemFontOfSize:18.0];
            totalLabel.textColor = [UIColor lightGrayColor];
            [toolView addSubview:totalLabel];
            [totalLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
            [toolView addConstraint:[NSLayoutConstraint constraintWithItem:totalLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:toolView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10]];
            [toolView addConstraint:[NSLayoutConstraint constraintWithItem:totalLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:toolView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
            [toolView addConstraint:[NSLayoutConstraint constraintWithItem:totalLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:toolView attribute:NSLayoutAttributeWidth multiplier:0.0 constant:90]];
            [toolView addConstraint:[NSLayoutConstraint constraintWithItem:totalLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:toolView attribute:NSLayoutAttributeHeight multiplier:0.0 constant:50]];
        }
    }
    {
        UITableView* tableView = view.tableView = [[UITableView alloc] init];
        tableView.dataSource = view;
        tableView.delegate = view;
        [view addSubview:tableView];
        [tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
        [view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1.0 constant:51]];
        [view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
        [view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:-51]];
    }
    return view;
}

- (void)changeView:(UIView*)view atPage:(int)pageIndex
{
    UICostListTaskListView* item = (UICostListTaskListView*)view;
    DayTime* day = item.day = [[DayTime alloc] initNow];
    [day addDay:pageIndex];
    item.array = [self.costModel list:day];
    {
        NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd MMMM yyyy"];
        NSDate* date = [[NSDate date] dateByAddingTimeInterval:60*60*24*pageIndex];
        NSString* text = [dateFormatter stringFromDate:date];
        if ([day isToday]) {
            text = [text stringByAppendingString:@" Hoje"];
        }
        item.titleLabel.text = text;
    }
    {
        double sum = 0.0;
        for (int n = 0 ; n < item.array.count ; n++) {
            Cost* cost = [item.array objectAtIndex:n];
            sum += [cost.value doubleValue];
        }
        item.totalLabel.text = [NSString stringWithFormat: @"$%.2f", sum];
    }
    [item.tableView reloadData];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [costScrollView willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

@end

@implementation UICostListTaskListView

@synthesize costListViewController;

@synthesize day;

@synthesize costModel;

@synthesize array;

@synthesize tableView;
@synthesize titleLabel;
@synthesize totalLabel;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UICostListTaskListCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"UICostListTaskListCell"];
    if (!cell) {
        cell = [[UICostListTaskListCell alloc] init];
    }
    NSInteger index = indexPath.row;
    Cost* cost = (Cost*)[self.array objectAtIndex:index];
    cell.titleLabel.text = cost.title;
    cell.valueLabel.text = [NSString stringWithFormat: @"$%.2f", [cost.value doubleValue]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self onDetailAction:indexPath.row];
}

- (UICostDetailViewController*)onDetailAction:(int)index
{
	Cost* cost = (Cost*)[self.array objectAtIndex:index];
    UICostDetailViewController* detailController = [[UICostDetailViewController alloc] init];
    detailController.listViewController = costListViewController;
    detailController.taskListView = (UICostListTaskListView*)[self.costListViewController.costScrollView page];
    detailController.data = cost;
    detailController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self.costListViewController presentViewController:detailController animated:YES completion:nil];
	return detailController;
}

@end

@implementation UICostListTaskListCell

@synthesize titleLabel;
@synthesize valueLabel;

- (id)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UICostListTaskListCell"];
    [self setAccessibilityLabel:@"Cell"];
    {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor = [UIColor blackColor];
        //        self.titleLabel.backgroundColor = [UIColor redColor];
        [self addSubview:titleLabel];
        [self.titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:0.0 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:-15-100-10-10]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    }
    {
        self.valueLabel = [[UILabel alloc] init];
        self.valueLabel.textColor = [UIColor lightGrayColor];
        self.valueLabel.textAlignment = NSTextAlignmentRight;
        //        self.valueLabel.backgroundColor = [UIColor redColor];
        [self addSubview:self.valueLabel];
        [self.valueLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:valueLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:valueLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:valueLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.0 constant:100]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:valueLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    }
    return self;
}

@end