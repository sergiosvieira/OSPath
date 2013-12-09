//
//  OSPath.m
//  OSPath
//
//  Created by Sergio Vieira on 06/12/13.
//  Copyright (c) 2013 Sergio Vieira. All rights reserved.
//

#import "OSPath.h"

@implementation OSPath

+ (NSString *)abspath:(NSString *)path
{
    NSString * result = [[NSBundle mainBundle] bundlePath];
    
    if ([path length] > 0)
    {
        if ([path hasSuffix:@"/"] && [path length] > 1)
        {
            result = [path substringToIndex:[path length] - 1];
        }
        else
        {
            result = path;
        }
    }
    
    return result;
}

+ (NSString *)basename:(NSString *)path
{
    NSArray * result = [path componentsSeparatedByString:@"/"];
    
    return [result lastObject];
}

+ (NSString *)commonprefix:(NSArray *)list
{
    NSString * result = @"";
    NSString * firstString = list[0];
    NSInteger min = [firstString length];
    int left = 0;
    
    for (int i = 1; i < [list count]; i++)
    {
        NSString * currentString = [firstString substringToIndex:left];
        NSString * otherString = list[i];
        NSString * currentOtherString = [otherString substringToIndex:left];
        do
        {
            left++;
            currentString = [firstString substringToIndex:left];
            currentOtherString = [otherString substringToIndex:left];
            
            if (![currentString isEqualToString:currentOtherString])
            {
                left--;
            }
        } while (left < [firstString length] && left < [otherString length] && [currentString isEqualToString:currentOtherString]);
        
        if (left < min)
        {
            min = left;
        }
        
        left = 0;
    }
	  
    if ([list count] == 1 && [firstString length] == 1)
    {
        result = firstString;
    }
    else
    {
        result = [firstString substringToIndex:min];
    }
    
    return result;
}

@end
