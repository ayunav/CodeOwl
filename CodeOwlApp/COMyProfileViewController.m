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
@property (weak, nonatomic) IBOutlet UILabel *skillLabel;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
@property (weak, nonatomic) IBOutlet UILabel *bioLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *spokenLanguageLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *settingsButton;

@end

@implementation COMyProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"My Profile";
    
    self.avatarView.layer.cornerRadius = 80.0;
    self.avatarView.clipsToBounds = YES;
    self.avatarView.layer.borderColor = [UIColor colorWithRed:83.00/255.0 green:123.00/255.0 blue:53.00/255.0 alpha:1.0].CGColor;
    self.avatarView.layer.borderWidth = 2.0;
    
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CodeOwlLogoWhiteSmall"]];
    self.settingsButton.tintColor = [UIColor whiteColor];
    
    //    COUser *user = (COUser *)[PFUser currentUser];
    //    self.nameLabel.text = [user username];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{ @"fields" : @"id,name,picture.width(100).height(100)"}]startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            if (!error) {
                self.nameLabel.text = [result valueForKey:@"name"];
            }
        }];
    }
    
    //    COLoginViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    //    [self presentViewController:viewController animated:NO completion:nil];
    
}


@end
