
//
//  Created by Gowri Sammandhamoorthy on 4/1/16.
//  Copyright © 2016 Gowri Sammandhamoorthy. All rights reserved.
//



#import "GSCalendarViewController.h"

@implementation GSCalendarViewController

#pragma mark - View lifecycle

- (void)loadView {
    CGRect applicationFrame = [[UIScreen mainScreen] bounds];
    _calendarView = [[GSCalendarView alloc] initWithFrame:applicationFrame];
//    [_calendarView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [_calendarView setSeparatorStyle:GSCalendarViewDayCellSeparatorTypeHorizontal];
    [_calendarView setBackgroundColor:[UIColor whiteColor]];
    [_calendarView setDelegate:self];
    self.view = _calendarView;
   
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = NO;
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([self clearsSelectionOnViewWillAppear]) {
        [[self calendarView] deselectDayCellAtIndex:[[self calendarView] indexForSelectedDayCell] animated:YES];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = YES;

}

- (IBAction)exitButton:(id)sender {
    exit(0);
}
@end
