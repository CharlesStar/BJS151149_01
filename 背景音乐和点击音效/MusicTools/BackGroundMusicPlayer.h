//
//
// 
//
//  Created by 李志强 on 15/8/22.
//  Copyright (c) 2015年 李志强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


@interface BackGroundMusicPlayer : NSObject <AVAudioPlayerDelegate>
@property(nonatomic,strong)AVAudioPlayer * player;

+(instancetype)shareBackGroundMusicPlayer:(NSString *)fileName;

-(void)play;
-(void)stop;
-(void)pause;
-(CGFloat)voice:(CGFloat)value;
@end
