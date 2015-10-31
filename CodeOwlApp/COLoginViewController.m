//
//  COLoginViewController.m
//  CodeOwlApp
//
//  Created by Ayuna Vogel on 10/31/15.
//  Copyright © 2015 Ayuna Vogel. All rights reserved.
//
#import <Parse/Parse.h>

#import "COLoginViewController.h"
#import "COUser.h"
#import "COMyProfileViewController.h"

@interface COLoginViewController () <FBSDKLoginButtonDelegate>

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;

@end

@implementation COLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];

    self.loginButton.delegate = self;
    self.loginButton.readPermissions =
    @[@"public_profile", @"email", @"user_friends"];
    
    //    [PFUser currentUser];
    
    COUser *user = (COUser *)[PFUser currentUser];
    user.name = @"Ayuna";
    [user saveInBackground];
}

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil];
    
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        
        COUser *user = (COUser *)[PFUser currentUser];
        user.name = result[@"name"];
   
        UITabBarController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"COTabBarController"];
        [self presentViewController:tabBarController animated:YES completion:nil];
    }];
    
    


}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
