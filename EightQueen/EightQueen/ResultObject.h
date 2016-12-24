//
//  ResultObject.h
//  Test
//
//  Created by 安宁 on 16/12/24.
//  Copyright © 2016年 安宁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationObject.h"

/*
        每一种可能的8个棋子的位置信息
 */

@interface ResultObject : NSObject

@property ( nonatomic , strong ) NSMutableArray <LocationObject *>* result ;

@end
