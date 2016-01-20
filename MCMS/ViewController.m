//
//  ViewController.m
//  MCMS
//
//  Created by Andrew Chen on 1/19/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

//APP BOOT UP

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MagicalCreature *magical1 = [[MagicalCreature alloc] initWithName:@"Pikachu" detail:@"Lightning-based attacks"];
    
    MagicalCreature *magical2 = [[MagicalCreature alloc]initWithName:@"Squirtle" detail: @"Water-based attacks"];

    MagicalCreature *magical3 = [[MagicalCreature alloc]initWithName:@"Charmander" detail:@"Fire-based attacks"];
    
    self.creatures = [NSMutableArray arrayWithObjects:magical1, magical2, magical3, nil];

}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];

}

//REQUIRED TABLEVIEW DELEGATE METHODS

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellidentifier"];
    cell.textLabel.text = [[self.creatures objectAtIndex:indexPath.row] name];
    cell.detailTextLabel.text = [[self.creatures objectAtIndex:indexPath.row] detail];
    return cell;
}

//USER INTERACTIONS

- (IBAction)addCreature:(UIBarButtonItem *)sender {
    //MagicalCreature *newCreature = [[MagicalCreature alloc] initWithName:self.textField.text];
    
    [self.creatures addObject:[[MagicalCreature alloc]initWithName:self.textField.text detail:@""]];
    [self.tableView reloadData];
    self.textField.text = nil;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    CreatureViewController *destination = segue.destinationViewController;
    //destination.title = [[self.creatures objectAtIndex:indexPath.row] name];
    destination.creature = [self.creatures objectAtIndex:indexPath.row];
}




@end
