//
//  WBBPokemon.h
//  Pokedex-C
//
//  Created by Bryce Bradshaw on 5/5/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WBBPokemon : NSObject

// let name: String     (this is how we do it in swift)
@property (nonatomic,readonly, copy) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, readonly, copy) NSArray<NSString *> *abilities;
// let abilities: [String]
@property (nonatomic, readonly, copy) NSString *spritePath;

// method
- (instancetype)initWithPokemonName:(NSString *)name
                         identifier:(NSInteger)identifier
                          abilities:(NSArray<NSString *>*)abilities
                         spritePath:(NSString *)spritePath;
// init(PokemonName: String, identifier: Int, abilities: [String], spritePath: String) -> WBBPokemon
@end


/* swift
 extension: WBBPokemon {
 
 }
 */
@interface WBBPokemon (JSONConvertable)
- (WBBPokemon *) initWithDictionary:(NSDictionary<NSString *, id> *)topLevelDictionary;

@end

NS_ASSUME_NONNULL_END
