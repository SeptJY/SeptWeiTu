//
//  AppDelegate.m
//  SeptWeiTu
//
//  Created by Sept on 16/4/21.
//  Copyright © 2016年 九月. All rights reserved.
//

#import "AppDelegate.h"
#import "JYHomeController.h"
#import "BMKMapManager.h"

@interface AppDelegate () <BMKGeneralDelegate>
{
    BMKMapManager* _mapManager; 
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 要使用百度地图，先要启动BMKMapManager
    _mapManager = [[BMKMapManager alloc] init];
    
    // 如果需要关注网络及授权验证事件，请设定generalDelegate 参数为self,否则为nil
    BOOL ret = [_mapManager start:@"QHP1cW7LOWjLp2SBRzIVCAHDBGnZpnrM" generalDelegate:self];
    if (!ret) {
        NSLog(@"mapManager start failed");
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [[JYHomeController alloc] init];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

/** 监听网络状态 */
- (void)onGetNetworkState:(int)iError
{
    if (iError == 0)
    {
        NSLog(@"联网成功");
    }else
    {
        NSLog(@"联网失败");
    }
}

/** 监听key的授权认证状态 */
- (void)onGetPermissionState:(int)iError
{
    if (iError == 0)
    {
        NSLog(@"授权成功");
    }else
    {
        NSLog(@"授权失败");
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
