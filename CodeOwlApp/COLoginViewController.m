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

@interface COLoginViewController () //<FBSDKLoginButtonDelegate>

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;

@end

@implementation COLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.loginButton addTarget:self
                         action:@selector(loginButtonClicked)
               forControlEvents:UIControlEventTouchUpInside];
}


-(void)loginButtonClicked
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             
             NSLog(@"Logged in");

//             [self performSegueWithIdentifier:@"segueToTabBarVC" sender:nil];

             UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
             COTabBarController *tabBarController = [storyboard instantiateViewControllerWithIdentifier:@"COTabBarController"];
             [self presentViewController:tabBarController animated:NO completion:nil];

          }
     }];
}

//- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
//    NSLog(@"User logged out");
//}


//- (void)loginButton:(FBSDKLoginButton *)loginButton
//didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
//              error:(NSError *)error
//{
//    
//    if (error) {
//        NSLog(@"Process error");
//    } else if (result.isCancelled) {
//        NSLog(@"Cancelled");
//    } else {
////        NSLog(@"Logged in");
//        self.loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends", @"user_location"];
//
//        [PFFacebookUtils logInInBackgroundWithReadPermissions:self.loginButton.readPermissions
//                                                        block:^(PFUser *user, NSError *error)
//        {
//                    if (!user) {
//                        NSLog(@"Uh oh. The user cancelled the Facebook login.");
//                    } else if (user.isNew) {
//                        NSLog(@"User signed up and logged in through Facebook!");
//                    } else {
//                        NSLog(@"User logged in through Facebook!");
//            
//            
//                        [self performSegueWithIdentifier:@"segueToTabBarVC" sender:nil];
//                    }
//            }];
//        
//        
////        
////        NSLog(@"User logged in through Facebook!");
////
////        
////        
////        //[self performSegueWithIdentifier:@"segueToTabBarVC" sender:nil];
////        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
////        COTabBarController *tabBarController = [storyboard instantiateViewControllerWithIdentifier:@"COTabBarController"];
////        [self presentViewController:tabBarController animated:YES completion:nil];
//
//    }
//    
//    
//    
//}


//- (IBAction)loginWithFacebookButtonTapped:(id)sender {
//   
//    // Login PFUser using Facebook
//    [PFFacebookUtils logInInBackgroundWithReadPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
//        if (!user) {
//            NSLog(@"Uh oh. The user cancelled the Facebook login.");
//        } else if (user.isNew) {
//            NSLog(@"User signed up and logged in through Facebook!");
//
//            // [self performSegueWithIdentifier:@"segueToTabBarVC" sender:nil];
//            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//            COTabBarController *tabBarController = [storyboard instantiateViewControllerWithIdentifier:@"COTabBarController"];
//            [self presentViewController:tabBarController animated:YES completion:nil];
//            
//        } else {
//            NSLog(@"User logged in through Facebook!");
//            
//            [self performSegueWithIdentifier:@"segueToTabBarVC" sender:nil];
//            
////            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
////            UITabBarController *tabBarController = [storyboard instantiateViewControllerWithIdentifier:@"COTabBarController"];
////            [self presentViewController:tabBarController animated:YES completion:nil];
//            
//            
//        }
//    }];
//}

// ***** this segue worked before when I had all those weird buttons hiding before the actual segue, but now  I'm trying to fix the app and make a nice clean code project  ******

//- (void)showLogin {
//
//    [PFFacebookUtils logInInBackgroundWithReadPermissions: @[@"public_profile", @"email", @"user_friends"] block:^(PFUser *user, NSError *error) {
//        if (!user) {
//            NSLog(@"Uh oh. The user cancelled the Facebook login.");
//        } else if (user.isNew) {
//            NSLog(@"User signed up and logged in through Facebook!");
//        } else {
//            NSLog(@"User logged in through Facebook!");
//            
//
//            [self performSegueWithIdentifier:@"segueToTabBarVC" sender:nil];
//            
//            
////            FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id, name, email, gender, link"}];
////            
////            [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
////                
////                UITabBarController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"COTabBarController"];
////                [self presentViewController:tabBarController animated:NO completion:nil];
////                
////                COUser *user = (COUser *)[PFUser currentUser];
////                
////                [user setValue:result[@"name"] forKey:@"name"];
////                [user setValue:result[@"gender"] forKey:@"gender"];
////                [user setValue:result[@"email"] forKey:@"email"];
////                
////                // [user setValue:result[@"link"] forKey:@"link"];
////                
////                self.loginButton.hidden = YES;
////                
////                
////                [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error){
//////                    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"COProfileSettingsViewController"]];
////                }];
////                
////            }];
//            
//        }
//    }];
//
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
