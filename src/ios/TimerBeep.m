#import "TimerBeep.h"

#import <Cordova/CDVAvailability.h>

@interface TimerBeep () 

  @property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation TimerBeep

- (void)pluginInitialize {
}

- (void)playSingle:(CDVInvokedUrlCommand *)command {
    [self.commandDelegate runInBackground:^{
      NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"CDVTimerBeep.bundle/single_beep" ofType:@"mp3"];
      NSURL *soundURL = [NSURL fileURLWithPath:soundPath];

      NSError *error;
      self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
      
      if (error) {
          NSLog(@"Error loading sound file: %@", [error localizedDescription]);
      } else {
          self.audioPlayer.delegate = self;
          [self.audioPlayer prepareToPlay];
          [self.audioPlayer play];
      }
    }];
}

- (void)playFinished:(CDVInvokedUrlCommand *)command {
    [self.commandDelegate runInBackground:^{
      NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"CDVTimerBeep.bundle/timer_finished" ofType:@"mp3"];
      NSURL *soundURL = [NSURL fileURLWithPath:soundPath];

      NSError *error;
      self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
      
      if (error) {
          NSLog(@"Error loading sound file: %@", [error localizedDescription]);
      } else {
          self.audioPlayer.delegate = self;
          [self.audioPlayer prepareToPlay];
          [self.audioPlayer play];
      }
    }];
}

#pragma mark - AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    self.audioPlayer = nil;
}

@end
