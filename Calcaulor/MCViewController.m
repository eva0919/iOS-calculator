//
//  MCViewController.m
//  Calcaulor
//
//  Created by 陳昱安 on 13/9/26.
//  Copyright (c) 2013年 陳昱安. All rights reserved.
//

#import "MCViewController.h"



@interface MCViewController ()

@end

@implementation MCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.result = 0.0;
    self.operation = @"";
    self.check = NO;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)numberButton:(UIButton *)sender {
//    UIButton *button=(UIButton*)sender ;
//    NSLog([@(button.tag) stringValue]);
    if(self.check){
        self.display.text = @"0" ;
    }
    if(sender.tag == 10){
            [self appendDot];
            self.check = NO;
    }
    else{
            [self appendDisplay:[@(sender.tag) stringValue]];
            self.check = NO;
    }
    
    
}

- (IBAction)operButton:(UIButton *)sender {
    if (sender.tag == 0 ) {
        if ( ![self.operation isEqualToString:@""]) {
            double tempdouble = [self.display.text doubleValue];
            if([[self.display.text componentsSeparatedByString:@"%"] count] > 1)
            {
                double n = [[self.display.text componentsSeparatedByString:@"%"] count] -1 ;
                double tempresult = pow(100.0, n);
                 tempdouble = [self.display.text doubleValue] / tempresult;
            }
            
            [self calculate:self.result andNumber2:tempdouble andOper:self.operation];
            
        }
        self.check = YES;
    }
    else{
        if ( ![self.operation isEqualToString:@""]) {
            if(!self.check)
            {
            [self calculate:self.result andNumber2:[self.display.text doubleValue] andOper:self.operation];
            
            }
        }
        
        if([[self.display.text componentsSeparatedByString:@"%"] count] > 1)
        {
            double n = [[self.display.text componentsSeparatedByString:@"%"] count] -1 ;
            double tempresult = pow(100.0, n);
            self.result = [self.display.text doubleValue] / tempresult;
        }
        else{
            self.result = [self.display.text doubleValue];
        }
        if (sender.tag == 1) {
            self.operation = @"+";
        }
        else if(sender.tag == 2) {
            self.operation = @"-";
        }
        else if(sender.tag == 3) {
            self.operation = @"*";
        }
        else if(sender.tag == 4) {
            self.operation = @"/";
        }
        self.check = YES;
    }
}

- (IBAction)resetButton:(UIButton *)sender {
    self.result = 0.0;
    self.operation = @"";
    
    self.display.text = [@(self.result) stringValue];
    self.check = NO;
}

- (IBAction)changePNButton:(UIButton *)sender {
    if(self.check)
    {
        self.display.text = @"0";
        self.check = NO;
    }
    if( !( [self.display.text rangeOfString:@"-"].length ))
    {
        self.display.text = [@"-" stringByAppendingString:self.display.text];
    }
    else{
        self.display.text = [self.display.text substringFromIndex:1];
    }

}

- (IBAction)percentButton:(UIButton *)sender {
    if(!self.check)
    {
        if(self.display.text.length < 10){
            self.display.text = [self.display.text stringByAppendingString:@"%"];
        }
    }
}

// **************                    *******************
// **************    tool Method     *******************
// **************                    *******************
-(void)appendDisplay:(NSString *)number {
    if ( [self.display.text isEqualToString:@"0"] ) {
        self.display.text = number ;
    }
    else if ( [self.display.text isEqualToString:@"-0"] ) {
        self.display.text = [@"-" stringByAppendingString:number] ;
    }
    else{
        if (self.display.text.length < 10) {
            self.display.text = [self.display.text stringByAppendingString:number];
        }
        
    }
}
-(void)appendDot{
    if( !( [self.display.text rangeOfString:@"."].length ))
    {
        self.display.text = [self.display.text stringByAppendingString:@"."];
    }
}
-(void)calculate:(double)number1 andNumber2:(double)number2 andOper:(NSString*) oper {
    if ([oper isEqualToString:@"+"])
    {
        self.result = number1 + number2;
        self.display.text = [@(self.result) stringValue];
    }
    else if ([oper isEqualToString:@"-"])
    {
        self.result = number1 - number2;
        self.display.text = [@(self.result) stringValue];
    }
    else if ([oper isEqualToString:@"*"])
    {
        self.result = number1 * number2;
        self.display.text = [@(self.result) stringValue];
    }
    else if ([oper isEqualToString:@"/"])
    {
        self.result = number1 / number2;
        NSString * temp = [@(self.result) stringValue];
        if(temp.length > 10)
        {
            temp = [temp substringToIndex:10];
        }
        self.display.text = temp;
    }
    self.operation = @"";
}
@end
