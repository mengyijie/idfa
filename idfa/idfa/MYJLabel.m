//
//  MYJLabel.m
//  idfa
//
//  Created by mengyijie on 16/10/17.
//  Copyright © 2016年 mengyijie. All rights reserved.
//

#import "MYJLabel.h"

@implementation MYJLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.textAlignment = NSTextAlignmentCenter;
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(copyAction:)];
        longPress.minimumPressDuration = 1.0;
        [self addGestureRecognizer:longPress];
    }
    return self;
}
- (BOOL)canBecomeFirstResponder
{
    return YES;
}
- (void)copyAction:(UILongPressGestureRecognizer *)gesture{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        UIMenuController *menu = [UIMenuController sharedMenuController];
        self.backgroundColor = [UIColor colorWithRed:0.79 green:0.87 blue:0.93 alpha:1.00f];
        [menu setTargetRect:self.frame inView:self.superview];
        [menu setMenuVisible:YES animated:YES];
    }
}
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (action == @selector(cut:)){
        return NO;
    }
    else if(action == @selector(copy:)){
        return YES;
    }
    else if(action == @selector(paste:)){
        return NO;
    }
    else if(action == @selector(select:)){
        return NO;
    }
    else if(action == @selector(selectAll:)){
        return NO;
    }
    else
    {
        return [super canPerformAction:action withSender:sender];
    }
}
- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
- (void)copy:(id)sender {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:self.text];
}


@end
