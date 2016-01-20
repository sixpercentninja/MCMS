//
//  MagicalCreature.h
//  MCMS
//
//  Created by Andrew Chen on 1/19/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject

@property NSString *name;
@property NSString *detail;

-(instancetype)initWithName: (NSString *) name detail: (NSString *) detail;

@end
