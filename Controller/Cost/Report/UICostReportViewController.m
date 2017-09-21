//
//  UICostReportViewController.m
//  BrederApp
//
//  Created by Bernardo Breder on 24/02/14.
//  Copyright (c) 2014 Bernardo Breder. All rights reserved.
//

#import "UICostReportViewController.h"

@interface UICostReportViewController ()

@end

@implementation UICostReportViewController

@synthesize listController;
@synthesize navView;
@synthesize backButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    {
        navView = [[UIView alloc] init];
        navView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:navView];
        [navView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:navView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:navView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.0 constant:70]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:navView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:navView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
        {
            backButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [backButton setTitle:@"Voltar" forState:UIControlStateNormal];
            [backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [backButton addTarget:self action:@selector(onBackAction:) forControlEvents:UIControlEventTouchUpInside];
            //                backButton.backgroundColor = [UIColor redColor];
            [navView addSubview:self.backButton];
            [backButton setTranslatesAutoresizingMaskIntoConstraints:NO];
            [navView addConstraint:[NSLayoutConstraint constraintWithItem:backButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
            [navView addConstraint:[NSLayoutConstraint constraintWithItem:backButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20]];
            [navView addConstraint:[NSLayoutConstraint constraintWithItem:backButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeWidth multiplier:1.0/3 constant:0]];
            [navView addConstraint:[NSLayoutConstraint constraintWithItem:backButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeHeight multiplier:0.0 constant:50]];
        }
    }
    {
        UIScrollView* scrollView = [[UIScrollView alloc] init];
        scrollView.contentSize = CGSizeMake(1000, 1000);
        scrollView.contentOffset = CGPointMake(500, 500);
        scrollView.delegate = self;
        [self.view addSubview:scrollView];
        [scrollView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:1]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    }
    if (0) {
        UICostReportView* view = [[UICostReportView alloc] init];
        [self.view addSubview:view];
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:navView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:1]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    }
}

#pragma mask - Actions

- (void)onBackAction:(UIButton*)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mask - UIScrollViewDelegate


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"scrollViewWillEndDragging");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDecelerating");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndScrollingAnimation");
}

@end

@implementation UICostReportView

@synthesize touched;
@synthesize touches;
@synthesize views;

- (id)init
{
    self = [super init];
    self.multipleTouchEnabled = true;
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, self.bounds);
    if (touched) {
        CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
        for (int n = 0; n < touches.count ; n++) {
            UITouch* touch = [[touches allObjects] objectAtIndex:n];
            CGPoint point = [touch locationInView:self];
            CGContextFillEllipseInRect(context, CGRectMake(point.x - 20, point.y - 20, 40, 40));
        }
    }
}

- (void)touchesBegan:(NSSet *)_touches withEvent:(UIEvent *)event
{
    self.touches = _touches;
    touched = true;
    [self setNeedsDisplay];
    views = [[NSMutableArray alloc] init];
    for (int n = 0; n < touches.count ; n++) {
        CGPoint point = [[[touches allObjects] objectAtIndex:n] locationInView:self];
        UIView* view = [[UIView alloc] init];
        view.backgroundColor = [UIColor orangeColor];
        view.frame = CGRectMake(point.x, point.y + 50, 0, 0);
        [self addSubview:view];
        [views addObject:view];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        view.frame = CGRectMake(point.x - 50, point.y - 50 + 50, 100, 100);
        [UIView commitAnimations];
    }
}

- (void)touchesMoved:(NSSet *)_touches withEvent:(UIEvent *)event
{
    self.touches = _touches;
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)_touches withEvent:(UIEvent *)event
{
    for (int n = 0; n < views.count ; n++) {
        UIView* view = [views objectAtIndex:n];
        [view removeFromSuperview];
    }
    touched = false;
    touches = NULL;
    [self setNeedsDisplay];
}

@end