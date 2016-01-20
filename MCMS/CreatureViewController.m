//
//  CreatureViewController.m
//  MCMS
//
//  Created by Sujin Oh on 1/19/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageCreature;
@property (weak, nonatomic) IBOutlet UITextField *editNameText;
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.editNameText setEnabled:NO];
    [self.detailTextField setEnabled:NO];
    self.title = self.creature.name;
    self.editNameText.text = self.creature.name;
    self.detailTextField.text = self.creature.detail;

}

- (IBAction)onEditTapped2:(UIBarButtonItem *)sender {
    [self.editNameText setEnabled:YES];
    if ([sender.title isEqualToString: @"Done"]) {
        [self.editNameText setEnabled:NO];
        [self.detailTextField setEnabled:NO];
        self.creature.name = self.editNameText.text;
        self.creature.detail = self.detailTextField.text;
        sender.title = @"Edit";
    }
    else {
        [self.editNameText setEnabled:YES];
        [self.detailTextField setEnabled:YES];
        self.creature.name = self.editNameText.text;
        self.creature.detail = self.detailTextField.text;
        sender.title = @"Done";
    }
    self.title = self.editNameText.text;
    
}


@end
