//
//  AppDelegate.h
//  BrederApp
//
//  Created by Bernardo Breder on 22/02/14.
//  Copyright (c) 2014 Bernardo Breder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CostModel.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) CostModel* costModel;

@end
