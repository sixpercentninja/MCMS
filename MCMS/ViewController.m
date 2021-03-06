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
#import "BattleViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSMutableArray *battleCreatures;

@end

@implementation ViewController

//APP BOOT UP

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MagicalCreature *magical1 = [[MagicalCreature alloc] initWithName:@"Pikachu" detail:@"Lightning-based attacks"];
    magical1.image = @"Pikachu.png";
    
    MagicalCreature *magical2 = [[MagicalCreature alloc]initWithName:@"Squirtle" detail: @"Water-based attacks"];
    magical2.image = @"Squirtle.png";

    MagicalCreature *magical3 = [[MagicalCreature alloc]initWithName:@"Charmander" detail:@"Fire-based attacks"];
    magical2.image = @"Charmander.png";
    
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
    if ([segue.identifier isEqualToString:@"creatureID"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CreatureViewController *destination = segue.destinationViewController;
        destination.creature = [self.creatures objectAtIndex:indexPath.row];
    } else {
        NSMutableArray *battleCreatures = [NSMutableArray new];
        int remaining = 2;
        if (self.creatures.count >= remaining){
            while (remaining > 0) {
                id creature = self.creatures[arc4random_uniform((uint32_t)self.creatures.count)];
                if (![battleCreatures containsObject:creature]) {
                    [battleCreatures addObject:creature];
                    remaining--;
                }
        }
        BattleViewController *destination = segue.destinationViewController;
            destination.creature1 = [self.battleCreatures objectAtIndex:0];
            destination.creature2 = [self.battleCreatures objectAtIndex:1];
    }
    
    }
}



@end
