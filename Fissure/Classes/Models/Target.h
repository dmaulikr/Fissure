//
//  Target.h
//  Fissure
//
//  Created by Jason Fieldman on 4/21/14.
//  Copyright (c) 2014 fieldman.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Target : NSObject

@property (nonatomic, assign)   CGPoint        position;
@property (nonatomic, assign)   float          progress;
@property (nonatomic, readonly) float          hysteresis;
@property (nonatomic, readonly) float          progressPerHit;
@property (nonatomic, readonly) CFTimeInterval currentTime;
@property (nonatomic, readonly) CFTimeInterval lastHitTime;
@property (nonatomic, readonly) float          lossPerTime;

@property (nonatomic, strong, readonly) NSMutableArray *dials;
@property (nonatomic, strong, readonly) SKNode         *node;

- (id) initWithDictionary:(NSDictionary*)dictionary forSceneSize:(CGSize)sceneSize;

- (void) hitByProjectile;
- (void) updateForDuration:(CFTimeInterval)duration;

@end
