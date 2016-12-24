//
//  EightQueen.h
//  Test
//
//  Created by 安宁 on 16/12/24.
//  Copyright © 2016年 安宁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResultsObject.h"

@interface EightQueen : NSObject


/**
        解决8皇后问题思路：
        按照规则 同一行只能摆放一个  故一行只能且必须有一个  如此的话 确保前面行的位置不冲突的前提下 去确定当前行的位置
 
 
        第一个参数表示 当前的行数    
        第二个表示前面行满足条件的棋子的位置   
        第三个表示棋盘上要满足几个棋子  譬如 8皇后就是8个
 
 */

+(ResultsObject *)currentRows:(unsigned int)row andCurrentDataArray:(ResultObject *)dataArray andMaxQueen:(unsigned int)queenCount ;


@end
