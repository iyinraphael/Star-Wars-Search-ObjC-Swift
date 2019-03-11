//
//  LSIPerson.h
//  StarWars Search Swift-ObjC
//
//  Created by Iyin Raphael on 3/11/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIPerson : NSObject

-(instancetype) initWithName: (NSString *)name
                   birthYear: (NSString *)birthYear
                      height: (double)height
                    eyeColor: (NSString *)eyeColor;

-(instancetype)initWithDictionary: (NSDictionary *)dictionary; 

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *birthYear;
@property (nonatomic, readonly) double height;
@property (nonatomic, copy, readonly) NSString *eyeColor ;

@end

NS_ASSUME_NONNULL_END
