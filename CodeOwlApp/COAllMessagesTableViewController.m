//
//  COAllMessagesTableViewController.m
//  CodeOwlApp
//
//  Created by Ayuna Vogel on 10/31/15.
//  Copyright © 2015 Ayuna Vogel. All rights reserved.
//

#import "COAllMessagesTableViewController.h"
#import "COUser.h"
#import "COChatViewController.h"


@interface COAllMessagesTableViewController ()

@property (nonatomic) NSMutableArray *messagingUsers;

@end

@implementation COAllMessagesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.messagingUsers = [NSMutableArray array];

    COUser *user = (COUser *)[PFUser currentUser];
    
    [self.messagingUsers addObject:user.name];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.messagingUsers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"messagingUserCell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"Messages";
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    
    COUser *userObject = self.messagingUsers[selectedIndexPath.row];
    
    COChatViewController *detailVC = segue.destinationViewController;
    
    detailVC.user = userObject;
    
    
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