//
//  COProfileSettingsViewController.m
//  CodeOwlApp
//
//  Created by Ayuna Vogel on 10/31/15.
//  Copyright © 2015 Ayuna Vogel. All rights reserved.
//

#import "COProfileSettingsViewController.h"
#import "COUser.h"
#import "COLoginViewController.h"

@interface COProfileSettingsViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *avatarView;  // UIView or UIImageView?
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *skillTextField;
@property (weak, nonatomic) IBOutlet UITextField *levelTextField;
@property (weak, nonatomic) IBOutlet UITextField *bioTextField;
@property (weak, nonatomic) IBOutlet UITextField *genderTextField;
@property (weak, nonatomic) IBOutlet UITextField *spokenLanguageTextField;
@property (weak, nonatomic) IBOutlet UISwitch *showMyProfileToMyGenderOnly;

@end



@implementation COProfileSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTextFieldDelegates];
    [self setupUI];
}

-(void)setupTextFieldDelegates {
    self.nameTextField.delegate = self;
    self.skillTextField.delegate = self;
    self.levelTextField.delegate = self;
    self.bioTextField.delegate = self;
    self.genderTextField.delegate = self;
    self.spokenLanguageTextField.delegate = self;
}

-(void)setupUI {

    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CodeOwlLogoWhiteSmall"]];

    //self.navigationItem.title = @"Settings";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonTapped)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor darkGrayColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonTapped)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.avatarView.layer.cornerRadius = 80.0;
    self.avatarView.clipsToBounds = YES;
    self.avatarView.layer.borderColor = [UIColor colorWithRed:83.00/255.0 green:123.00/255.0 blue:53.00/255.0 alpha:1.0].CGColor;
    self.avatarView.layer.borderWidth = 2.0;
}

#pragma mark - Save button tapped

- (void)saveButtonTapped {
    
    COUser *user = (COUser *)[PFUser currentUser];
    
    // if the text field is empty, saves empty string to database
    user.skill = self.skillTextField.text;
    user.name = self.nameTextField.text;
    user.level = self.levelTextField.text;
    user.bio = self.bioTextField.text;
    user.gender = self.genderTextField.text;
    user.spokenLanguage = self.spokenLanguageTextField.text;
    user.showMyProfileToMyGenderOnly = self.showMyProfileToMyGenderOnly.on;

    // Do I need this?
    // Request a background execution task to allow us to finish uploading the photo even if the app is backgrounded
//    self.fileUploadBackgroundTaskId = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
//        [[UIApplication sharedApplication] endBackgroundTask:self.fileUploadBackgroundTaskId];
//    }];
//    

    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [user saveInBackground];
}

-(void)cancelButtonTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)logOutButtonTapped:(id)sender {
    [COUser logOut];
    
    COLoginViewController *loginViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"COLoginViewController"];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:loginViewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}

@end
