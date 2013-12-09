//
//  OSPath.h
//  OSPath
//
//  Created by Sergio Vieira on 06/12/13.
//  Copyright (c) 2013 Sergio Vieira. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
  http://docs.python.org/2/library/os.path.html
*/
@interface OSPath : NSObject

/**
 Return a normalized absolutized version of the pathname path. On most platforms, this is equivalent to calling the function normpath() as follows: normpath(join(os.getcwd(), path)).
*/
+ (NSString *)abspath:(NSString *)path;

/**
 Return the base name of pathname path. This is the second element of the pair returned by passing path to the function split(). Note that the result of this function is different from the Unix basename program; where basename for '/foo/bar/' returns 'bar', the basename() function returns an empty string ('').

*/
+ (NSString *)basename:(NSString *)path;

/**
 Return the longest path prefix (taken character-by-character) that is a prefix of all paths in list. If list is empty, return the empty string (''). Note that this may return invalid paths because it works a character at a time.
*/
+ (NSString *)commonprefix:(NSArray *)list;

@end
