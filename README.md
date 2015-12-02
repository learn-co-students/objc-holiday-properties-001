# Holiday Properties

## Objectives

1. Implement methods that access a property using `self.` ("self dot") notation.

## Instructions

This lab is a revisiting of the Holidays portion of the Apples and Holidays lab. Because this lab is about accessing properties and not writing method names, we've provided the method names for you.

1. Fork and clone this lab to your machine. Open the `*.xcworkspace` file and navigate to the `FISAppDelegate.h` header file. Add an `NSDictionary` property called `database` to `FISAppDelegate.h` below the existing `window` property; like this `window` property, `database` should also be `strong` and `nonatomic`.

2. The test file is set up to populate the `database` dictionary so in the method implementations you will just be interacting with the property after it's been populated. Navigate to the `FISAppDelegate.m` implementation file and write out the method bodies, accessing the `database` property from within the current file by using `self.` ("self dot") notation. Run the tests with `⌘` `U` to check your work after solving each one:

  * `holidaysInSeason:` to return an array of all of the "holiday" keys in the sub-dictionary associated with the submitted "season" argument.
  
  * `suppliesInHoliday:inSeason:` to return the mutable array of all of the supplies for the submitted "holiday" in the submitted "season".
  
  * `holiday:isInSeason:` to return whether or not the submitted "season" contains a key that matches the "holiday" argument.
  
  * `supply:isInHoliday:inSeason:` to return whether or not the submitted "holiday" in the submitted "season" contains in its array the submitted "supply" string.
  
  * `addHoliday:toSeason:` to create a new key-value pair in the submitted "season" key's sub-dictionary that uses the submitted "holiday" as the key and sets up an empty mutable array as its value.
  
  * `addSupply:toHoliday:inSeason:` to insert the submitted "supply" argument into the mutable array of the submitted "holiday" key in the sub-dictionary of the submitted "season" key.

**Hint:** *It is entirely acceptable (and encouraged) to reference your solution to the original "Apples and Holidays" lab when solving this lab.*
<a href='https://learn.co/lessons/objc-holiday-properties' data-visibility='hidden'>View this lesson on Learn.co</a>
