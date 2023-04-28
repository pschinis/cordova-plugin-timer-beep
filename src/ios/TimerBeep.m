#import "TimerBeep.h"
#import "AppDelegate.h"

#import <Cordova/CDVAvailability.h>

@implementation TimerBeep

- (void)pluginInitialize {
}

- (void)playSingle:(CDVInvokedUrlCommand *)command {
    [self playSound:@"single_beep"];
}

- (void)playFinished:(CDVInvokedUrlCommand *)command {
    [self playSound:@"timer_finished"];
}

- (void)playSound:(NSString *)resourceName {
    [self.commandDelegate runInBackground:^{
      NSString *beepString = [NSString stringWithFormat:@"CDVTimerBeep.bundle/%@", resourceName];

      NSString *soundPath = [[NSBundle mainBundle] pathForResource:beepString ofType:@"mp3"];
      NSURL *soundURL = [NSURL fileURLWithPath:soundPath];

      SystemSoundID soundID;
      AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &soundID);
      AudioServicesPlayAlertSound(soundID);
    }];
}

@end