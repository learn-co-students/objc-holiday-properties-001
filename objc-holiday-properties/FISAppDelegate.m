//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    [self database];
    NSArray *holidaysForSeason = [[self.database objectForKey:season] allKeys];
    return holidaysForSeason;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    [self database];
    NSMutableArray *mutableCopyOfSupplies = [[self.database objectForKey:season] objectForKey:holiday];
    return mutableCopyOfSupplies;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    BOOL holidayFound = NO;
    
    [self database];
    
    NSArray *holidays = [[self.database objectForKey:season] allKeys];
    for (id key in holidays) {
        
        if (key == holiday) {
            holidayFound = YES;
        }
        
    }
    
    return holidayFound;
    
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    [self database];
    
    BOOL supplyFound = NO;
    
    NSArray *holidays = [[self.database objectForKey:season] allKeys];
    
    for (id holidayName in holidays) {
        
        if (holidayName == holiday) {
            
            NSArray *supplies = [[[self.database objectForKey:season] objectForKey:holiday] allObjects];
            
            for (id supplyName in supplies) {
                
                if (supplyName == supply) {
                    
                    supplyFound = YES;
                }
            }
        }
    }
    
    return supplyFound;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    NSMutableArray *holidaySupplyArray = [[NSMutableArray alloc] init];
    NSMutableDictionary *build;
    NSMutableDictionary *edit;
    [self database];
    edit = [self.database mutableCopy];
    
    for (id key in self.database) {
        
        if (key == season) {
            
            build = [self.database objectForKeyedSubscript:key];
            [build setObject:holidaySupplyArray forKey:holiday];
            [edit removeObjectForKey:season];
            [edit setObject:build forKey:season];
            self.database = [edit copy];
            
        }
    }
    
    // no return
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    [self database];
    NSMutableDictionary *isolateSeason;
    NSMutableDictionary *isolateHoliday;
    NSMutableArray *supplies;
    isolateSeason = [self.database mutableCopy];
    NSMutableDictionary *revisedDatabase;
    revisedDatabase = [self.database mutableCopy];
    
    for (id key in self.database) {
        
        if (key != season) {
            
            [isolateSeason removeObjectForKey:key];
        
        }
    }
    
    for (id seasonKey in isolateSeason) {
        
        if (seasonKey == season) {
            
            isolateHoliday = [isolateSeason objectForKey:season];
            
            for (id holidayKey in isolateHoliday) {
                
                if (holidayKey == holiday) {
                    
                    supplies = [isolateHoliday objectForKey:holiday];
                    [supplies addObject:supply];
                    break;
                }
                
            }
            
        }
    }
    
    
    
    for (id key in revisedDatabase) {
        
        if (key == season) {
            [revisedDatabase setObject:isolateHoliday forKey:season];
            break;
        }
        
    }
    self.database = [revisedDatabase copy];
    
    // no return
}

@end
