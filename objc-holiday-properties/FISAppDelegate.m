//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    //to return an array of all of the "holiday" keys in the sub-dictionary associated with the submitted "season" argument.
    
    return self.database[season];
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    //to return the mutable array of all of the supplies for the submitted "holiday" in the submitted "season"
    
    return self.database[season][holiday];
}


- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    //to return whether or not the submitted "season" contains a key that matches the "holiday" argument
    bool doesExist = !([self.database[season] valueForKey:holiday] == nil);

    return doesExist;
}


- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    //to return whether or not the submitted "holiday" in the submitted "season" contains in its array the submitted "supply" string.
    NSArray *isThisWorking = self.database[season][holiday];
    bool theResult = [isThisWorking containsObject:supply];
    NSLog(@"abc");
    return theResult;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    //o create a new key-value pair in the submitted "season" key's sub-dictionary that uses the submitted "holiday" as the key and sets up an empty mutable array as its value.
    //WHATSBEINGTESTED	__NSCFString *	@"Winter  &   President's Day"
    //NSDictionary *isDictionary = self.database[season];
    //NSMutableDictionary *mutableDictionary = [isDictionary mutableCopy];
    //[mutableDictionary addEntriesFromDictionary:@{holiday :@""}];
    //isDictionary = self.database[season];
    [self.database[season] setObject:@"" forKey:holiday];

    
}// NO RETURN

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    //to insert the submitted "supply" argument into the mutable array of the submitted "holiday" key in the sub-dictionary of the submitted "season" key.
    [self.database[season][holiday] addObject:supply];
    
}// NO RETURN

@end
