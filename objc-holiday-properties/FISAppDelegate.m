//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    return self.database[season];
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    return self.database[season][holiday];
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    if ([[self.database[season] allKeys] containsObject:holiday]){
        return YES;
    }else {
        return NO;
    }
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    if ([self.database[season][holiday] containsObject:supply]){
        return YES;
    }else {
        return NO;
    }

}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    self.database[season][holiday] = [@"" mutableCopy];
    // no return
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    self.database[season][holiday]= supply;
    // no return
}

@end
