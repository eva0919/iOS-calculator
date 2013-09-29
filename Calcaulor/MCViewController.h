//
//  MCViewController.h
//  Calcaulor
//
//  Created by 陳昱安 on 13/9/26.
//  Copyright (c) 2013年 陳昱安. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCButton.h"

@interface MCViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *display;
//- (IBAction)buttonOf0:(id)sender;
@property (assign, nonatomic) double result;
@property (assign, nonatomic) double tempVaule;
@property (strong, nonatomic) NSString * operation;
@property (assign,nonatomic) BOOL check;
//- (IBAction)buttonOf1:(id)sender;
- (IBAction)numberButton:(UIButton *)sender;

- (IBAction)operButton:(UIButton *)sender;

- (IBAction)resetButton:(UIButton *)sender;
- (IBAction)changePNButton:(UIButton *)sender;
- (IBAction)percentButton:(UIButton *)sender;


-(void)appendDisplay:(NSString *)number;
-(void)appendDot;
-(void)calculate:(double)number1 andNumber2:(double)number2 andOper:(NSString*) oper;
@end
