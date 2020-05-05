//
//  WBBPokemon.m
//  Pokedex-C
//
//  Created by Bryce Bradshaw on 5/5/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import "WBBPokemon.h"

@implementation WBBPokemon
- (instancetype)initWithPokemonName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities spritePath:(NSString *)spritePath
{
    // can't have child with out parent, must initialize parent class
    // self (WBBPokemon) super (NSObject)
    self = [super init];
    
    if (self)// same as if (self != nil)
    {
        _name = name;
        _identifier = identifier;
        _abilities = abilities;
        _spritePath = spritePath;
    }
    return self;
}

@end


// This is replacing Codable in Swift.
@implementation WBBPokemon (JSONConvertable)

- (WBBPokemon *)initWithDictionary:(NSDictionary<NSString *,id> *)topLevelDictionary
{
   // need to pull out name, id, spritePath and abilities
    NSString *name = topLevelDictionary[@"name"];
    // let identifier = tld["id"] as? Int
    NSInteger identifier = [topLevelDictionary[@"id"] integerValue];
    NSArray *abilitiesDict = topLevelDictionary[@"abilites"];
    // let abilities:[String] = []
    NSMutableArray<NSString *> *abilities = [NSMutableArray new]; // new does alloc and init in one method
    
    // Hint for Friday
    if ([name isKindOfClass:[NSNull class]] ||
        [abilitiesDict isKindOfClass:[NSArray class]])
    {return nil;}
        
    for (NSDictionary *dictionary in abilitiesDict)
    {
        NSDictionary *abilityDict = dictionary[@"ablility"]; // 2nd level
        NSString *name = abilityDict[@"name"]; // 3rd level
        [abilities addObject:name];
    }
    
    NSString *spritePath = topLevelDictionary[@"sprites"][@"front_shiny"]; // double subscript
    // same as this just in one line
    // NSDictionary *spriteDict = topLevelDictionary[@"sprites"];
    // NSString *spritePath = spriteDict[@"front_shiny"];
    
    return [self initWithPokemonName:name identifier:identifier abilities:abilities spritePath:spritePath];
}

@end
