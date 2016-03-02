//
//  COUser.m
//  CodeOwlApp
//
//  Created by Ayuna Vogel on 10/31/15.
//  Copyright © 2015 Ayuna Vogel. All rights reserved.
//

#import "COUser.h"

@implementation COUser

@dynamic name;
@dynamic skill;
@dynamic level;
@dynamic bio;
@dynamic gender;
@dynamic spokenLanguage;
@dynamic avatar;
@dynamic showMyProfileToMyGenderOnly;

@dynamic messages;
@dynamic location;

//https://developer.apple.com/library/ios/documentation/MapKit/Reference/MKAnnotation_Protocol/index.html#//apple_ref/occ/intfp/MKAnnotation/coordinate

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake(self.location.latitude, self.location.longitude);
}

- (NSString *)title {
    return self.name;
}

@end
