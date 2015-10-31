//
//  COChatViewController.m
//  CodeOwlApp
//
//  Created by Ayuna Vogel on 10/31/15.
//  Copyright © 2015 Ayuna Vogel. All rights reserved.
//

#import "COChatViewController.h"
#import "COUser.h"

@interface COChatViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *messageTableView;

@property (strong, nonatomic) NSMutableArray *messagesArray;

@end

@implementation COChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.messageTableView.dataSource = self;
    self.messageTableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.messagesArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageIdentifier" forIndexPath:indexPath];
    
    COUser *userMessage = self.messagesArray[indexPath.row];
    //[COUser] set up property "messages"
    cell.textLabel.text = userMessage.message;

    return cell;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    //dimiss the keyboard and lose focus
    [self.view endEditing:YES];
    
    return YES;
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
