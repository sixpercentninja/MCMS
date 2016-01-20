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
    self.title = self.creature.name;
    self.editNameText.text = self.creature.name;

}


- (IBAction)onEditTapped:(UIButton *)sender {
    [self.editNameText setEnabled:YES];
    if ([sender.titleLabel.text isEqualToString: @"Done"]) {
        [self.editNameText setEnabled:NO];
        sender.titleLabel.text = @"Edit";
    }
    else {
        [self.editNameText setEnabled:YES];
        sender.titleLabel.text = @"Done";
        self.creature.name = self.editNameText.text;
        //[sender setTitle:@"Done" forState:UIControlStateNormal];
    }
    self.title = self.editNameText.text;
}



@end
