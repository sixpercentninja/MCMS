//
//  MagicalCreature.m
//  MCMS
//
//  Created by Andrew Chen on 1/19/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature


-(instancetype)initWithName: (NSString *) name detail: (NSString *) detail {
    self = [super init];
    self.name = name;
    self.detail = detail;
    
    return self;
}
@end

