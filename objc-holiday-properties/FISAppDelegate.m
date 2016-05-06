//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    NSArray *holidays = [self.database[season] allKeys];
    return holidays;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    NSArray *supplies = self.database[season][holiday];
    return supplies;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    BOOL inSeason = NO;
    if ([[self.database[season] allKeys] containsObject:holiday]) {
        inSeason = YES;
    }
    return inSeason;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    BOOL inSupply = NO;
    if([self.database[season][holiday] containsObject:supply]) {
        inSupply = YES;
    }
    return inSupply;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    NSMutableArray *supplies = [[NSMutableArray alloc] init];
    self.database[season][holiday] = supplies;
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    [self.database[season][holiday] addObject:supply];
}

@end
