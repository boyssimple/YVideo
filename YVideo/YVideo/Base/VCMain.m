//
//  VCMain.m
//  LifeChat
//
//  Created by simple on 16/4/23.
//  Copyright © 2016年 com.sean. All rights reserved.
//

#import "VCMain.h"
#import "VCNavBase.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"
@interface VCMain ()<UITabBarControllerDelegate>

@end

@implementation VCMain

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"VCHome",
                                   kTitleKey  : @"主页",
                                   kImgKey    : @"TabMessageIcon",
                                   kSelImgKey : @"TabMessageIcon"},
                                 
                                 @{kClassKey  : @"VCAttention",
                                   kTitleKey  : @"关注",
                                   kImgKey    : @"TabFriendIcon",
                                   kSelImgKey : @"TabFriendIcon"},
                                 
//                                 @{kClassKey  : @"VCPublish",
//                                   kTitleKey  : @"发布",
//                                   kImgKey    : @"TabDiscoverIcon",
//                                   kSelImgKey : @"TabDiscoverIcon"},
                                 
                                 @{kClassKey  : @"VCNewYear",
                                   kTitleKey  : @"舌尖",
                                   kImgKey    : @"TabDiscoverIcon",
                                   kSelImgKey : @"TabDiscoverIcon"},
                                 
                                 @{kClassKey  : @"VCMine",
                                   kTitleKey  : @"我的",
                                   kImgKey    : @"TabMeIcon",
                                   kSelImgKey : @"TabMeIcon"} ];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        vc.title = dict[kTitleKey];
        VCNavBase *nav = [[VCNavBase alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [UIImage imageNamed:dict[kSelImgKey]];
        [self addChildViewController:nav];
    }];
}

//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
//    NSInteger index = tabBarController.selectedIndex;
//    if (index == 0) {
//        tabBarController.navigationItem.title = @"消息";
//    }else if (index == 1){
//        tabBarController.navigationItem.title = @"好友";
//    }else if (index == 2){
//        tabBarController.navigationItem.title = @"我";
//    }
//}

@end
