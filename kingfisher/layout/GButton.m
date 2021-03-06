//
//  GUButton.m
//  layout
//
//  Created by jianbai on 14-9-4.
//  Copyright (c) 2014年 baobao. All rights reserved.
//

#import "GButton.h"
#import "UIView+MathLayout.h"
#import "UIColor+HexString.h"
#import "UIFont+Unit.h"
#import "GImageFetcher.h"
#import "ScreenUnit.h"

@implementation GButton

-(void)layoutSubviews{
    [super layoutSubviews];
    [self layoutWithMathExpression];
}


- (GButton*)initWithAttributes:(NSDictionary *)attrs {
    self = [GButton buttonWithType:UIButtonTypeCustom];
    if (self) {
        [self updateViewFromAttributes:attrs];
    }
    return self;
}

- (void)updateViewFromAttributes:(NSDictionary *)attrs {
    [super updateViewFromAttributes:attrs];
    NSString *paddingString = [attrs objectForKey:@"padding"];
    if (paddingString != nil) {
        CGFloat padding = [paddingString floatValue];
       self.imageEdgeInsets = UIEdgeInsetsMake(padding, padding, padding, padding);
    }
    UIEdgeInsets padding = self.imageEdgeInsets;
    NSString *paddingTopString = [attrs objectForKey:@"paddingTop"];
    NSString *paddingLeftString = [attrs objectForKey:@"paddingLeft"];
    NSString *paddingBottomString = [attrs objectForKey:@"paddingBottom"];
    NSString *paddingRightString = [attrs objectForKey:@"paddingRight"];
    if ([paddingTopString length] > 0) {
        padding.top = [paddingTopString floatValue];
    }
    if ([paddingLeftString length] > 0){
        padding.left = [paddingLeftString floatValue];
    }
    if ([paddingBottomString length] > 0){
        padding.bottom = [paddingBottomString floatValue];
    }
    if ([paddingRightString length] > 0){
        padding.right = [paddingRightString floatValue];
    }
     self.imageEdgeInsets = padding;
    
    NSString* imageUrl = [attrs objectForKey:@"imageUrl"];
    if (imageUrl != nil) {
        [[GImageFetcher shareFetcher] loadImage:imageUrl view:self];
    }
    
    NSString* selectedImageUrl = [attrs objectForKey:@"highlightedImageUrl"];
    if (selectedImageUrl != nil) {
        [[GImageFetcher shareFetcher] loadImage:selectedImageUrl view:self];
    }
    
    NSString *text = [attrs objectForKey:@"text"];
    if (text != nil){
        [self setTitle:text forState:UIControlStateNormal];
    }
    NSString *textColor = [attrs objectForKey:@"textColor"];
    if (textColor != nil) {
         [self setTitleColor:[UIColor colorWithHexString:textColor] forState:UIControlStateNormal];
    }
    NSString* highlightedTextColor = [attrs objectForKey:@"highlightedTextColor"];
    if (highlightedTextColor != nil) {
        UIColor* color = [UIColor colorWithHexString:textColor];
        [self setTitleColor:color forState:UIControlStateHighlighted];
        [self setTitleColor:color forState:UIControlStateSelected];
    }
    
    
    NSString* fontStyle = [attrs objectForKey:@"fontStyle"];
    NSString *fontName = [attrs objectForKey:@"font"];
    NSString *textSize = [attrs objectForKey:@"textSize"];
    if (textSize != nil
        ||  fontName != nil
        || fontStyle != nil) {
         CGFloat size = self.titleLabel.font.pointSize;
        if (textSize != nil) size = [ScreenUnit toTextSize:textSize];
        self.titleLabel.font = [UIFont fontWithStyle:fontStyle name: fontName size:size];
    }
    
    UILabel* titleLabel = [self titleLabel];
    if (titleLabel == nil) {
        return;
    }
    NSString* alignment = [attrs objectForKey:@"textAlignment"];
    if (alignment != nil) {
        NSTextAlignment textAlignment = NSTextAlignmentLeft;
        if ([alignment isEqualToString:@"left"]) {
            textAlignment = NSTextAlignmentLeft;
        }else if ([alignment isEqualToString:@"center"]){
            textAlignment = NSTextAlignmentCenter;
        }else if ([alignment isEqualToString:@"right"]){
            textAlignment = NSTextAlignmentRight;
        }
        titleLabel.textAlignment = textAlignment;
    }
    
    
    NSString *numberOfLines= [attrs objectForKey:@"numberOfLines"];
    if (numberOfLines != nil) {
        titleLabel.numberOfLines = [numberOfLines integerValue];
    }
    
    NSString*  lineBreakModeString = [attrs objectForKey:@"lineBreakMode"];
    if (lineBreakModeString != nil) {
        NSLineBreakMode lineBreakMode = NSLineBreakByWordWrapping;
        if ([lineBreakModeString isEqualToString:@"wordWrap"]) {
            lineBreakMode = NSLineBreakByWordWrapping;
        }else if ([lineBreakModeString isEqualToString:@"charWrap"]) {
            lineBreakMode = NSLineBreakByCharWrapping;
        }else if ([lineBreakModeString isEqualToString:@"clip"]) {
            lineBreakMode = NSLineBreakByClipping;
        }else if ([lineBreakModeString isEqualToString:@"head"]) {
            lineBreakMode = NSLineBreakByTruncatingHead;
        }else if ([lineBreakModeString isEqualToString:@"tail"]) {
            lineBreakMode = NSLineBreakByTruncatingTail;
        }else if ([lineBreakModeString isEqualToString:@"middle"]) {
            lineBreakMode = NSLineBreakByTruncatingMiddle;
        }
        titleLabel.lineBreakMode = lineBreakMode;
    }
}



@end
