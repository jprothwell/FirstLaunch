//
//  FirstLaunch.m
//  FirstLaunch
//
//  Created by LeonJing on 25/01/2018.
//

#import "FirstLaunch.h"

@implementation FirstLaunch
+ (BOOL) isFirstLaunch{
    BOOL isFirst = NO;
    NSString* storeValue = [[NSUserDefaults standardUserDefaults]stringForKey:[self _storeKey]];
    NSString* shortVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    if (![storeValue isEqualToString:shortVersion]) {
        isFirst = YES;
    }
    return isFirst;
}

+ (BOOL) saveFirstLaunch{
    NSString* shortVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    [[NSUserDefaults standardUserDefaults]setObject:shortVersion forKey:[self _storeKey]];
    return [[NSUserDefaults standardUserDefaults]synchronize];
}

+ (NSString*) _storeKey{
    NSString* bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    NSString* className = NSStringFromClass(self);
    return [NSString stringWithFormat:@"%@_%@_FirstLaunchKey",bundleIdentifier,className];
}
@end
