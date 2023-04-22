#import <Cordova/CDVPlugin.h>
#import <AVFoundation/AVFoundation.h>

@interface TimerBeep : CDVPlugin <AVAudioPlayerDelegate> {
}

// The hooks for our plugin commands
- (void)playSingle:(CDVInvokedUrlCommand *)command;
- (void)playFinished:(CDVInvokedUrlCommand *)command;

@end
