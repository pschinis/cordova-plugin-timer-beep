#import "AppDelegate+TimerBeep.h"

@implementation AppDelegate (MyPlugin)


- (void)applicationDidEnterBackground:(UIApplication *)application {
    //this is, for some reason, required for background noises to work
    __block UIBackgroundTaskIdentifier task = UIBackgroundTaskInvalid;
    task = [application beginBackgroundTaskWithName:@"time for beeps" expirationHandler:^{
        [application endBackgroundTask:task];
    }];
}

@end