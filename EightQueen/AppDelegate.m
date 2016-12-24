//
//  AppDelegate.m
//  EightQueen
//
//  Created by 安宁 on 16/12/24.
//  Copyright © 2016年 安宁. All rights reserved.
//

#import "AppDelegate.h"
#import "EightQueen.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    ResultsObject * results = [EightQueen currentRows:0 andCurrentDataArray:NULL andMaxQueen:8];
    
    int i = 0 ;
    for (ResultObject * result in results.results)
    {
        printf("%d \t",++i);
        for (LocationObject * location in result.result)
        {
            printf("%d %d,\t",location.rowNum,location.colunmNum);
        }
        printf("\n");

    }
    
    return YES;
}





@end
