//
//  MCButton.m
//  Calcaulor
//
//  Created by 陳昱安 on 13/9/27.
//  Copyright (c) 2013年 陳昱安. All rights reserved.
//

#import "MCButton.h"
@interface MCButton()

@end


@implementation MCButton

-(id)init{
    if(self = [super init]){
        self.layer.cornerRadius = 10;
    }
    return self;
}

-(void)vijayWithApple{
    
    NSLog(@"vijayWithApple Called");
}


@end
