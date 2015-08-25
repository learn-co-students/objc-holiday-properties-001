//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    NSArray *holidays = [self.database valueForKey:season];
    return holidays;
    
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    NSArray *holidays = [self.database valueForKey:season];
    NSArray *supplies = [holidays valueForKey:holiday];
    return supplies;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    BOOL isCorrect = NO;
    NSArray *holidays = [self.database valueForKey:season];
    for (NSString *anyholiday in holidays) {
        if ([holiday isEqualToString:anyholiday]) {
            isCorrect = YES;
        }
    }
    
    return isCorrect;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    BOOL isCorrect = NO;
    NSArray *holidays = [self.database valueForKey:season];
    NSArray *supplies = [holidays valueForKey:holiday];
    for (NSString *anysupplies in supplies) {
        if ([supply isEqualToString:anysupplies]) {
            isCorrect = YES;
        }
    }
    return isCorrect;
    
}


- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    NSMutableArray *mEmpty = [[NSMutableArray alloc] init];
    NSArray *holidays = [self.database valueForKey:season];
    [holidays setValue:mEmpty forKey:(holiday)];

}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    NSArray *holidays = [self.database valueForKey:season];
    [holidays setValue:supply forKey:holiday];
}

@end
