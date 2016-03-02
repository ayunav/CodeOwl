//
//  COUser.h
//  CodeOwlApp
//
//  Created by Ayuna Vogel on 10/31/15.
//  Copyright © 2015 Ayuna Vogel. All rights reserved.
//

#import <Parse/Parse.h>

@interface COUser : PFUser <PFSubclassing>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *skill;
@property (nonatomic, strong) NSString *level;
@property (nonatomic, strong) NSString *bio;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *spokenLanguage;
@property (nonatomic, strong) PFFile *avatar;
@property (nonatomic) BOOL showMyProfileToMyGenderOnly;

@property (nonatomic, strong) NSMutableArray *messages;
@property (nonatomic, strong) PFGeoPoint *location;

@end
