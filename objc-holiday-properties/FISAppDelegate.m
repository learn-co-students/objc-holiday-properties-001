//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    NSMutableArray *newArray = [[NSMutableArray alloc]init];
    [newArray addObjectsFromArray:self.database[season]];
    NSArray *finalArray = [newArray copy];
    
    return finalArray;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    NSMutableArray *newArray = [[NSMutableArray alloc]init];
    [newArray addObjectsFromArray:self.database[season][holiday]];
    
    
    return newArray;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    if([self.database[season] objectForKey:holiday] ==nil){
        return NO;}else{return YES;};
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    if([self.database[season][holiday] containsObject:supply] ==nil){
        return NO;}else{return YES;};
    
    
    return nil;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    NSMutableArray *emptyArray = [[NSMutableArray alloc]init];
    [self.database[season] setObject:emptyArray forKey:holiday];
    
    // no return
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    [self.database[season][holiday] addObject:supply];
    
    // no return
}

@end
