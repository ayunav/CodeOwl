//
//  COMyProfileViewController.m
//  CodeOwlApp
//
//  Created by Ayuna Vogel on 10/31/15.
//  Copyright © 2015 Ayuna Vogel. All rights reserved.
//

#import "COMyProfileViewController.h"
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
    self.nameLabel.text = user.name;
    
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
