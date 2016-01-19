//
//  ViewController.m
//  MCMS
//
//  Created by Andrew Chen on 1/19/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

//APP BOOT UP

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MagicalCreature *magical1 = [[MagicalCreature alloc] initWithName:@"Pikachu"];
    
    MagicalCreature *magical2 = [[MagicalCreature alloc]initWithName:@"Squirtle"];

    MagicalCreature *magical3 = [[MagicalCreature alloc]initWithName:@"Charmander"];
    
    self.creatures = [NSMutableArray arrayWithObjects:magical1, magical2, magical3, nil];

}

//REQUIRED TABLEVIEW DELEGATE METHODS

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellidentifier"];
    cell.textLabel.text = [[self.creatures objectAtIndex:indexPath.row] name];
    return cell;
}

//USER INTERACTIONS

- (IBAction)addCreature:(UIBarButtonItem *)sender {
    [self.creatures addObject:self.textField.text];
    [self.tableView reloadData];
//
}

//CUSTOM METHODS



@end
