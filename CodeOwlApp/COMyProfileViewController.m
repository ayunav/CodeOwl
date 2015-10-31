//
//  COMyProfileViewController.m
//  CodeOwlApp
//
//  Created by Ayuna Vogel on 10/31/15.
//  Copyright © 2015 Ayuna Vogel. All rights reserved.
//

#import "COMyProfileViewController.h"
#import "COLoginViewController.h"
#import "COUser.h"

@interface COMyProfileViewController ()

@property (weak, nonatomic) IBOutlet UIView *avatarView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation COMyProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"My Profile";
    
    COUser *user = (COUser *)[PFUser currentUser];
    self.nameLabel.text = [user valueForKey:@"name"];
    
    
//    COLoginViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
//    [self presentViewController:viewController animated:NO completion:nil];
    
}


@end
