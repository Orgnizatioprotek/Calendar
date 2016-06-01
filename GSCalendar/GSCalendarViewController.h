
//  Created by Gowri Sammandhamoorthy on 4/1/16.
//  Copyright © 2016 Gowri Sammandhamoorthy. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "GSCalendarView.h"

@interface GSCalendarViewController : UIViewController <GSCalendarViewDelegate>

// Returns the calendar view managed by the controller object.
@property (nonatomic, strong) GSCalendarView *calendarView;

// A Boolean value indicating if the controller clears the selection when the calendar appears.
@property (nonatomic) BOOL clearsSelectionOnViewWillAppear;

- (IBAction)exitButton:(id)sender;
@end
