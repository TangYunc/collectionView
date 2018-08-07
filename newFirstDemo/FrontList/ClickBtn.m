//
//  ClickBtn.m
//  SingleModel
//
//  Created by Long on 2017/12/25.
//  Copyright © 2017年 zgjzd. All rights reserved.
//

#import "ClickBtn.h"
#define PUBLICBTNTAG 10010
#define PUBLICLINETAG 22222
@interface ClickBtn()

@end

@implementation ClickBtn

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(id)initWithCodeList:(NSArray *)arr drawRect:(CGRect)frame
{
    self = [super initWithFrame:frame];
    _titlesArray = [NSMutableArray array];
    _titlesArray = arr;
    [self determinethetopNode];
    return self;
}

-(void)determinethetopNode
{
    switch (_titlesArray.count) {
        case 1:
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(self.frame.origin.x, 0, self.frame.size.width, self.frame.size.height-5);
            [button setBackgroundColor:[UIColor whiteColor]];
            button.tag = 1234;
            [button setTitle:_titlesArray[0] forState:UIControlStateNormal];
//            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(performSlectoreClickAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            UIView *line = [UIView new];
            line.backgroundColor = [UIColor whiteColor];
            line.frame = CGRectMake(self.frame.origin.x, button.frame.size.height, button.frame.size.width, 5);
            [self addSubview:line];
        }
            break;
        case 2:
        {
            UIView *line = [UIView new];
            line.tag = PUBLICLINETAG;
            line.backgroundColor = [UIColor blueColor];
            line.frame = CGRectMake(self.frame.origin.x, self.frame.size.height-5, self.frame.size.width/2, 5);
            [self addSubview:line];
            
            for (int a = 0 ; a < 2; a ++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                [button setBackgroundColor:[UIColor whiteColor]];
                button.tag = PUBLICBTNTAG + a;
                if (a == 0) {
                    button.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width/2, self.frame.size.height-5);
                    [button setTitle:_titlesArray[a] forState:UIControlStateNormal];
                    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                    [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
                }else{
                    button.frame = CGRectMake(self.frame.size.width/2, self.frame.origin.y, self.frame.size.width/2, self.frame.size.height-5);
                    [button setTitle:_titlesArray[a] forState:UIControlStateNormal];
                    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
                }
                [button addTarget:self action:@selector(performSlectoreClickAction:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:button];
            }
        }
            break;
        case 3:
        {
            UIView *line = [UIView new];
            line.tag = PUBLICLINETAG;
            line.backgroundColor = [UIColor blueColor];
            line.frame = CGRectMake(self.frame.origin.x, self.frame.size.height-5, self.frame.size.width/3, 5);
            [self addSubview:line];
            for (int a = 0 ; a < 3; a ++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                [button setBackgroundColor:[UIColor whiteColor]];

                button.tag = PUBLICBTNTAG + a;
                if (a == 0) {
                    button.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width/3, self.frame.size.height-5);
                    [button setTitle:_titlesArray[a] forState:UIControlStateNormal];
                    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                    [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];

                }else if (a == 1){
                    button.frame = CGRectMake(self.frame.size.width/3, self.frame.origin.y, self.frame.size.width/3, self.frame.size.height-5);
                    [button setTitle:_titlesArray[a] forState:UIControlStateNormal];
                    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
                }else{
                    button.frame = CGRectMake(self.frame.size.width*2/3, self.frame.origin.y, self.frame.size.width/3, self.frame.size.height-5);
                    [button setTitle:_titlesArray[a] forState:UIControlStateNormal];
                    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
                }
                [button addTarget:self action:@selector(performSlectoreClickAction:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:button];
            }
        }
            break;
        default:
            break;
    }
}

-(void)performSlectoreClickAction:(UIButton *)sender
{
    if (sender.tag == 1234) {
        return;
    }
    NSLog(@"sender:%@",sender);
    for (int i = 0; i < _titlesArray.count; i++) {
        UIButton *btn = (UIButton *)[[sender superview]viewWithTag:PUBLICBTNTAG + i];
        [btn setSelected:NO];
        if (btn.tag == PUBLICBTNTAG) {
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
    UIButton *button = (UIButton *)sender;
    [button setSelected:YES];
    UIView *views = (UIView *)[self viewWithTag:PUBLICLINETAG];
    views.frame = CGRectMake(button.frame.origin.x, self.frame.size.height-5, self.frame.size.width/_titlesArray.count, 5);
    if (_delegate && [_delegate respondsToSelector:@selector(proxyflowUnification:)]) {
        [_delegate proxyflowUnification:(int)button.tag-PUBLICBTNTAG];
    }
}

-(void)setupthePlan:(int)page
{
    for (int i = 0; i < _titlesArray.count; i++) {
        UIButton *btn = (UIButton *)[self viewWithTag:PUBLICBTNTAG + i];
        [btn setSelected:NO];
        if (btn.tag == PUBLICBTNTAG) {
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
    UIButton *button = (UIButton *)[self viewWithTag:PUBLICBTNTAG + page];
    [button setSelected:YES];
    UIView *views = (UIView *)[self viewWithTag:PUBLICLINETAG];
    views.frame = CGRectMake(button.frame.origin.x, self.frame.size.height-5, self.frame.size.width/_titlesArray.count, 5);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
