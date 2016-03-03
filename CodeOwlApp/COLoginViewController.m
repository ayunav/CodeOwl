//
//  COLoginViewController.m
//  CodeOwlApp
//
//  Created by Ayuna Vogel on 10/31/15.
//  Copyright © 2015 Ayuna Vogel. All rights reserved.
//
#import <Parse/Parse.h>
#import <ParseFacebookUtilsV4/ParseFacebookUtilsV4.h> 

#import "COUser.h"
#import "AppDelegate.h"
#import "COLoginViewController.h"
#import "COMyProfileViewController.h"
#import "COMapViewController.h"
#import "COTabBarController.h"

// https://github.com/ParsePlatform/ParseUI-iOS/wiki/Integrate-Login-with-Facebook
// https://developers.facebook.com/docs/facebook-login/ios

@interface COLoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation COLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    // Presenting view controllers on detached view controllers is discouraged <COLoginViewController: 0x7f82c14bc3b0>.
    // Unbalanced calls to begin/end appearance transitions for <UINavigationController: 0x7f82c187d600>.
    if ([FBSDKAccessToken currentAccessToken]) {
        
        self.loginButton.hidden = YES;
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        COTabBarController *tabBarController = [storyboard instantiateViewControllerWithIdentifier:@"COTabBarController"];
        [self presentViewController:tabBarController animated:NO completion:nil];
    }
}

- (IBAction)loginWithFacebookButtonTapped:(id)sender {

    [PFFacebookUtils logInInBackgroundWithReadPermissions: @[@"public_profile", @"email", @"user_friends"]
                                                    block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in through Facebook!");
        } else {
            NSLog(@"User logged in through Facebook!");
            self.loginButton.hidden = YES; 
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            COTabBarController *tabBarController = [storyboard instantiateViewControllerWithIdentifier:@"COTabBarController"];
            [self presentViewController:tabBarController animated:NO completion:nil];
            //[self performSegueWithIdentifier:@"segueToTabBarVC" sender:nil];
            
            
            //            FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id, name, email, gender, link"}];
            //
            //            [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            //
            //                UITabBarController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"COTabBarController"];
            //                [self presentViewController:tabBarController animated:NO completion:nil];
            //
            //                COUser *user = (COUser *)[PFUser currentUser];
            //
            //                [user setValue:result[@"name"] forKey:@"name"];
            //                [user setValue:result[@"gender"] forKey:@"gender"];
            //                [user setValue:result[@"email"] forKey:@"email"];
            //
            //                // [user setValue:result[@"link"] forKey:@"link"];
            //
            //
            //
            //                [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error){
            ////                    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"COProfileSettingsViewController"]];
            //                }];
            //                
            //            }];
            
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
