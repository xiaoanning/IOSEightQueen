//
//  EightQueen.m
//  Test
//
//  Created by 安宁 on 16/12/24.
//  Copyright © 2016年 安宁. All rights reserved.
//

#import "EightQueen.h"

@interface EightQueen ()

@property ( nonatomic , strong ) ResultsObject * resultsObject ;

@end

@implementation EightQueen

-(ResultsObject *)resultsObject
{
    if (_resultsObject == NULL)
    {
        _resultsObject = [[ResultsObject alloc]init];
    }
    
    
    return _resultsObject ;
}

-(ResultsObject *)currentRows:(unsigned int)currentRowNum andCurrentDataArray:(ResultObject *)dataArray andMaxQueen:(unsigned int)queenCount
{
    //比较当前行的每一个位置是否和前面行冲突

    for (int i = 0; i < queenCount; i++)
    {
        LocationObject * location = [[LocationObject alloc]init];
        location.rowNum = currentRowNum ;

        location.colunmNum = i ;

        if (currentRowNum == 0)
        {
            dataArray = [self resultObject:NULL andMaxQueen:queenCount];
            [dataArray.result replaceObjectAtIndex:currentRowNum withObject:location];
            [self currentRows:currentRowNum+1 andCurrentDataArray:dataArray andMaxQueen:queenCount];
        }else
        {
            bool unconflict = [EightQueen locationUnconflictWithLocation:location andArray:dataArray.result andValidCount:currentRowNum];
            
            if (unconflict)
            {
                [dataArray.result replaceObjectAtIndex:currentRowNum withObject:location];
                
                if (currentRowNum == queenCount-1)
                {
                    ResultObject * ro = [[ResultObject alloc]init];
                    ro.result = [dataArray.result copy] ;
                    [self.resultsObject.results addObject: ro];
                }else
                {
                    [self currentRows:currentRowNum+1 andCurrentDataArray:dataArray andMaxQueen:queenCount];
                }

            }else
            {
                continue ;
            }
        }
        
    }
    
    
    if (currentRowNum == 0)
    {
        return _resultsObject ;
    }else
    {
        return NULL ;
    }
    
}
+(ResultsObject *)currentRows:(unsigned int)row andCurrentDataArray:(ResultObject *)dataArray andMaxQueen:(unsigned int)queenCount
{
    return [[[EightQueen alloc]init] currentRows:row andCurrentDataArray:dataArray andMaxQueen:queenCount];
}

/*
        某个位置是否和已保存的满足条件的位置冲突
 */
+(bool)locationUnconflictWithLocation:(LocationObject *)location1 andArray:(NSArray <LocationObject *> *)locationArray andValidCount:(unsigned int)validCount
{
    for ( int i = 0 ; i < validCount ; i++)
    {
        if (![self locationUnconflictWithLocation:location1 andLocation:locationArray[i]])
        {
            return false ;
        }
    }
    
    return true ;
}


+(bool)locationUnconflictWithLocation:(LocationObject *)location1 andLocation:(LocationObject *)location2
{
//    NSLog(@" %u %u",abs(location1.rowNum - location2.rowNum),abs(location1.colunmNum - location2.colunmNum));

    if(location1.rowNum == location2.rowNum || location1.colunmNum == location2.colunmNum || abs((int)(location1.rowNum - location2.rowNum)) == abs((int)(location1.colunmNum - location2.colunmNum)))
    {
        return false;
    }else
    {
        return true ;
    }
}

-(ResultObject * )resultObject:(ResultObject *)dataArray andMaxQueen:(unsigned int)queenCount
{
    if (dataArray == NULL)
    {
        dataArray = [[ResultObject alloc]init];
    }
    
    
    if (dataArray.result.count < queenCount)
    {
        for (int index = (int)dataArray.result.count; index < queenCount; index++)
        {
            [dataArray.result addObject:[[LocationObject alloc]init]];
        }
    }
    
    return dataArray ;

}



@end
