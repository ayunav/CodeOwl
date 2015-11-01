//
//  COLoginViewController.m
//  CodeOwlApp
//
//  Created by Ayuna Vogel on 10/31/15.
//  Copyright © 2015 Ayuna Vogel. All rights reserved.
//
#import <Parse/Parse.h>

#import <ParseFacebookUtilsV4/ParseFacebookUtilsV4.h> 

#import "COLoginViewController.h"
#import "COUser.h"
#import "COMyProfileViewController.h"

@interface COLoginViewController ()

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;

@end

@implementation COLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//     if (![PFUser currentUser]) {
//        [self showLogin];
//    } else {
//        [self showApp];
//    }
    
}

- (IBAction)loginButtonTapped {
    [self showLogin];
}

- (void)showApp {
    UITabBarController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"COTabBarController"];
    [self presentViewController:tabBarController animated:NO completion:nil];
}

- (void)showLogin {
    
    [PFFacebookUtils logInInBackgroundWithReadPermissions: @[@"public_profile", @"email", @"user_friends"] block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in through Facebook!");
        } else {
            NSLog(@"User logged in through Facebook!");
            
            FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id, name, email, gender, link"}];
            
            [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                
                COUser *user = (COUser *)[PFUser currentUser];
                
                [user setValue:result[@"name"] forKey:@"name"];
                [user setValue:result[@"gender"] forKey:@"gender"];
                [user setValue:result[@"email"] forKey:@"email"];
                
                // [user setValue:result[@"link"] forKey:@"link"];
                
                self.loginButton.hidden = YES;
                
                [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error){
//                    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"COProfileSettingsViewController"]];
                    UITabBarController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"COTabBarController"];
                    [self presentViewController:tabBarController animated:YES completion:nil];
                    
                }];
                
            }];
            
        }
    }];

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
