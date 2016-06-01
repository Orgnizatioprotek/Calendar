
//
//  Created by Gowri Sammandhamoorthy on 4/1/16.
//  Copyright © 2016 Gowri Sammandhamoorthy. All rights reserved.
//

#import "GSCalendarDayCell.h"

@interface GSCalendarDayCell() {
    BOOL _selected;
    BOOL _highlighted;
}

@end

@implementation GSCalendarDayCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super init];
    if (self) {
        _reuseIdentifier = [reuseIdentifier copy];
        _selectionStyle = GSCalendarDayCellSelectionStyleDefault;
        
        _backgroundView = [[UIView alloc] init];
        [_backgroundView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_backgroundView];
        
        _selectedBackgroundView = [[UIView alloc] init];
        [_selectedBackgroundView setBackgroundColor:[UIColor lightGrayColor]];
        [_selectedBackgroundView setAlpha:0];
        [self addSubview:_selectedBackgroundView];
        
        _contentView = [[UIView alloc] init];
        [_contentView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_contentView];
        
        _textLabel = [[UILabel alloc] init];
        [_textLabel setTextColor:[UIColor blackColor]];
        [_textLabel setHighlightedTextColor:[UIColor whiteColor]];
        [_textLabel setBackgroundColor:[UIColor clearColor]];
        [_textLabel setFont:[UIFont systemFontOfSize:20]];
        [_contentView addSubview:_textLabel];
    }
    return self;
}

- (id)init {
    return [self initWithReuseIdentifier:@""];
}

- (void)layoutSubviews {
    CGSize frameSize = self.frame.size;
    CGSize titleSize = [[self textLabel] sizeThatFits:CGSizeMake(frameSize.width, frameSize.height)];
    
    [[self backgroundView] setFrame:self.bounds];
    [[self selectedBackgroundView] setFrame:self.bounds];
    [[self contentView] setFrame:self.bounds];
    
    [[self textLabel] setFrame:CGRectMake(roundf(frameSize.width / 2 - titleSize.width / 2),
                                           roundf(frameSize.height / 2 - titleSize.height / 2),
                                           titleSize.width, titleSize.height)];
}

#pragma mark - Selection

- (BOOL)isSelected {
    return _selected;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    if (selected == _selected) {
        return;
    }
    
    _selected = selected;
    _highlighted = NO;
    
    if ([self selectionStyle] != GSCalendarDayCellSelectionStyleNone) {
        __weak GSCalendarDayCell *weakSelf = self;
        
        void (^block)() = ^{
            if (selected) {
                [[weakSelf backgroundView] setAlpha:0.0f];
                [[weakSelf selectedBackgroundView] setAlpha:1.0f];
            } else {
                [[weakSelf backgroundView] setAlpha:1.0f];
                [[weakSelf selectedBackgroundView] setAlpha:0.0f];
            }
            for (id subview in [[weakSelf contentView] subviews]) {
                if ([subview respondsToSelector:@selector(setHighlighted:)]) {
                    [subview setHighlighted:selected];
                }
            }
        };
        
        if (animated) {
            [UIView animateWithDuration:0.25f animations:block];
        } else {
            block();
        }
    }
}

- (void)setSelected:(BOOL)selected {
    [self setSelected:selected animated:NO];
}

- (BOOL)isHighlighted {
    return _highlighted;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    if (highlighted == _highlighted) {
        return;
    }
    
    _highlighted = highlighted;
    _selected = NO;
    
    if ([self selectionStyle] != GSCalendarDayCellSelectionStyleNone) {
        __weak GSCalendarDayCell *weakSelf = self;
        
        void (^block)() = ^{
            if (highlighted) {
                [[weakSelf backgroundView] setAlpha:0.0f];
                [[weakSelf selectedBackgroundView] setAlpha:1.0f];
            } else {
                [[weakSelf backgroundView] setAlpha:1.0f];
                [[weakSelf selectedBackgroundView] setAlpha:0.0f];
            }
            for (id subview in [[weakSelf contentView] subviews]) {
                if ([subview respondsToSelector:@selector(setHighlighted:)]) {
                    [subview setHighlighted:highlighted];
                }
            }
        };
        
        if (animated) {
            [UIView animateWithDuration:0.25f animations:block];
        } else {
            block();
        }
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    [self setHighlighted:highlighted animated:NO];
}

#pragma mark - Cell reuse

- (void)prepareForReuse {
    [self setSelected:NO];
    [self setHighlighted:NO];
    
    [[self textLabel] setText:@""];
}

@end
