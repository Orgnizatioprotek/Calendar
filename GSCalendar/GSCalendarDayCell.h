
//
//  Created by Gowri Sammandhamoorthy on 4/1/16.
//  Copyright © 2016 Gowri Sammandhamoorthy. All rights reserved.
//



#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GSCalendarDayCellSelectionStyle) {
    GSCalendarDayCellSelectionStyleNone,
    GSCalendarDayCellSelectionStyleDefault,
};

@interface GSCalendarDayCell : UIView

/**
 * A string used to identify a day cell that is reusable. (read-only)
 */
@property(nonatomic, readonly, copy) NSString *reuseIdentifier;

/**
 * Returns the label used for the main textual content of the day cell. (read-only)
 */
@property (nonatomic, readonly) UILabel *textLabel;

/**
 * Returns the content view of the day cell object. (read-only)
 */
@property (nonatomic, readonly) UIView *contentView;

/**
 * The view used as the background of the day cell.
 */
@property (nonatomic, strong) UIView *backgroundView;

/**
 * The view used as the background of the day cell when it is selected.
 */
@property (nonatomic, strong) UIView *selectedBackgroundView;

/**
 * The style of selection for a cell.
 */
@property(nonatomic) GSCalendarDayCellSelectionStyle selectionStyle;

/**
 * A Boolean value that indicates whether the cell is selected.
 */
@property(nonatomic, getter = isSelected) BOOL selected;

/**
 * A Boolean value that indicates whether the cell is highlighted.
 */
@property(nonatomic, getter = isHighlighted) BOOL highlighted;

/**
 * Initializes a day cell with a reuse identifier and returns it to the caller.
 */
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;

/**
 * Sets the selected state of the cell, optionally animating the transition between states.
 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;

/**
 * Sets the highlighted state of the cell, optionally animating the transition between states.
 */
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated;

/**
 * Prepares a reusable day cell for reuse by the calendar view.
 */
- (void)prepareForReuse;

@end
