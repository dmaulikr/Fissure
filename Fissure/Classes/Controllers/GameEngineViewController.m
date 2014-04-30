//
//  GameEngineViewController.m
//  Fissure
//
//  Created by Jason Fieldman on 4/20/14.
//  Copyright (c) 2014 fieldman.org. All rights reserved.
//

#import "GameEngineViewController.h"
#import "FissureScene.h"

@interface GameEngineViewController ()

@end

@implementation GameEngineViewController

SINGLETON_IMPL(GameEngineViewController);

- (id)init {
	if ((self = [super init])) {

		self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width)];
		self.view.backgroundColor = [UIColor redColor];
		
		_sceneView = [[SKView alloc] initWithFrame:self.view.bounds];
		_sceneView.showsFPS = YES;
		_sceneView.showsNodeCount = NO;
		_sceneView.showsDrawCount = NO;
		_sceneView.showsPhysics   = NO;
		[self.view addSubview:_sceneView];
		
		_scene = [[FissureScene alloc] initWithSize:self.view.bounds.size];
		PersistentDictionary *d = [PersistentDictionary dictionaryWithName:@"level_info"];
		[_scene loadFromLevelDictionary:(d.dictionary[@"levels"])[@"intro-1"]];
		[_sceneView presentScene:_scene];
		
		
		/* Add buttons */
		_menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
		_menuButton.frame = CGRectMake(self.view.bounds.size.width - 40, 0, 40, 40);
		[self.view addSubview:_menuButton];
		
		UIImageView *mImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_menu"]];
		mImage.frame = CGRectMake(15, 5, 20, 20);
		mImage.alpha = 0.25;
		[_menuButton addSubview:mImage];
		
		_restartButton = [UIButton buttonWithType:UIButtonTypeCustom];
		_restartButton.frame = CGRectMake(self.view.bounds.size.width - 40, self.view.bounds.size.height - 40, 40, 40);
		[_restartButton addTarget:self action:@selector(pressedRestart:) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:_restartButton];
		
		UIImageView *rImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_restart"]];
		rImage.frame = CGRectMake(15, 15, 20, 20);
		rImage.alpha = 0.25;
		[_restartButton addSubview:rImage];
		
	}
	return self;
}

/* We don't want a status bar */
- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void) pressedRestart:(UIButton*)button {
	[_scene resetControlsToInitialPositions];
}


#pragma mark FissureSceneDelegate methods

- (void) sceneAllTargetsLit {
	[[UIApplication sharedApplication] beginIgnoringInteractionEvents];
}

- (void) sceneReadyToTransition {
	[[UIApplication sharedApplication] endIgnoringInteractionEvents];
}

@end
