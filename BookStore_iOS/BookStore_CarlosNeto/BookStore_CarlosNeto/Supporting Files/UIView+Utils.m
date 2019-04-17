//
//  UIView+Utils.m
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 17/04/2019.
//  Copyright © 2019 Carlos Neto. All rights reserved.
//

#import "UIView+Utils.h"

@implementation UIView (Utils)

+(UIButton *)uiButtonWithId:(NSString*)accessibilityIdentifier
{
    __block NSMutableArray *btns = [NSMutableArray new];
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    [window subviewsWithClass:[UIButton class] with:btns];
    for (UIButton *btn in btns) {
        if ([btn hasAccessId:accessibilityIdentifier])
            return btn;
    }
    return nil;
}

-(id)subviewWithClass:(Class)aClass
{
    if ([self isKindOfClass:aClass])
        return self;
    
    for (id subview in self.subviews)
        return [subview subviewWithClass:aClass];
    
    return nil;
}

-(void)subviewsWithClass:(Class)aClass with:(NSMutableArray*)classViews
{
    if ([self isKindOfClass:aClass])
        [classViews addObject:self];
    
    for (id subview in self.subviews)
        [subview subviewsWithClass:aClass with:classViews];
}

-(BOOL)hasAccessId:(NSString*)accessibilityIdentifier
{
    NSString *selfIdentifier = self.accessibilityIdentifier;
    return accessibilityIdentifier.length && selfIdentifier.length && [accessibilityIdentifier isEqualToString:selfIdentifier];
}

@end
