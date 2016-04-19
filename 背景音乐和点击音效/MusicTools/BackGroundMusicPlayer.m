//
//  
//
//
//  Created by 李志强 on 15/8/22.
//  Copyright (c) 2015年 李志强. All rights reserved.
//

#import "BackGroundMusicPlayer.h"

static BackGroundMusicPlayer * bp;

@implementation BackGroundMusicPlayer

+(instancetype)shareBackGroundMusicPlayer:(NSString *)fileName{
    if (bp == nil) {
        bp = [[BackGroundMusicPlayer alloc] init];
        NSString * path =[[NSBundle mainBundle] pathForResource:fileName ofType:nil];
        NSURL * url = [NSURL fileURLWithPath:path];
        
        // 初始化播放器
        bp.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    }
    return bp;
}

// 开始播放
-(void)play
{
    // 设置播放器代理
    bp.player.delegate = self;
    
    [bp.player play];
}

// 停止播放
-(void)stop
{
    // 播放
    [bp.player stop];
}

// 暂停
-(void)pause
{
    [bp.player pause];
}

-(CGFloat)voice:(CGFloat)value
{
    // 如果传入音量值小于0,可以获得当前的系统音量.
    if (value < 0) {
        return bp.player.volume;
    }
    bp.player.volume = value;
    return bp.player.volume;
}

// 播放停止后继续播放
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [self play];
}
@end
