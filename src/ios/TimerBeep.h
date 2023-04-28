#import <Cordova/CDVPlugin.h>
#import <AudioToolbox/AudioToolbox.h>

@interface TimerBeep : CDVPlugin{
}

// The hooks for our plugin commands
- (void)playSingle:(CDVInvokedUrlCommand *)command;
- (void)playFinished:(CDVInvokedUrlCommand *)command;

@end
